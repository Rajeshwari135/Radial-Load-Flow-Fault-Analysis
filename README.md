# Radial-Load-Flow-Fault-Analysis
MATLAB implementation of Forward-Backward Sweep load flow and fault analysis for 3-bus radial distribution system
 
 📌 Overview
 
This project implements **Forward-Backward Sweep Load Flow Analysis**
for a **3-bus radial distribution system** using MATLAB.
It also includes **3-phase fault analysis** and **overcurrent relay pickup calculation**.

## ⚙️ Methodology
- Radial network modeled with line impedances
- Backward sweep: Current calculation from load to source
- Forward sweep: Voltage update from source to load
- 3-phase fault simulated at Bus 3
- Relay pickup current = 1.5 × normal load current

## 🛠 Tools Used
- MATLAB (script-based simulation)
- Power system fundamentals

## 📊 Results
- Voltage profile obtained for all buses
- Fault current calculated at Bus 3
- Relay operation condition verified

## ▶️ How to Run
1. Open `Radial_LoadFlow_Fault.m` in MATLAB
2. Click **Run**
3. Observe voltage values in Command Window and voltage profile plot

## 👩‍🎓 Author
Rajeshwari  
Electrical Engineering Undergraduate
