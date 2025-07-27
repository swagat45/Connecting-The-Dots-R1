import pathlib, json
from src.extractor import process_pdf

IN = pathlib.Path('/in')
OUT = pathlib.Path('/out')

OUT.mkdir(parents=True, exist_ok=True)

for pdf in IN.glob('*.pdf'):
    (OUT / f'{pdf.stem}.json').write_text(json.dumps(process_pdf(pdf)))
