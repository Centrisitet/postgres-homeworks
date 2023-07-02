import csv


def get_data(path):
    all_data = []
    with open(path, newline='') as f:
        reader = csv.reader(f)
        for row in reader:
            all_data.append(row)

    return all_data[1:]

