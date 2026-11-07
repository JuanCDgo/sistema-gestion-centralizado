"""
Formato de números para Argentina: punto de miles y coma decimal.
Se arma a mano (sin `locale`) porque `locale` depende de lo instalado en el sistema.
"""
from datetime import datetime, timedelta, timezone
from typing import Optional

# UTC-3 fijo (igual que TZ_AR en main.py): Argentina no tiene horario de verano desde 2009
ZONA_AR = timezone(timedelta(hours=-3))


def fmt_fecha(iso: Optional[str]) -> str:
    """'2026-10-19T01:30:00+00:00' (timestamptz de la base) -> '18/10/2026' en hora argentina."""
    if not iso:
        return "-"
    return datetime.fromisoformat(str(iso)).astimezone(ZONA_AR).strftime("%d/%m/%Y")


def _swap(texto: str) -> str:
    """Convierte '1,234.56' (en-US) en '1.234,56' (es-AR)."""
    return texto.replace(",", "_").replace(".", ",").replace("_", ".")


def fmt_moneda(valor: Optional[float]) -> str:
    """$ 2.295,00 · -$ 1.500,00 · None -> $ 0,00"""
    v = round(float(valor or 0), 2) + 0.0   # redondear antes del signo: -0,004 no es "-$ 0,00"
    signo = "-" if v < 0 else ""
    return f"{signo}$ {_swap(f'{abs(v):,.2f}')}"


def _sin_ceros(valor: Optional[float], decimales: int) -> str:
    v = round(float(valor or 0), decimales) + 0.0   # + 0.0 convierte -0.0 en 0.0
    return _swap(f"{v:,.{decimales}f}".rstrip("0").rstrip("."))


def fmt_cantidad(valor: Optional[float]) -> str:
    """1 · 4,35 · 0,25 · 1.500 (hasta 3 decimales, sin ceros sobrantes)"""
    return _sin_ceros(valor, 3)


def fmt_puntos(valor: Optional[float]) -> str:
    """1.250 · 22,95 (hasta 2 decimales: se ganan con el 1% de la venta)"""
    return _sin_ceros(valor, 2)
