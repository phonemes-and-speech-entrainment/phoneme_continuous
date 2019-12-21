 %spectrograms of an EEG trial and corresponding stimulus, plotted separately
   
   clearvars;

   load('Spectrograms_without_500ms.mat');
   load('Soundspects_no_envelope.mat');

   %first extract lengths of both sound file and EEG spectrograms to see if they correspond
   %sound file
   z = squeeze(Soundspects(22,:,:));
   t = 0.375:0.01:1.125;
   x = 1:50;
   surf(t,x,abs(z),'EdgeColor','none');   
   axis xy; axis tight; colormap(jet); view(0,90);
   
   %EEG
   z2 = squeeze(Spects(14,4,1,1,:,:));
   t2 = 0.375:0.01:1.125;
   x2 = 1:50;
   surf(t2,x2,abs(z2),'EdgeColor','none');   
   axis xy; axis tight; colormap(jet); view(0,90);
   
%spectrogram of the first EEG trial to sound file 1, for participant 2, at channel 4  
spectrogram(squeeze(Data(2,4,:,1,1)),hann(nsc),650,F,1000,'yaxis')
xlabel('Time (seconds)','FontSize',13,'FontWeight','bold');
ylabel('Frequency (Hz)','FontSize',13,'FontWeight','bold');
title('Spectrogram of single EEG trial for one participant','FontSize',15,'FontWeight','bold');
set(gca,'linewidth',1);
c = colorbar;
c.Label.FontSize = 12;
c.Label.FontWeight = 'bold';

%spectrogram of sound file 1
spectrogram(X(1,:),hann(nsc),650,F,1000,'yaxis');
xlabel('Time (seconds)','FontSize',13,'FontWeight','bold');
ylabel('Frequency (Hz)','FontSize',13,'FontWeight','bold');
title('Spectrogram of sound for corresponding EEG trial','FontSize',15,'FontWeight','bold');
set(gca,'linewidth',1);
c = colorbar;
c.Label.FontSize = 12;
c.Label.FontWeight = 'bold';
