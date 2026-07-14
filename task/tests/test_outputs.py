from pathlib import Path

def test_instruction_exists():
    assert Path("/app/instruction.md").exists() or Path("instruction.md").exists()
