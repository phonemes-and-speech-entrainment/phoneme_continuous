Experiment 1: how different categories of syllable-initial consonants affect entrainment to spoken sentences.
Contains Matlab and R code for time-frequency analyses and stats. Most variables needed to run the code can be found here. The raw data for the analyses and larger files can be found online at https://osf.io/v78dm/.

Master branch contains newer code used for the results reported in PhD thesis. There is an error in the data analysis section of the thesis (Experiment 1 chapter) which refers to computing the final spectrograms: these were done in 10 ms steps (740 ms overlap) for files of 1500 ms over which a Hanning window of 750 ms was applied.

In the early code (branch: experiment-1---natural-edges), we kept entire EEG files (2000 ms) and applied a 1000 ms Hanning window with 900 ms overlap (which I deducted to match Luo and Poeppel's method of taking the spectrogram in 100 ms steps, in their paper from 2007). Multiple methods can be compared and both benefits and caveats should be easily inferred once these methods are validated transparently over large datasets. 
