# chanvage

A command-line filter that reads numbers from standard input, computes a moving average, and optionally clamps the change from the previous output value before writing to standard output.

## Requirements

* OS: Ubuntu (tested on `ubuntu-latest` in GitHub Actions)
* Python: 3.12

## Installation

Clone the repository and ensure `chanvage` has execute permission.

```bash
$ git clone [https://github.com/s23c1129be-tech/23C1129-Repository.git](https://github.com/s23c1129be-tech/23C1129-Repository.git)
$cd 23C1129-Repository
$ chmod +x chanvage
```

## Usage

Pass numbers line by line via standard input.

```bash
$ printf "10\n20\n30\n" | ./chanvage -n 2
10.0
15.0
25.0
```

Limit the maximum change per step from the previous output value with `-m`.

```bash
$ printf "10\n20\n30\n" | ./chanvage -n 2 -m 5.0
10.0
15.0
20.0
```

## License

This project is licensed under the MIT License. See `LICENSE` for details.
