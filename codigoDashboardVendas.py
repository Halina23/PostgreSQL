import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

# 1. Configuração da Página
st.set_page_config(layout="wide")
st.title("📊 Dashboard Comercial: Análise de E-commerce")

# 2. Caminho do Arquivo (Ajustado para a sua pasta)
caminho = "Relatório de Compras.excel.csv"
df = pd.read_csv(caminho, sep=';', encoding='latin1')

# 3. Filtros na Barra Lateral
st.sidebar.header("Filtros de Pesquisa")
estados = st.sidebar.multiselect(
    "Selecione os Estados:",
    options=df['estado'].unique(),
    default=df['estado'].unique()
)

# 4. Regra de Negócio: Apenas PAGOS
df_filtrado = df[(df['estado'].isin(estados)) & (df['status'] == 'Pago')]

# 5. Métricas e Gráfico
col1, col2 = st.columns(2)
with col1:
    st.metric("Faturamento Líquido", f"R$ {df_filtrado['valor_pago'].sum():,.2f}")
with col2:
    st.metric("Pedidos Pagos", len(df_filtrado))

st.subheader("Performance por Região")
faturamento_estado = df_filtrado.groupby('estado')['valor_pago'].sum().sort_values(ascending=True)

fig, ax = plt.subplots(figsize=(10, 5))
faturamento_estado.plot(kind='barh', color='#007A3D', ax=ax)
st.pyplot(fig)
