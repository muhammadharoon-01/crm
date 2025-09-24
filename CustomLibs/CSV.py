import csv


def Get_Data_From_CSV(file_path: str) -> list[dict]:
    """
    Reads data from a CSV file and returns a list of dictionaries.

    :param file_path: Path to the CSV file.
    :return: List of rows as dictionaries with column headers as keys.
    """
    data = []
    try:
        with open(file_path, mode="rb", encoding="utf-8") as csvfile:
            reader = csv.reader(csvfile)
            for row in reader:
                data.append(row)
    except FileNotFoundError:
        print(f"Error: File '{file_path}' not found.")
    except Exception as e:
        print(f"Error reading file: {e}")

    return data