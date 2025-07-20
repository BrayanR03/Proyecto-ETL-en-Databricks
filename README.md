# 🧼 Proyecto ETL y Análisis de Datos – COSMETSAC

Este proyecto consiste en el desarrollo de un proceso ETL completo sobre archivos crudos provenientes de una empresa llamada **COSMETSAC**, dedicada a la venta de productos cosméticos.
Los datos se encuentran en archivos CSV separados (Clientes, Productos y Ventas), y presentan múltiples inconsistencias que fueron tratadas mediante transformación de datos en un entorno de Big Data.

> 🚀 Implementado con **Databricks**, **PySpark** y **Unity Catalog**.

## 📌 Objetivo General

Transformar los datos crudos en un modelo relacional limpio y gobernado, que permita realizar análisis orientados a la **fidelización de clientes**, identificando patrones de compra, preferencias por marcas y categorías, y comportamiento de pagos.

---

## 📂 Archivos de Entrada

- `CLIENTES-EMPRESA-COSMETSAC.csv`
- `PRODUCTOS-EMPRESA-COSMETSAC.csv`
- `VENTAS-EMPRESA-COSMETSAC.csv`

### Inconsistencias detectadas

**Clientes:**
- Nombres y apellidos en una sola columna con guiones.
- Prefijo internacional en el número telefónico ("51").
- Sin identificador único.

**Productos:**
- ID de productos con prefijo "P" y ceros.
- Categorías y marcas sin IDs.

**Ventas:**
- Ventas sin ID asignado.
- ID de cliente con prefijos como "C0001".
- Redundancia de información.
- Columnas Promoción y Pagos sin normalizar (faltan IDs).

---

## 🔧 Solución

Se construyó un proceso **ETL** en Databricks que incluye:

- Limpieza y transformación con **PySpark**.
- Creación de IDs únicos.
- Separación y normalización de columnas.
- Modelado de base de datos relacional simulada utilizando **Unity Catalog**.
- Escritura en formato **Delta Lake**.
---

## 🧪 Tecnologías Usadas

- [Databricks Free Edition](https://dbc-89f542f8-2df6.cloud.databricks.com/?autoLogin=true&o=758509963140561)
- PySpark
- Delta Lake
- Unity Catalog
- Notebooks en Databricks (Markdown + Código)
- Git y GitHub

---

## 👤 Sobre el Autor

**Brayan Neciosup Bolaños**   

- 🌐 [Portafolio Web](https://bryanneciosup626.wixsite.com/brayandataanalitics)
- 💼 [LinkedIn](https://www.linkedin.com/in/brayan-rafael-neciosup-bola%C3%B1os-407a59246/)
- 📬 Contacto: brayanneciosup626@gmail.com

---

## 🪪 Licencia

Este proyecto es parte de un portafolio personal con fines educativos y demostrativos. Los datos utilizados son simulados.

