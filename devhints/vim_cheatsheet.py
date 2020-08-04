

from rich.console import Console
from rich.table import Column, Table

console = Console()

table = Table(show_header=True, header_style="bold ")
table.add_column("Shortcut")
table.add_column("Description", justify="right")
# table.add_column("Production Budget", justify="right")
# table.add_column("Box Office", justify="right")
table.add_row(
    "h, j, k, l",
    "left, down, up, right",
)

table.add_row(
    "^+w + v",
    "Divide editor vertically",
)

table.add_row(
    "^+w + h/j/k/l",
    "Move to editor (left, down, up, right)"
)

console.print(table)

