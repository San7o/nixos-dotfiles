# Powertop

https://access.redhat.com/documentation/it-it/red_hat_enterprise_linux/8/html/monitoring_and_managing_system_status_and_performance/managing-power-consumption-with-powertop_monitoring-and-managing-system-status-and-performance

## The purpose of powertop
PowerTOP is a program that diagnoses issues related to power consumption and provides suggestions on how to extend battery lifetime.

The PowerTOP tool can provide an estimate of the total power usage of the system and also individual power usage for each process, device, kernel worker, timer, and interrupt handler. The tool can also identify specific components of kernel and user-space applications that frequently wake up the CPU. 


## Calibrating powertop
- On a laptop, you can calibrate the power estimation engine by running the following command:

```bash
# powertop --calibrate
```
- Let the calibration finish without interacting with the machine during the process.

- Calibration takes time because the process performs various tests, cycles through brightness levels and switches devices on and off.

- When the calibration process is completed, PowerTOP starts as normal. Let it run for approximately an hour to collect data.

- When enough data is collected, power estimation figures will be displayed in the first column of the output table.

## Powertop statistics
PowerTOP's output provides multiple tabs:

- **Overview**: In the Overview tab, you can view a list of the components that either send wakeups to the CPU most frequently or consume the most power. The items within the Overview tab, including processes, interrupts, devices, and other resources, are sorted according to their utilization.


- **Idle stats and Frequency stats**: The Idle stats tab shows usage of C-states for all processors and cores, while the Frequency stats tab shows usage of P-states including the Turbo mode, if applicable, for all processors and cores. The duration of C- or P-states is an indication of how well the CPU usage has been optimized. The longer the CPU stays in the higher C- or P-states (for example C4 is higher than C3), the better the CPU usage optimization is. Ideally, residency is 90% or more in the highest C- or P-state when the system is idle. 


- **Device stats**: The Device stats tab provides similar information to the Overview tab but only for devices.

- **Tunables**:  The Tunables tab contains PowerTOP's suggestions for optimizing the system for lower power consumption. Use the up and down keys to move through suggestions, and the enter key to toggle the suggestion on or off. 

- **WakeUp**: The WakeUp tab displays the device wakeup settings available for users to change as and when required. 

## Generating an HTML output

```bash
powertop --html=htmlfile.html
```
