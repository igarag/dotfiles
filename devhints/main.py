import click 

from rich.console import Console
from rich.table import Column, Table

console = Console()

table = Table(show_header=True, header_style="bold ")
table.add_column("Shortcut")
table.add_column("Description", justify="left")
table.add_column("Example", justify="left")

from cheatsheets.vim import cheatsheets

for cheatsheet in cheatsheets:
    table.add_row(cheatsheet[0], cheatsheet[1], cheatsheet[2])

console.print(table)


