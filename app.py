
import streamlit as st

st.set_page_config(
    page_title="Luxury Cruise Intelligence",
    page_icon="🚢",
    layout="wide"
)

st.title("🚢 Global Luxury Cruise Business, Operations & Weather Intelligence")

st.markdown("""
Explore cruise business performance using Power BI dashboards,
PostgreSQL and SQL analysis.
""")

st.caption("Portfolio project | Cruise data is simulated for demonstration.")

st.divider()

st.header("Business Performance Dashboard")

col1, col2 = st.columns(2)

with col1:
    st.subheader("Revenue & Business Impact")
    st.image(
        "https://raw.githubusercontent.com/beulafrancis/luxury-cruise-business-intelligence/main/Revenue%20%26%20Bussiness%20Impact.png",
        use_container_width=True
    )

with col2:
    st.subheader("Profitability & Operating Cost")
    st.image(
        "https://raw.githubusercontent.com/beulafrancis/luxury-cruise-business-intelligence/main/Profitablity%26%20operating%20cost.png",
        use_container_width=True
    )

st.divider()

st.header("Operations & Weather Intelligence")

col3, col4 = st.columns(2)

with col3:
    st.subheader("Operations & Time Intelligence")
    st.image(
        "https://raw.githubusercontent.com/beulafrancis/luxury-cruise-business-intelligence/main/operation%20%26%20time%20intelligence.png",
        use_container_width=True
    )

with col4:
    st.subheader("Route Change & Weather Impact")
    st.image(
        "https://raw.githubusercontent.com/beulafrancis/luxury-cruise-business-intelligence/main/Route%20change%20%26%20weather%20Impact.png",
        use_container_width=True
    )

st.divider()

st.subheader("Technology Stack")
st.write("PostgreSQL · SQL · Power BI · Python · Streamlit · GitHub")

st.markdown(
    "[View source code on GitHub](https://github.com/beulafrancis/luxury-cruise-business-intelligence)"
)
