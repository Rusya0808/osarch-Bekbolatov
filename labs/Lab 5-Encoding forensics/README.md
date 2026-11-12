# Lab 5 — Encoding forensics

## Diagnosis (before the fix)
* **Encoding:** Windows-1251 (Cyrillic single-byte code page containing Russian and Kazakh characters).
* **Line ending:** CRLF (Windows-style `0D 0A`).
* **BOM:** Absent in the original broken file. Added UTF-8 BOM in the fixed version to ensure seamless opening in Microsoft Excel by double-clicking.

## What each application was doing wrong
* **Excel:** Assumed standard system ANSI/UTF-8 without proper detection, leading to mojibake (garbled characters) for non-ASCII bytes.
* **LibreOffice Calc:** Tried to parse raw bytes using a mismatched default table, displaying unrecognized symbols.
* **cat (Linux terminal):** Rendered raw CP1251 bytes directly in a UTF-8 terminal locale, resulting in unreadable output.

## Fix
* **Method:** Automated PowerShell conversion script reading bytes with `[Text.Encoding]::GetEncoding(1251)` and writing back as UTF-8 with BOM (`[Text.UTF8Encoding($true)]`).
* **Changed:** Encoding from Windows-1251 to UTF-8; kept CRLF/standard line structure as appropriate.

## Verification
* **Fixed file:** `evidence/staff-fixed.csv`
* **Verified in:** Microsoft Excel, LibreOffice Calc, and Linux terminal (`cat`). All names (including Kazakh characters like Ә, Ғ, Қ, Ң, Ө, Ұ, Ү, Һ, І) render correctly.