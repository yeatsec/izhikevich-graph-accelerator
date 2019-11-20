

import numpy as np
import matplotlib.pyplot as plt

from izhikevich import Izhikevich

timesteps = np.arange(start=0, stop=10.0, step=0.01, dtype=float)
I = np.zeros(timesteps.shape, dtype=float)
v = np.empty(timesteps.shape, dtype=float)
u = np.empty(timesteps.shape, dtype=float)


# define the current signal
I[100:200] = -3.0
I[200:400] = 12.0
I[400:500] = -3.0
I[500:600] = 4.0
I[700:900] = 6.0

izh = Izhikevich()

for i, t in enumerate(timesteps):
	# compute Izhikevich state based on current
	izh.nextState(I[i])
	v[i], u[i] = izh.getState()

# plot
plt.figure()
plt.plot(timesteps, I, linewidth=2, color='r', label='Current Input')
plt.plot(timesteps, v, linewidth=2, color='b', label='Membrane Voltage')
plt.plot(timesteps, u, linewidth=2, color='g', label='Recovery Variable')
plt.legend(loc=1)
plt.xlabel('Time (ms)')
plt.ylabel('Voltage (mV) | Current (mA)')
plt.show()