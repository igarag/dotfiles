import importlib

import click 

from rich.console import Console
from rich.table import Column, Table

def create_table() -> Table:
    table = Table(show_header=True, header_style="bold ")
    table.add_column("Shortcut")
    table.add_column("Description", justify="left")
    table.add_column("Example", justify="left")

    return table    

def print_devhint(table: Table, tool: str) -> None:
    console = Console()

    cheatsheet_module = importlib.import_module(f"cheatsheets.{tool}")

    for cheatsheet in cheatsheet_module.cheatsheets:
        table.add_row(cheatsheet[0], cheatsheet[1], cheatsheet[2])
    console.print(table)


@click.argument("tool")
@click.command()
@click.option("--tool", type=str)
def main(tool):

    table = create_table()
    print_devhint(table, tool)


if __name__ == "__main__":
    main()
