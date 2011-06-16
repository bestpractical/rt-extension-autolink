use inc::Module::Install;

RTx('RT-Extension-AutoLink');
license('GPLv2');
all_from('lib/RT/Extension/AutoLink.pm');
readme_from('lib/RT/Extension/AutoLink.pm');

&WriteAll;
