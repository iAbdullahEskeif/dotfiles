import json
import subprocess


def process_vault_data(data):
    """
    Processes the JSON data dictionary and returns a list of tuples:
        - Each tuple contains a vault ID, name extracted from the path, and the path itself.

    Args:
        data (dict): The JSON data dictionary containing vault information.

    Returns:
        list: A list of tuples (vault_id, name, path).
    """
    vault_data = []
    for vault_id, vault_info in data.items():
        path = vault_info.get("path", "")  # Handle missing "path" key
        if path:
            # Extract last part after "/" (assuming obsidian folder)
            name = path.split("/")[-1]
            vault_data.append((vault_id, name, path))
    return vault_data


def main():
    """
    Reads the JSON file, processes the data, pipes the results into rofi for selection,
    and opens the selected vault in Obsidian.
    """
    # Replace with your actual file path
    json_file_path = "/home/aboud/.config/obsidian/obsidian.json"
    try:
        with open(json_file_path, 'r') as json_file:
            data = json.load(json_file)
            # Handle missing "vaults" key
            vault_data = process_vault_data(data.get("vaults", {}))

            # Format the output for rofi
            formatted_output = "\n".join(
                f"{name}\t{vault_id}" for vault_id, name, path in vault_data)

            # Use rofi to select a name and capture the selected line
            result = subprocess.run(["dmenu", "-l", "10", "-p", "Select vault"],
                                    input=formatted_output, text=True, capture_output=True)
            selected_line = result.stdout.strip()

            if selected_line:
                selected_vault_id = selected_line.split("\t")[1]

                # Construct the Obsidian URI
                obsidian_uri = f"obsidian://open?vault={selected_vault_id}"
                subprocess.run(["obsidian", obsidian_uri])

    except (FileNotFoundError, json.JSONDecodeError) as e:
        print(f"Error reading JSON file: {str(e)}")


if __name__ == "__main__":
    main()
