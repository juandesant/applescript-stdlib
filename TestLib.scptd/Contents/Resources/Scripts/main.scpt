FasdUAS 1.101.10   ��   ��    k             l      ��  ��   
�
� TestLib -- unit testing framework and other testing/profiling tools

About:

- TestLib's unit testing framework takes a NAME.unittest.scpt file containing one or more script objects, each representing a test suite, and each of those script objects containing one or more handlers representing individual unit tests. Test suite scripts must have `suite_` name prefixes; test handlers within those scripts must have `test_` name prefixes.

- The command line `osatest` test runner introspects the unittest script to obtain all suite and test names. For each found test it creates a new AppleScript component instance (interpreter), loads a clean copy of the unittest script into it, then calls [indirectly] TestLib's `__performunittestforsuite__` handler to run that test. The resulting `TestReport` object is then returned to `osatest` to finish generating the report for that test and print it.

Notes:

- Saving unittest scripts as compiled `.scpt` files rather than `.applescript` snippets avoids any risk of test scripts not compiling correctly when run by `osatest` - i.e. it's one less thing to go wrong.
	
- The `.unittest.scpt[d]` suffix is a convention, not a requirement, but is strongly encouraged. e.g. Future improvements to `osatest` may include the ability to search a library script bundle for any embedded unittest files and run them all automatically.



TO DO:

- should all code+terms not immediately related to unit testing be moved to a separate module (or vice-versa, moving UT code to `UnitTestLib`)? (the less risk of keyword/AE code collisions with the code being tested, the better)
	
- options for automatically spiking TIDs and considering/ignoring options before calling `test_NAME` handler; also, what about an option for composing/decomposing unicode (assuming that's an issue in AS/Cocoa, e.g. when comparing/sorting AS/NS strings); note that localization is harder to spike, but should be done if possible as it affects date and number coercions

- what other assert test options (e.g. `is in`, `is not`, etc)? best solution would be to pass an `assert [is/is not/is in/is not in/is type/is not type/etc] comparator` script object that performs the appropriate test as an additional parameter; that avoids adding lots of optional params for each comparison type (most of which are rarely used), which would bloat the API and be non-extensible; in particular, asserting a script object-based result will most likely require a custom checker (otherwise checking each detail would require a separate assert, since script objects don't compare for logical equivalence, only identify); ditto when result being checked is an ASOC ocid specifier (in which case the other value should be checked to see if it's also an ocid, and if it is then use `(v1's isEqual: v2)`)

      � 	 	�   T e s t L i b   - -   u n i t   t e s t i n g   f r a m e w o r k   a n d   o t h e r   t e s t i n g / p r o f i l i n g   t o o l s 
 
 A b o u t : 
 
 -   T e s t L i b ' s   u n i t   t e s t i n g   f r a m e w o r k   t a k e s   a   N A M E . u n i t t e s t . s c p t   f i l e   c o n t a i n i n g   o n e   o r   m o r e   s c r i p t   o b j e c t s ,   e a c h   r e p r e s e n t i n g   a   t e s t   s u i t e ,   a n d   e a c h   o f   t h o s e   s c r i p t   o b j e c t s   c o n t a i n i n g   o n e   o r   m o r e   h a n d l e r s   r e p r e s e n t i n g   i n d i v i d u a l   u n i t   t e s t s .   T e s t   s u i t e   s c r i p t s   m u s t   h a v e   ` s u i t e _ `   n a m e   p r e f i x e s ;   t e s t   h a n d l e r s   w i t h i n   t h o s e   s c r i p t s   m u s t   h a v e   ` t e s t _ `   n a m e   p r e f i x e s . 
 
 -   T h e   c o m m a n d   l i n e   ` o s a t e s t `   t e s t   r u n n e r   i n t r o s p e c t s   t h e   u n i t t e s t   s c r i p t   t o   o b t a i n   a l l   s u i t e   a n d   t e s t   n a m e s .   F o r   e a c h   f o u n d   t e s t   i t   c r e a t e s   a   n e w   A p p l e S c r i p t   c o m p o n e n t   i n s t a n c e   ( i n t e r p r e t e r ) ,   l o a d s   a   c l e a n   c o p y   o f   t h e   u n i t t e s t   s c r i p t   i n t o   i t ,   t h e n   c a l l s   [ i n d i r e c t l y ]   T e s t L i b ' s   ` _ _ p e r f o r m u n i t t e s t f o r s u i t e _ _ `   h a n d l e r   t o   r u n   t h a t   t e s t .   T h e   r e s u l t i n g   ` T e s t R e p o r t `   o b j e c t   i s   t h e n   r e t u r n e d   t o   ` o s a t e s t `   t o   f i n i s h   g e n e r a t i n g   t h e   r e p o r t   f o r   t h a t   t e s t   a n d   p r i n t   i t . 
 
 N o t e s : 
 
 -   S a v i n g   u n i t t e s t   s c r i p t s   a s   c o m p i l e d   ` . s c p t `   f i l e s   r a t h e r   t h a n   ` . a p p l e s c r i p t `   s n i p p e t s   a v o i d s   a n y   r i s k   o f   t e s t   s c r i p t s   n o t   c o m p i l i n g   c o r r e c t l y   w h e n   r u n   b y   ` o s a t e s t `   -   i . e .   i t ' s   o n e   l e s s   t h i n g   t o   g o   w r o n g . 
 	 
 -   T h e   ` . u n i t t e s t . s c p t [ d ] `   s u f f i x   i s   a   c o n v e n t i o n ,   n o t   a   r e q u i r e m e n t ,   b u t   i s   s t r o n g l y   e n c o u r a g e d .   e . g .   F u t u r e   i m p r o v e m e n t s   t o   ` o s a t e s t `   m a y   i n c l u d e   t h e   a b i l i t y   t o   s e a r c h   a   l i b r a r y   s c r i p t   b u n d l e   f o r   a n y   e m b e d d e d   u n i t t e s t   f i l e s   a n d   r u n   t h e m   a l l   a u t o m a t i c a l l y . 
 
 
 
 T O   D O : 
 
 -   s h o u l d   a l l   c o d e + t e r m s   n o t   i m m e d i a t e l y   r e l a t e d   t o   u n i t   t e s t i n g   b e   m o v e d   t o   a   s e p a r a t e   m o d u l e   ( o r   v i c e - v e r s a ,   m o v i n g   U T   c o d e   t o   ` U n i t T e s t L i b ` ) ?   ( t h e   l e s s   r i s k   o f   k e y w o r d / A E   c o d e   c o l l i s i o n s   w i t h   t h e   c o d e   b e i n g   t e s t e d ,   t h e   b e t t e r ) 
 	 
 -   o p t i o n s   f o r   a u t o m a t i c a l l y   s p i k i n g   T I D s   a n d   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   b e f o r e   c a l l i n g   ` t e s t _ N A M E `   h a n d l e r ;   a l s o ,   w h a t   a b o u t   a n   o p t i o n   f o r   c o m p o s i n g / d e c o m p o s i n g   u n i c o d e   ( a s s u m i n g   t h a t ' s   a n   i s s u e   i n   A S / C o c o a ,   e . g .   w h e n   c o m p a r i n g / s o r t i n g   A S / N S   s t r i n g s ) ;   n o t e   t h a t   l o c a l i z a t i o n   i s   h a r d e r   t o   s p i k e ,   b u t   s h o u l d   b e   d o n e   i f   p o s s i b l e   a s   i t   a f f e c t s   d a t e   a n d   n u m b e r   c o e r c i o n s 
 
 -   w h a t   o t h e r   a s s e r t   t e s t   o p t i o n s   ( e . g .   ` i s   i n ` ,   ` i s   n o t ` ,   e t c ) ?   b e s t   s o l u t i o n   w o u l d   b e   t o   p a s s   a n   ` a s s e r t   [ i s / i s   n o t / i s   i n / i s   n o t   i n / i s   t y p e / i s   n o t   t y p e / e t c ]   c o m p a r a t o r `   s c r i p t   o b j e c t   t h a t   p e r f o r m s   t h e   a p p r o p r i a t e   t e s t   a s   a n   a d d i t i o n a l   p a r a m e t e r ;   t h a t   a v o i d s   a d d i n g   l o t s   o f   o p t i o n a l   p a r a m s   f o r   e a c h   c o m p a r i s o n   t y p e   ( m o s t   o f   w h i c h   a r e   r a r e l y   u s e d ) ,   w h i c h   w o u l d   b l o a t   t h e   A P I   a n d   b e   n o n - e x t e n s i b l e ;   i n   p a r t i c u l a r ,   a s s e r t i n g   a   s c r i p t   o b j e c t - b a s e d   r e s u l t   w i l l   m o s t   l i k e l y   r e q u i r e   a   c u s t o m   c h e c k e r   ( o t h e r w i s e   c h e c k i n g   e a c h   d e t a i l   w o u l d   r e q u i r e   a   s e p a r a t e   a s s e r t ,   s i n c e   s c r i p t   o b j e c t s   d o n ' t   c o m p a r e   f o r   l o g i c a l   e q u i v a l e n c e ,   o n l y   i d e n t i f y ) ;   d i t t o   w h e n   r e s u l t   b e i n g   c h e c k e d   i s   a n   A S O C   o c i d   s p e c i f i e r   ( i n   w h i c h   c a s e   t h e   o t h e r   v a l u e   s h o u l d   b e   c h e c k e d   t o   s e e   i f   i t ' s   a l s o   a n   o c i d ,   a n d   i f   i t   i s   t h e n   u s e   ` ( v 1 ' s   i s E q u a l :   v 2 ) ` ) 
 
     
  
 l     ��������  ��  ��        j     �� �� 0 _supportlib _supportLib  N        4     �� 
�� 
scpt  m       �   " L i b r a r y S u p p o r t L i b      l     ��������  ��  ��        l          j    �� �� 0 _testsupport _TestSupport  N       4    �� 
�� 
scpt  m   	 
   �    T e s t S u p p o r t  ] W sub-library embedded in TestLib.scptd (let's hope AS gets the search path order right)     �   �   s u b - l i b r a r y   e m b e d d e d   i n   T e s t L i b . s c p t d   ( l e t ' s   h o p e   A S   g e t s   t h e   s e a r c h   p a t h   o r d e r   r i g h t )     !   l     ��������  ��  ��   !  " # " x    �� $����   $ 4    �� %
�� 
frmk % m     & & � ' '  F o u n d a t i o n��   #  ( ) ( l     ��������  ��  ��   )  * + * x    %�� ,����   , 2   ��
�� 
osax��   +  - . - l     ��������  ��  ��   .  / 0 / l     ��������  ��  ��   0  1 2 1 l     �� 3 4��   3 J D--------------------------------------------------------------------    4 � 5 5 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 2  6 7 6 l     �� 8 9��   8   Test Utilities    9 � : :    T e s t   U t i l i t i e s 7  ; < ; l     ��������  ��  ��   <  = > = i  % ( ? @ ? I      �� A���� 0 
randomword 
randomWord A  B C B o      ���� 0 	minlength 	minLength C  D�� D o      ���� 0 	maxlength 	maxLength��  ��   @ l    ' E F G E k     ' H H  I J I r      K L K m      M M � N N   L o      ���� 0 s   J  O P O U    $ Q R Q r     S T S b     U V U o    ���� 0 s   V n     W X W 3    ��
�� 
cobj X m     Y Y � Z Z 4 a b c d e f g h i j k l m n o p q r s t u v w x y z T o      ���� 0 s   R l    [���� [ I    \�� ] \ z����
�� .sysorandnmbr    ��� nmbr
�� misccura��   ] �� ^ _
�� 
from ^ o    ���� 0 	minlength 	minLength _ �� `��
�� 
to   ` o    ���� 0 	maxlength 	maxLength��  ��  ��   P  a�� a L   % ' b b o   % &���� 0 s  ��   F R L TO DO: can this be turned into a genuinely useful test tool? if not, delete    G � c c �   T O   D O :   c a n   t h i s   b e   t u r n e d   i n t o   a   g e n u i n e l y   u s e f u l   t e s t   t o o l ?   i f   n o t ,   d e l e t e >  d e d l     ��������  ��  ��   e  f g f l     �� h i��   h J D--------------------------------------------------------------------    i � j j � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - g  k l k l     �� m n��   m   Timing/Profiling    n � o o "   T i m i n g / P r o f i l i n g l  p q p l     ��������  ��  ��   q  r s r i  ) , t u t I     �� v��
�� .���:MTmrnull��� ��� ctxt v |���� w�� x��  ��   w o      ���� 0 nametext nameText��   x l      y���� y m       z z � { {  ��  ��  ��   u h     �� |�� 0 timerobject TimerObject | k       } }  ~  ~ l     �� � ���   � � � note: AS can't serialize ASOC objects when [auto-]saving scripts, so store start and end times as NSTimeInterval (Double/real) to avoid any complaints    � � � �.   n o t e :   A S   c a n ' t   s e r i a l i z e   A S O C   o b j e c t s   w h e n   [ a u t o - ] s a v i n g   s c r i p t s ,   s o   s t o r e   s t a r t   a n d   e n d   t i m e s   a s   N S T i m e I n t e r v a l   ( D o u b l e / r e a l )   t o   a v o i d   a n y   c o m p l a i n t s   � � � x     �� �����   � 4    �� �
�� 
frmk � m     � � � � �  F o u n d a t i o n��   �  � � � j    �� ��� 0 
_starttime 
_startTime � m    ��
�� 
msng �  � � � j    �� ��� 0 _totalseconds _totalSeconds � m     � �          �  � � � j    �� ��� 0 
_isrunning 
_isRunning � m    ��
�� boovfals �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �������� 0 	timername 	timerName��  ��   � L      � � o     ���� 0 nametext nameText �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �������� 0 
starttimer 
startTimer��  ��   � k     ' � �  � � � Z     � ����� � o     ���� 0 
_isrunning 
_isRunning � L    
����  ��  ��   �  � � � r     � � � m    ��
�� boovtrue � o      ���� 0 
_isrunning 
_isRunning �  � � � r    $ � � � n    � � � I    �������� @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate��  ��   � n    � � � o    ���� 0 nsdate NSDate � m    ��
�� misccura � o      ���� 0 
_starttime 
_startTime �  ��� � L   % ' � �  f   % &��   �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �������� 0 	stoptimer 	stopTimer��  ��   � k     8 � �  � � � Z     � ����� � H      � � o     ���� 0 
_isrunning 
_isRunning � L   	  � � m   	 
����  ��  ��   �  � � � r     � � � \     � � � l    ����� � n    � � � I    �������� @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate��  ��   � n    � � � o    ���� 0 nsdate NSDate � m    ��
�� misccura��  ��   � o    ���� 0 
_starttime 
_startTime � o      ���� 0 elapsedtime elapsedTime �  � � � r     - � � � [     ' � � � o     %���� 0 _totalseconds _totalSeconds � o   % &�� 0 elapsedtime elapsedTime � o      �~�~ 0 _totalseconds _totalSeconds �  � � � r   . 5 � � � m   . /�}
�} boovfals � o      �|�| 0 
_isrunning 
_isRunning �  ��{ � L   6 8 � � o   6 7�z�z 0 elapsedtime elapsedTime�{   �  � � � l     �y�x�w�y  �x  �w   �  � � � i    # � � � I      �v�u�t�v 0 elapsedtime elapsedTime�u  �t   � Z      � ��s � � o     �r�r 0 
_isrunning 
_isRunning � L     � � \     � � � l    ��q�p � n    � � � I   	 �o�n�m�o @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate�n  �m   � o    	�l�l 0 nsdate NSDate�q  �p   � o    �k�k 0 
_starttime 
_startTime�s   � L     � � m    �j�j   �  � � � l     �i�h�g�i  �h  �g   �  ��f � i  $ ' � � � I      �e�d�c�e 0 	totaltime 	totalTime�d  �c   � Z      � ��b � � o     �a�a 0 
_isrunning 
_isRunning � L     � � [     � � � o    �`�` 0 _totalseconds _totalSeconds � I    �_�^�]�_ 0 elapsedtime elapsedTime�^  �]  �b   � L     � � o    �\�\ 0 _totalseconds _totalSeconds�f   s  � � � l     �[�Z�Y�[  �Z  �Y   �  � � � l     �X�W�V�X  �W  �V   �  � � � l     �U � ��U   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �T � ��T   �   Unit Test Framework    � �   (   U n i t   T e s t   F r a m e w o r k �  l     �S�R�Q�S  �R  �Q    l      j   - /�P�P 00 _abortedassertionerror _AbortedAssertionError m   - .�O�OA P J raised by `assert�` handlers upon failed assertion to terminate that test    �		 �   r a i s e d   b y   ` a s s e r t & `   h a n d l e r s   u p o n   f a i l e d   a s s e r t i o n   t o   t e r m i n a t e   t h a t   t e s t 

 l     �N�M�L�N  �M  �L    h   0 7�K�K 00 _abortedassertiontoken _AbortedAssertionToken l     �J�J  ,& when raising error number AbortedAssertionError, the `from` parameter should carry this unique identifier to confirm error was raised by TestLib, and isn't merely an error in the test code/code being tested that happens to use the same error number (in which case it should be treated as such)    �L   w h e n   r a i s i n g   e r r o r   n u m b e r   A b o r t e d A s s e r t i o n E r r o r ,   t h e   ` f r o m `   p a r a m e t e r   s h o u l d   c a r r y   t h i s   u n i q u e   i d e n t i f i e r   t o   c o n f i r m   e r r o r   w a s   r a i s e d   b y   T e s t L i b ,   a n d   i s n ' t   m e r e l y   a n   e r r o r   i n   t h e   t e s t   c o d e / c o d e   b e i n g   t e s t e d   t h a t   h a p p e n s   t o   u s e   t h e   s a m e   e r r o r   n u m b e r   ( i n   w h i c h   c a s e   i t   s h o u l d   b e   t r e a t e d   a s   s u c h )  l     �I�H�G�I  �H  �G    l      j   8 <�F�F 0 _isequaldelta _isEqualDelta m   8 ; >.�&֕ � � allow for limited precision when asserting real results -- TO DO: move into custom comparator object (see also TODOs in `assert...` handlers below)    �(   a l l o w   f o r   l i m i t e d   p r e c i s i o n   w h e n   a s s e r t i n g   r e a l   r e s u l t s   - -   T O   D O :   m o v e   i n t o   c u s t o m   c o m p a r a t o r   o b j e c t   ( s e e   a l s o   T O D O s   i n   ` a s s e r t . . . `   h a n d l e r s   b e l o w )  l     �E�D�C�E  �D  �C    l     �B !�B    L F the following are set/unset by __performunittestforsuite__ as it runs   ! �"" �   t h e   f o l l o w i n g   a r e   s e t / u n s e t   b y   _ _ p e r f o r m u n i t t e s t f o r s u i t e _ _   a s   i t   r u n s #$# l     �A�@�?�A  �@  �?  $ %&% l     '()' j   = A�>*�> $0 _testsuiteobject _testSuiteObject* m   = @�=
�= 
msng( � � the test suite object that was passed to `perform unit test`; assigned and cleared at start and end of `perform unit test`; may be used by assert handlers (e.g. `assert test error` uses it when calling a `call_NAME` handler)   ) �++�   t h e   t e s t   s u i t e   o b j e c t   t h a t   w a s   p a s s e d   t o   ` p e r f o r m   u n i t   t e s t ` ;   a s s i g n e d   a n d   c l e a r e d   a t   s t a r t   a n d   e n d   o f   ` p e r f o r m   u n i t   t e s t ` ;   m a y   b e   u s e d   b y   a s s e r t   h a n d l e r s   ( e . g .   ` a s s e r t   t e s t   e r r o r `   u s e s   i t   w h e n   c a l l i n g   a   ` c a l l _ N A M E `   h a n d l e r )& ,-, l     �<�;�:�<  �;  �:  - ./. l     0120 j   B F�93�9 0 _testreport _testReport3 m   B E�8
�8 
msng1 x r a single test_NAME handler may perform multiple asserts, the result of each is recorded in TestReport object here   2 �44 �   a   s i n g l e   t e s t _ N A M E   h a n d l e r   m a y   p e r f o r m   m u l t i p l e   a s s e r t s ,   t h e   r e s u l t   o f   e a c h   i s   r e c o r d e d   i n   T e s t R e p o r t   o b j e c t   h e r e/ 565 l     �7�6�5�7  �6  �5  6 787 l     9:;9 j   G K�4<�4 $0 _testhandlername _testHandlerName< m   G J�3
�3 
msng: R L used to generate default `call_NAME` handler name for a `test_NAME` handler   ; �== �   u s e d   t o   g e n e r a t e   d e f a u l t   ` c a l l _ N A M E `   h a n d l e r   n a m e   f o r   a   ` t e s t _ N A M E `   h a n d l e r8 >?> l     �2�1�0�2  �1  �0  ? @A@ l     �/BC�/  B  -------   C �DD  - - - - - - -A EFE l     �.GH�.  G ) # execute a single test_NAME handler   H �II F   e x e c u t e   a   s i n g l e   t e s t _ N A M E   h a n d l e rF JKJ l     �-LM�-  L ] W (called by `osatest` via a code-generated glue handler it adds to the unittest script)   M �NN �   ( c a l l e d   b y   ` o s a t e s t `   v i a   a   c o d e - g e n e r a t e d   g l u e   h a n d l e r   i t   a d d s   t o   t h e   u n i t t e s t   s c r i p t )K OPO l     �,�+�*�,  �+  �*  P QRQ i  L OSTS I      �)U�(�) 0 __performunittestforsuite__  U VWV o      �'�' 0 suiteobject suiteObjectW X�&X J      YY Z[Z o      �%�% 0 	suitename 	suiteName[ \]\ o      �$�$ 0 handlername handlerName] ^_^ o      �#�# 0 handlerkeys handlerKeys_ `�"` o      �!�! 0 isstyled isStyled�"  �&  �(  T k    "aa bcb l      � de�   dQK
		suiteObject : script -- test suite object
		suiteName : text -- test suite name, for reporting use
		handlerName : text -- name of the test suite handler to call
		allHandlerNames : list of text -- all handler names in this test suite; used to determine which if any fixture methods (setUp, tearDown, etc.) need to be called
		isStyled : boolean -- if true, the returned report will include special formatting codes (bold, underline) to improve presentation in Terminal.app and other VT100 emulators; use false if you intend to use this text elsewhere
		Result: script -- TestReport
	   e �ff� 
 	 	 s u i t e O b j e c t   :   s c r i p t   - -   t e s t   s u i t e   o b j e c t 
 	 	 s u i t e N a m e   :   t e x t   - -   t e s t   s u i t e   n a m e ,   f o r   r e p o r t i n g   u s e 
 	 	 h a n d l e r N a m e   :   t e x t   - -   n a m e   o f   t h e   t e s t   s u i t e   h a n d l e r   t o   c a l l 
 	 	 a l l H a n d l e r N a m e s   :   l i s t   o f   t e x t   - -   a l l   h a n d l e r   n a m e s   i n   t h i s   t e s t   s u i t e ;   u s e d   t o   d e t e r m i n e   w h i c h   i f   a n y   f i x t u r e   m e t h o d s   ( s e t U p ,   t e a r D o w n ,   e t c . )   n e e d   t o   b e   c a l l e d 
 	 	 i s S t y l e d   :   b o o l e a n   - -   i f   t r u e ,   t h e   r e t u r n e d   r e p o r t   w i l l   i n c l u d e   s p e c i a l   f o r m a t t i n g   c o d e s   ( b o l d ,   u n d e r l i n e )   t o   i m p r o v e   p r e s e n t a t i o n   i n   T e r m i n a l . a p p   a n d   o t h e r   V T 1 0 0   e m u l a t o r s ;   u s e   f a l s e   i f   y o u   i n t e n d   t o   u s e   t h i s   t e x t   e l s e w h e r e 
 	 	 R e s u l t :   s c r i p t   - -   T e s t R e p o r t 
 	c ghg r     iji o     �� 0 suiteobject suiteObjectj o      �� $0 _testsuiteobject _testSuiteObjecth klk r    mnm o    	�� 0 handlername handlerNamen o      �� $0 _testhandlername _testHandlerNamel opo r    "qrq n   sts I    �u��  0 maketestreport makeTestReportu vwv o    �� 0 	suitename 	suiteNamew xyx o    �� 0 handlername handlerNamey z�z o    �� 0 isstyled isStyled�  �  t o    �� 0 _testsupport _TestSupportr o      �� 0 _testreport _testReportp {|{ Q   # l}~} Z  & 7����� E   & +��� o   & '�� 0 handlerkeys handlerKeys� J   ' *�� ��� m   ' (�� ��� 
 s e t u p�  � n  . 3��� I   / 3���� 0 setup setUp�  �  � o   . /�� 0 suiteobject suiteObject�  �  ~ R      ���
� .ascrerr ****      � ****� o      �
�
 0 etext eText� �	��
�	 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo� ���
� 
ptlr� o      �� 0 epartial ePartial�   k   ? l�� ��� n  ? ]��� I   D ]� ����  0 	addbroken 	addBroken� ��� m   D E�� ���   s e t U p    f a i l e d� ��� m   E F�� ���  � ���� l 	 F Y������ J   F Y�� ���� J   F W�� ��� m   F G�� ���   u n e x p e c t e d   e r r o r� ���� n  G U��� I   L U������� .0 makecaughterrorrecord makeCaughtErrorRecord� ��� o   L M���� 0 etext eText� ��� o   M N���� 0 enumber eNumber� ��� o   N O���� 0 efrom eFrom� ��� o   O P���� 
0 eto eTo� ���� o   P Q���� 0 epartial ePartial��  ��  � o   G L���� 0 _testsupport _TestSupport��  ��  ��  ��  ��  ��  � o   ? D���� 0 _testreport _testReport� ��� r   ^ e��� m   ^ _��
�� 
msng� o      ���� $0 _testsuiteobject _testSuiteObject� ���� L   f l�� o   f k���� 0 _testreport _testReport��  | ��� r   m z��� n  m x��� I   r x�������  0 makecallobject makeCallObject� ��� o   r s���� 0 handlername handlerName� ���� m   s t����  ��  ��  � o   m r���� 0 _testsupport _TestSupport� o      ���� 0 
callobject 
callObject� ��� Q   { ����� n  ~ ���� I    �������� 0 dotest doTest� ��� o    ����� 0 suiteobject suiteObject� ���� m   � ���
�� 
msng��  ��  � o   ~ ���� 0 
callobject 
callObject� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� ����
�� 
errt� o      ���� 
0 eto eTo� �����
�� 
ptlr� o      ���� 0 epartial ePartial��  � l  � ����� Z   � �������� H   � ��� l  � ������� F   � ���� =   � ���� o   � ����� 0 enumber eNumber� o   � ����� 00 _abortedassertionerror _AbortedAssertionError� =  � ���� o   � ����� 0 efrom eFrom� o   � ����� 00 _abortedassertiontoken _AbortedAssertionToken��  ��  � l  � ����� l  � ����� n  � ���� I   � �������� 0 
addfailure 
addFailure� ��� b   � ���� b   � ���� m   � ��� ���  � o   � ����� 0 handlername handlerName� m   � ��� ���     f a i l e d� ��� m   � ��� ���  � ���� l 	 � � ����  J   � � �� J   � �  m   � � �   u n e x p e c t e d   e r r o r �� n  � �	
	 I   � ������� .0 makecaughterrorrecord makeCaughtErrorRecord  o   � ����� 0 etext eText  o   � ����� 0 enumber eNumber  o   � ����� 0 efrom eFrom  o   � ����� 
0 eto eTo �� o   � ����� 0 epartial ePartial��  ��  
 o   � ����� 0 _testsupport _TestSupport��  ��  ��  ��  ��  ��  � o   � ����� 0 _testreport _testReport��� TO DO: without stack trace support, there's no way to distinguish an error raised by the code being tested versus an error caused by a bug in the test code, so we can only say error was 'unexpected' and leave user to figure out why; allowing `call_NAME` handlers to be used by `assert test result` would give users the opportunity to box up the code being tested allowing TestLib to distinguish the cause   � �*   T O   D O :   w i t h o u t   s t a c k   t r a c e   s u p p o r t ,   t h e r e ' s   n o   w a y   t o   d i s t i n g u i s h   a n   e r r o r   r a i s e d   b y   t h e   c o d e   b e i n g   t e s t e d   v e r s u s   a n   e r r o r   c a u s e d   b y   a   b u g   i n   t h e   t e s t   c o d e ,   s o   w e   c a n   o n l y   s a y   e r r o r   w a s   ' u n e x p e c t e d '   a n d   l e a v e   u s e r   t o   f i g u r e   o u t   w h y ;   a l l o w i n g   ` c a l l _ N A M E `   h a n d l e r s   t o   b e   u s e d   b y   ` a s s e r t   t e s t   r e s u l t `   w o u l d   g i v e   u s e r s   t h e   o p p o r t u n i t y   t o   b o x   u p   t h e   c o d e   b e i n g   t e s t e d   a l l o w i n g   T e s t L i b   t o   d i s t i n g u i s h   t h e   c a u s e� � � check if failure was already reported, and this is the subsequent abort, in which case ignore; if not, it's an error in either the test_NAME handler or the code being tested, so report it   � �x   c h e c k   i f   f a i l u r e   w a s   a l r e a d y   r e p o r t e d ,   a n d   t h i s   i s   t h e   s u b s e q u e n t   a b o r t ,   i n   w h i c h   c a s e   i g n o r e ;   i f   n o t ,   i t ' s   a n   e r r o r   i n   e i t h e r   t h e   t e s t _ N A M E   h a n d l e r   o r   t h e   c o d e   b e i n g   t e s t e d ,   s o   r e p o r t   i t��  ��  �   test failed   � �    t e s t   f a i l e d�  Q   � Z  � ����� E   � �  o   � ����� 0 handlerkeys handlerKeys  J   � �!! "��" m   � �## �$$  t e a r d o w n��   n  � �%&% I   � ��������� 0 teardown tearDown��  ��  & o   � ����� 0 suiteobject suiteObject��  ��   R      ��'(
�� .ascrerr ****      � ****' o      ���� 0 etext eText( ��)*
�� 
errn) o      ���� 0 enumber eNumber* ��+,
�� 
erob+ o      ���� 0 efrom eFrom, ��-.
�� 
errt- o      ���� 
0 eto eTo. ��/��
�� 
ptlr/ o      ���� 0 epartial ePartial��   n  �010 I   ���2���� 0 	addbroken 	addBroken2 343 m   � �55 �66 "  t e a r D o w n    f a i l e d4 787 m   � �99 �::  8 ;��; l 	 �<����< J   �== >��> J   �?? @A@ m   � �BB �CC   u n e x p e c t e d   e r r o rA D��D n  �EFE I  ��G���� .0 makecaughterrorrecord makeCaughtErrorRecordG HIH o  ���� 0 etext eTextI JKJ o  ���� 0 enumber eNumberK LML o  ���� 0 efrom eFromM NON o  ���� 
0 eto eToO P��P o  ���� 0 epartial ePartial��  ��  F o   ����� 0 _testsupport _TestSupport��  ��  ��  ��  ��  ��  1 o   � ����� 0 _testreport _testReport QRQ r  STS m  ��
�� 
msngT o      ���� $0 _testsuiteobject _testSuiteObjectR U��U l "VWXV L  "YY o  !���� 0 _testreport _testReportW�{ TO DO: wrapping all the test data (result values, error info, status, etc) in a script object and returning that preserves AS context info and AS types across the AE bridge; the script object can then be loaded into a new OSAID and its methods called to extract each bit of data in turn for formatting and final message generation  (caveat not sure what ocids and optrs will do)   X �ZZ�   T O   D O :   w r a p p i n g   a l l   t h e   t e s t   d a t a   ( r e s u l t   v a l u e s ,   e r r o r   i n f o ,   s t a t u s ,   e t c )   i n   a   s c r i p t   o b j e c t   a n d   r e t u r n i n g   t h a t   p r e s e r v e s   A S   c o n t e x t   i n f o   a n d   A S   t y p e s   a c r o s s   t h e   A E   b r i d g e ;   t h e   s c r i p t   o b j e c t   c a n   t h e n   b e   l o a d e d   i n t o   a   n e w   O S A I D   a n d   i t s   m e t h o d s   c a l l e d   t o   e x t r a c t   e a c h   b i t   o f   d a t a   i n   t u r n   f o r   f o r m a t t i n g   a n d   f i n a l   m e s s a g e   g e n e r a t i o n     ( c a v e a t   n o t   s u r e   w h a t   o c i d s   a n d   o p t r s   w i l l   d o )��  R [\[ l     ��������  ��  ��  \ ]^] l     ��������  ��  ��  ^ _`_ l     ��ab��  a J D--------------------------------------------------------------------   b �cc � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -` ded l     ��fg��  f y s Unit Test Assertions -- TO DO: how best to indicate test type in messages (standard `is`, or custom `is in`, etc.)   g �hh �   U n i t   T e s t   A s s e r t i o n s   - -   T O   D O :   h o w   b e s t   t o   i n d i c a t e   t e s t   t y p e   i n   m e s s a g e s   ( s t a n d a r d   ` i s ` ,   o r   c u s t o m   ` i s   i n ` ,   e t c . )e iji l     ��������  ��  ��  j klk i  P Smnm I     ����o
�� .���:AsRenull��� ��� null��  o ��pq
�� 
Valup o      ���� 0 actualresult actualResultq ��rs
�� 
Equar o      ����  0 expectedresult expectedResults ��tu
�� 
Summt |��~v�}w�  �~  v o      �|�| 0 testnote testNote�}  w l     x�{�zx m      yy �zz  �{  �z  u �y{�x
�y 
FCmp{ |�w�v|�u}�w  �v  | o      �t�t $0 hasrealtolerance hasRealTolerance�u  } l     ~�s�r~ m      �q
�q boovfals�s  �r  �x  n k     ��� Z    ���p�o� =    ��� o     �n�n $0 _testsuiteobject _testSuiteObject� m    �m
�m 
msng� R   
 �l��
�l .ascrerr ****      � ****� m    �� ��� d C a n n o t    a s s e r t   t e s t   r e s u l t    o u t s i d e   o f   u n i t   t e s t s .� �k��j
�k 
errn� m    �i�i�T�j  �p  �o  � ��h� P   ���� k   �� ��� Q    ����� k    ��� ��� r    *��� n   (��� I   " (�g��f�g "0 astextparameter asTextParameter� ��� o   " #�e�e 0 testnote testNote� ��d� m   # $�� ���  s u m m a r y�d  �f  � o    "�c�c 0 _supportlib _supportLib� o      �b�b 0 testnote testNote� ��� r   + 8��� n  + 6��� I   0 6�a��`�a (0 asbooleanparameter asBooleanParameter� ��� o   0 1�_�_ $0 hasrealtolerance hasRealTolerance� ��^� m   1 2�� ���  r e a l   c o m p a r i s o n�^  �`  � o   + 0�]�] 0 _supportlib _supportLib� o      �\�\ $0 hasrealtolerance hasRealTolerance� ��� Z  9 l���[�Z� F   9 K��� o   9 :�Y�Y $0 hasrealtolerance hasRealTolerance� H   = I�� n  = H��� I   B H�X��W�X 0 istype isType� ��� o   B C�V�V  0 expectedresult expectedResult� ��U� m   C D�T
�T 
nmbr�U  �W  � o   = B�S�S 0 _testsupport _TestSupport� R   N h�R��
�R .ascrerr ****      � ****� b   Z g��� b   Z c��� m   Z ]�� ��� � B a d    i s    p a r a m e t e r   ( r e a l   c o m p a r i s o n   r e q u i r e s   n u m e r i c    i s    p a r a m e t e r   b u t   r e c e i v e d  � n  ] b��� m   ^ b�Q
�Q 
pcls� o   ] ^�P�P  0 expectedresult expectedResult� m   c f�� ���  )� �O��
�O 
errn� m   P Q�N�N�Y� �M��
�M 
erob� o   R S�L�L  0 expectedresult expectedResult� �K��J
�K 
errt� m   T W�I
�I 
doub�J  �[  �Z  � ��� l  m m�H���H  � � � TO DO: move this comparison code to IsEqualErrorCheck object; also make `real comparison` a check object feature avoiding need for special-case parameter   � ���4   T O   D O :   m o v e   t h i s   c o m p a r i s o n   c o d e   t o   I s E q u a l E r r o r C h e c k   o b j e c t ;   a l s o   m a k e   ` r e a l   c o m p a r i s o n `   a   c h e c k   o b j e c t   f e a t u r e   a v o i d i n g   n e e d   f o r   s p e c i a l - c a s e   p a r a m e t e r� ��G� Z   m ����F�� o   m n�E�E $0 hasrealtolerance hasRealTolerance� r   q ���� F   q ���� l  q z��D�C� A   q z��� \   q x��� o   q r�B�B 0 actualresult actualResult� o   r w�A�A 0 _isequaldelta _isEqualDelta� o   x y�@�@  0 expectedresult expectedResult�D  �C  � l  } ���?�>� ?   } ���� [   } ���� o   } ~�=�= 0 actualresult actualResult� o   ~ ��<�< 0 _isequaldelta _isEqualDelta� o   � ��;�;  0 expectedresult expectedResult�?  �>  � o      �:�: 0 isequal isEqual�F  � r   � ���� =  � ���� o   � ��9�9 0 actualresult actualResult� o   � ��8�8  0 expectedresult expectedResult� o      �7�7 0 isequal isEqual�G  � R      �6��
�6 .ascrerr ****      � ****� o      �5�5 0 etext eText� �4��
�4 
errn� o      �3�3 0 enumber eNumber� �2��
�2 
erob� o      �1�1 0 efrom eFrom� �0��
�0 
errt� o      �/�/ 
0 eto eTo� �.��-
�. 
ptlr� o      �,�, 0 epartial ePartial�-  � k   � ��� ��� n  � ���� I   � ��+��*�+ 0 	addbroken 	addBroken� ��� m   � ��� ��� 4  a s s e r t   t e s t   r e s u l t    b r o k e� ��� o   � ��)�) 0 testnote testNote� ��(� l 	 � ���'�&� J   � ��� ��%� J   � �    m   � � �   u n e x p e c t e d   e r r o r �$ n  � � I   � ��#�"�# .0 makecaughterrorrecord makeCaughtErrorRecord 	
	 o   � ��!�! 0 etext eText
  o   � �� �  0 enumber eNumber  o   � ��� 0 efrom eFrom  o   � ��� 
0 eto eTo � o   � ��� 0 epartial ePartial�  �"   o   � ��� 0 _testsupport _TestSupport�$  �%  �'  �&  �(  �*  � o   � ��� 0 _testreport _testReport� � R   � ���
� .ascrerr ****      � ****�   �
� 
errn o   � ��� 00 _abortedassertionerror _AbortedAssertionError ��
� 
erob o   � ��� 00 _abortedassertiontoken _AbortedAssertionToken�  �  �  r   � � J   � �  J   � �   m   � �!! �""  e x p e c t e d   r e s u l t  #�# o   � ���  0 expectedresult expectedResult�   $�$ J   � �%% &'& m   � �(( �))  a c t u a l   r e s u l t' *�* o   � ��� 0 actualresult actualResult�  �   o      �� 0 testdata testData +�+ Z   �,-�
., o   � ��	�	 0 isequal isEqual- k   � �// 010 n  � �232 I   � ��4�� 0 
addsuccess 
addSuccess4 565 o   � ��� 0 testnote testNote6 7�7 o   � ��� 0 testdata testData�  �  3 o   � ��� 0 _testreport _testReport1 8�8 L   � ���  �  �
  . k   �99 :;: n  �<=< I   �� >���  0 
addfailure 
addFailure> ?@? m   � AA �BB \  a s s e r t   t e s t   r e s u l t    r e c e i v e d   i n c o r r e c t   r e s u l t@ CDC o   ���� 0 testnote testNoteD E��E o  ���� 0 testdata testData��  ��  = o   � ����� 0 _testreport _testReport; F��F R  ����G
�� .ascrerr ****      � ****��  G ��HI
�� 
errnH o  	���� 00 _abortedassertionerror _AbortedAssertionErrorI ��J��
�� 
erobJ o  ���� 00 _abortedassertiontoken _AbortedAssertionToken��  ��  �  � ��K
�� conscaseK ��L
�� consdiacL ��M
�� conshyphM ��N
�� conspuncN ����
�� conswhit��  � ����
�� consnume��  �h  l OPO l     ��������  ��  ��  P QRQ l     ��������  ��  ��  R STS i  T WUVU I     ����W
�� .���:AsErnull��� ��� null��  W ��XY
�� 
HandX |����Z��[��  ��  Z o      ���� "0 callhandlername callHandlerName��  [ l     \����\ m      ]] �^^  ��  ��  Y ��_`
�� 
Args_ |����a��b��  ��  a o      ����  0 parametervalue parameterValue��  b l     c����c m      ��
�� 
���!��  ��  ` ��de
�� 
Equad o      ���� 0 expectederror expectedErrore ��f��
�� 
Summf |����g��h��  ��  g o      ���� 0 testnote testNote��  h l     i����i m      jj �kk  ��  ��  ��  V k    �ll mnm Z    op����o =    qrq o     ���� $0 _testsuiteobject _testSuiteObjectr m    ��
�� 
msngp R   
 ��st
�� .ascrerr ****      � ****s m    uu �vv b C a n n o t    a s s e r t   t e s t   e r r o r    o u t s i d e   o f   u n i t   t e s t s .t ��w��
�� 
errnw m    �����T��  ��  ��  n x��x P   �yz{y k   �|| }~} Q   �� k   ��� ��� r    *��� n   (��� I   " (������� "0 astextparameter asTextParameter� ��� o   " #���� "0 callhandlername callHandlerName� ���� m   # $�� ���  i n��  ��  � o    "���� 0 _supportlib _supportLib� o      ���� "0 callhandlername callHandlerName� ��� r   + 8��� n  + 6��� I   0 6������� &0 asrecordparameter asRecordParameter� ��� o   0 1���� 0 expectederror expectedError� ���� m   1 2�� ���  i s��  ��  � o   + 0���� 0 _supportlib _supportLib� o      ���� 0 expectederror expectedError� ��� r   9 E��� n  9 C��� I   > C������� <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord� ���� o   > ?���� 0 expectederror expectedError��  ��  � o   9 >���� 0 _testsupport _TestSupport� o      ���� 0 expectederror expectedError� ��� l  F F������  � � � TO DO: what about checking expectedError record's properties are valid types (e.g. error number should be integer, message should be text, etc.), and abort with broken test if not   � ���h   T O   D O :   w h a t   a b o u t   c h e c k i n g   e x p e c t e d E r r o r   r e c o r d ' s   p r o p e r t i e s   a r e   v a l i d   t y p e s   ( e . g .   e r r o r   n u m b e r   s h o u l d   b e   i n t e g e r ,   m e s s a g e   s h o u l d   b e   t e x t ,   e t c . ) ,   a n d   a b o r t   w i t h   b r o k e n   t e s t   i f   n o t� ��� r   F S��� n  F Q��� I   K Q������� "0 astextparameter asTextParameter� ��� o   K L���� 0 testnote testNote� ���� m   L M�� ���  s u m m a r y��  ��  � o   F K���� 0 _supportlib _supportLib� o      ���� 0 testnote testNote� ��� l  T T������  � G A code-generate a script object to invoke the `call_NAME` handler�   � ��� �   c o d e - g e n e r a t e   a   s c r i p t   o b j e c t   t o   i n v o k e   t h e   ` c a l l _ N A M E `   h a n d l e r &� ��� P   T ������ Z   Y ������� =  Y \��� o   Y Z���� "0 callhandlername callHandlerName� m   Z [�� ���  � l  _ t���� r   _ t��� b   _ r��� m   _ `�� ���  c a l l� l  ` q������ n   ` q��� 7  e q����
�� 
ctxt� m   i m���� � m   n p������� o   ` e���� $0 _testhandlername _testHandlerName��  ��  � o      ���� "0 callhandlername callHandlerName� | v if `for` parameter is omitted, automatically call a `call_NAME` handler with the same NAME as the `test_NAME` handler   � ��� �   i f   ` f o r `   p a r a m e t e r   i s   o m i t t e d ,   a u t o m a t i c a l l y   c a l l   a   ` c a l l _ N A M E `   h a n d l e r   w i t h   t h e   s a m e   N A M E   a s   t h e   ` t e s t _ N A M E `   h a n d l e r� ��� H   w }�� C   w |��� o   w x���� "0 callhandlername callHandlerName� m   x {�� ��� 
 c a l l _� ���� r   � ���� b   � ���� m   � ��� ��� 
 c a l l _� o   � ����� "0 callhandlername callHandlerName� o      ���� "0 callhandlername callHandlerName��  ��  ��  � ����
�� conscase��  � ��� Z   � ������� =  � ���� o   � �����  0 parametervalue parameterValue� m   � ���
�� 
���!� r   � ���� n  � ���� I   � ��������  0 makecallobject makeCallObject� ��� o   � ����� "0 callhandlername callHandlerName� ���� m   � �����  ��  ��  � o   � ����� 0 _testsupport _TestSupport� o      ���� 0 
callobject 
callObject��  � r   � ���� n  � ���� I   � ��������  0 makecallobject makeCallObject� ��� o   � ����� "0 callhandlername callHandlerName� ���� m   � ����� ��  ��  � o   � ����� 0 _testsupport _TestSupport� o      ���� 0 
callobject 
callObject� ��� l  � �������  �   �then call it   � ���    & t h e n   c a l l   i t� ��� l  � �� � r   � � J   � �  n  � � o   � ����� 0 novalue NoValue o   � ����� 0 _testsupport _TestSupport 	
	 n  � � o   � ����� 0 novalue NoValue o   � ����� 0 _testsupport _TestSupport
 �� m   � ��
� boovfals��   J        o      �~�~ 0 actualerror actualError  o      �}�} 0 actualresult actualResult �| o      �{�{ 0 isequal isEqual�|    \ V TO DO: rename isEqual to isSuccess once 'is equal' test code is moved to Check object    � �   T O   D O :   r e n a m e   i s E q u a l   t o   i s S u c c e s s   o n c e   ' i s   e q u a l '   t e s t   c o d e   i s   m o v e d   t o   C h e c k   o b j e c t� �z Q   �� l  � � r   � � n  � � I   � ��y �x�y 0 dotest doTest  !"! o   � ��w�w $0 _testsuiteobject _testSuiteObject" #�v# o   � ��u�u  0 parametervalue parameterValue�v  �x   o   � ��t�t 0 
callobject 
callObject o      �s�s 0 actualresult actualResult n h note: this may return literal 'no value' due to AS's schlonky design - this will be accounted for below    �$$ �   n o t e :   t h i s   m a y   r e t u r n   l i t e r a l   ' n o   v a l u e '   d u e   t o   A S ' s   s c h l o n k y   d e s i g n   -   t h i s   w i l l   b e   a c c o u n t e d   f o r   b e l o w R      �r%&
�r .ascrerr ****      � ****% o      �q�q 0 etext eText& �p'(
�p 
errn' o      �o�o 0 enumber eNumber( �n)*
�n 
erob) o      �m�m 0 efrom eFrom* �l+,
�l 
errt+ o      �k�k 
0 eto eTo, �j-�i
�j 
ptlr- o      �h�h 0 epartial ePartial�i   k   ��.. /0/ r   �121 n  �343 I  �g5�f�g .0 makecaughterrorrecord makeCaughtErrorRecord5 676 o  �e�e 0 etext eText7 898 o  �d�d 0 enumber eNumber9 :;: o  �c�c 0 efrom eFrom; <=< o  �b�b 
0 eto eTo= >�a> o  �`�` 0 epartial ePartial�a  �f  4 o   ��_�_ 0 _testsupport _TestSupport2 o      �^�^ 0 actualerror actualError0 ?@? l �]AB�]  A@: compare expected vs actual error info, ignoring any actual error info that user-supplied record doesn't care about; TO DO: shove these tests into a [default] IsEqualErrorCheck object; custom check objects may then be passed via optional parameter to perform other types of tests (e.g. `is in`, `is in range`, etc)   B �CCt   c o m p a r e   e x p e c t e d   v s   a c t u a l   e r r o r   i n f o ,   i g n o r i n g   a n y   a c t u a l   e r r o r   i n f o   t h a t   u s e r - s u p p l i e d   r e c o r d   d o e s n ' t   c a r e   a b o u t ;   T O   D O :   s h o v e   t h e s e   t e s t s   i n t o   a   [ d e f a u l t ]   I s E q u a l E r r o r C h e c k   o b j e c t ;   c u s t o m   c h e c k   o b j e c t s   m a y   t h e n   b e   p a s s e d   v i a   o p t i o n a l   p a r a m e t e r   t o   p e r f o r m   o t h e r   t y p e s   o f   t e s t s   ( e . g .   ` i s   i n ` ,   ` i s   i n   r a n g e ` ,   e t c )@ DED r  FGF m  �\
�\ boovtrueG o      �[�[ 0 isequal isEqualE HIH Z ;JK�Z�YJ F  +LML o  �X�X 0 isequal isEqualM > 'NON n PQP o  �W�W 0 	errortext 	errorTextQ o  �V�V 0 expectederror expectedErrorO n &RSR o  "&�U�U 0 novalue NoValueS o  "�T�T 0 _testsupport _TestSupportK r  .7TUT = .5VWV n .3XYX o  /3�S�S 0 	errortext 	errorTextY o  ./�R�R 0 expectederror expectedErrorW o  34�Q�Q 0 etext eTextU o      �P�P 0 isequal isEqual�Z  �Y  I Z[Z Z <c\]�O�N\ F  <S^_^ o  <=�M�M 0 isequal isEqual_ > @O`a` n @Ebcb o  AE�L�L 0 errornumber errorNumberc o  @A�K�K 0 expectederror expectedErrora n ENded o  JN�J�J 0 novalue NoValuee o  EJ�I�I 0 _testsupport _TestSupport] r  V_fgf = V]hih n V[jkj o  W[�H�H 0 errornumber errorNumberk o  VW�G�G 0 expectederror expectedErrori o  [\�F�F 0 enumber eNumberg o      �E�E 0 isequal isEqual�O  �N  [ lml Z d�no�D�Cn F  d{pqp o  de�B�B 0 isequal isEqualq > hwrsr n hmtut o  im�A�A 0 
errorvalue 
errorValueu o  hi�@�@ 0 expectederror expectedErrors n mvvwv o  rv�?�? 0 novalue NoValuew o  mr�>�> 0 _testsupport _TestSupporto r  ~�xyx = ~�z{z n ~�|}| o  ��=�= 0 
errorvalue 
errorValue} o  ~�<�< 0 expectederror expectedError{ o  ���;�; 0 efrom eFromy o      �:�: 0 isequal isEqual�D  �C  m ~~ Z �����9�8� F  ����� o  ���7�7 0 isequal isEqual� > ����� n ����� o  ���6�6 0 expectedtype expectedType� o  ���5�5 0 expectederror expectedError� n ����� o  ���4�4 0 novalue NoValue� o  ���3�3 0 _testsupport _TestSupport� r  ����� = ����� n ����� o  ���2�2 0 expectedtype expectedType� o  ���1�1 0 expectederror expectedError� o  ���0�0 
0 eto eTo� o      �/�/ 0 isequal isEqual�9  �8   ��� Z �����.�-� F  ����� o  ���,�, 0 isequal isEqual� > ����� n ����� o  ���+�+ 0 partialresult partialResult� o  ���*�* 0 expectederror expectedError� n ����� o  ���)�) 0 novalue NoValue� o  ���(�( 0 _testsupport _TestSupport� r  ����� = ����� n ����� o  ���'�' 0 partialresult partialResult� o  ���&�& 0 expectederror expectedError� o  ���%�% 0 epartial ePartial� o      �$�$ 0 isequal isEqual�.  �-  � ��#� l ���"���"  � � � TO DO: what about checking error record's properties are valid types (e.g. error number should be integer, message should be text, etc.), and fail test if not   � ���>   T O   D O :   w h a t   a b o u t   c h e c k i n g   e r r o r   r e c o r d ' s   p r o p e r t i e s   a r e   v a l i d   t y p e s   ( e . g .   e r r o r   n u m b e r   s h o u l d   b e   i n t e g e r ,   m e s s a g e   s h o u l d   b e   t e x t ,   e t c . ) ,   a n d   f a i l   t e s t   i f   n o t�#  �z  � R      �!��
�! .ascrerr ****      � ****� o      � �  0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo� ���
� 
ptlr� o      �� 0 epartial ePartial�  � k  ��� ��� n �	��� I  �	���� 0 	addbroken 	addBroken� ��� m  ���� ��� 2  a s s e r t   t e s t   e r r o r    b r o k e� ��� o  ���� 0 testnote testNote� ��� l 	����� J  ��� ��� J  ��� ��� m  ���� ���   u n e x p e c t e d   e r r o r� ��� n ���� I  ����� .0 makecaughterrorrecord makeCaughtErrorRecord� ��� o  ���� 0 etext eText� ��� o  ���� 0 enumber eNumber� ��� o  ���
�
 0 efrom eFrom� ��� o  ���	�	 
0 eto eTo� ��� o  ���� 0 epartial ePartial�  �  � o  ���� 0 _testsupport _TestSupport�  �  �  �  �  �  � o  ���� 0 _testreport _testReport� ��� R  
���
� .ascrerr ****      � ****�  � ���
� 
errn� o  � �  00 _abortedassertionerror _AbortedAssertionError� �����
�� 
erob� o  ���� 00 _abortedassertiontoken _AbortedAssertionToken��  �  ~ ��� r  )��� J  '�� ���� J  %�� ��� m  "�� ���  e x p e c t e d   e r r o r� ���� o  "#���� 0 expectederror expectedError��  ��  � o      ���� 0 testdata testData� ���� Z  *������� o  *+���� 0 isequal isEqual� l .E���� k  .E�� ��� n .B��� I  3B������� 0 
addsuccess 
addSuccess� ��� o  34���� 0 testnote testNote� ���� b  4>��� o  45���� 0 testdata testData� J  5=�� ���� J  5;�� ��� m  58�� ���  a c t u a l   e r r o r� ���� o  89���� 0 actualerror actualError��  ��  ��  ��  � o  .3���� 0 _testreport _testReport� ���� L  CE����  ��  �   success   � ���    s u c c e s s��  � k  H��� � � l HH����   2 , raised wrong error or didn't raise an error    � X   r a i s e d   w r o n g   e r r o r   o r   d i d n ' t   r a i s e   a n   e r r o r   Q  Ha l KN	
	 l KN r  KN o  KL���� 0 actualresult actualResult o      ���� 0 actualresult actualResult � z this variable lookup fails if call_NAME returned nothing (i.e. `null`, which AS literally treats as 'no value at all')...    � �   t h i s   v a r i a b l e   l o o k u p   f a i l s   i f   c a l l _ N A M E   r e t u r n e d   n o t h i n g   ( i . e .   ` n u l l ` ,   w h i c h   A S   l i t e r a l l y   t r e a t s   a s   ' n o   v a l u e   a t   a l l ' ) . . .
 g a kludge-around for AS's dumb commands-are-not-expressions-so-do-not-have-to-return-results design    � �   k l u d g e - a r o u n d   f o r   A S ' s   d u m b   c o m m a n d s - a r e - n o t - e x p r e s s i o n s - s o - d o - n o t - h a v e - t o - r e t u r n - r e s u l t s   d e s i g n R      ����
�� .ascrerr ****      � ****��   ����
�� 
errn d       m      ����
���   l Va r  Va n V_ o  [_���� 0 novalue NoValue o  V[���� 0 _testsupport _TestSupport o      ���� 0 actualresult actualResult a [ ... in which case replace it with a 'no value placeholder' object that AS can actually see    � �   . . .   i n   w h i c h   c a s e   r e p l a c e   i t   w i t h   a   ' n o   v a l u e   p l a c e h o l d e r '   o b j e c t   t h a t   A S   c a n   a c t u a l l y   s e e  Z b� !����  > bm"#" o  bc���� 0 actualerror actualError# n cl$%$ o  hl���� 0 novalue NoValue% o  ch���� 0 _testsupport _TestSupport! r  p�&'& J  p{(( )*) m  ps++ �,,  i n c o r r e c t   e r r o r* -��- J  sy.. /0/ m  sv11 �22  a c t u a l   e r r o r0 3��3 o  vw���� 0 actualerror actualError��  ��  ' J      44 565 o      ���� 0 problemtype problemType6 7��7 n      898  ;  ��9 o  ������ 0 testdata testData��  ��  ��   :;: Z ��<=����< > ��>?> o  ������ 0 actualresult actualResult? n ��@A@ o  ������ 0 novalue NoValueA o  ������ 0 _testsupport _TestSupport= r  ��BCB J  ��DD EFE m  ��GG �HH  n o   e r r o rF I��I J  ��JJ KLK m  ��MM �NN " u n e x p e c t e d   r e s u l tL O��O o  ������ 0 actualresult actualResult��  ��  C J      PP QRQ o      ���� 0 problemtype problemTypeR S��S n      TUT  ;  ��U o  ������ 0 testdata testData��  ��  ��  ; VWV n ��XYX I  ����Z���� 0 
addfailure 
addFailureZ [\[ b  ��]^] m  ��__ �`` :  a s s e r t   t e s t   e r r o r    r e c e i v e d  ^ o  ������ 0 problemtype problemType\ aba o  ������ 0 testnote testNoteb c��c o  ������ 0 testdata testData��  ��  Y o  ������ 0 _testreport _testReportW d��d R  ������e
�� .ascrerr ****      � ****��  e ��fg
�� 
errnf o  ������ 00 _abortedassertionerror _AbortedAssertionErrorg ��h��
�� 
erobh o  ������ 00 _abortedassertiontoken _AbortedAssertionToken��  ��  ��  z ��i
�� conscasei ��j
�� consdiacj ��k
�� conshyphk ��l
�� conspuncl ����
�� conswhit��  { ����
�� consnume��  ��  T mnm l     ��������  ��  ��  n opo l     ��������  ��  ��  p q��q l     ��������  ��  ��  ��       ��rstuvw��x������yz{��  r ������������������������������ 0 _supportlib _supportLib�� 0 _testsupport _TestSupport
�� 
pimr�� 0 
randomword 
randomWord
�� .���:MTmrnull��� ��� ctxt�� 00 _abortedassertionerror _AbortedAssertionError�� 00 _abortedassertiontoken _AbortedAssertionToken�� 0 _isequaldelta _isEqualDelta�� $0 _testsuiteobject _testSuiteObject�� 0 _testreport _testReport�� $0 _testhandlername _testHandlerName�� 0 __performunittestforsuite__  
�� .���:AsRenull��� ��� null
�� .���:AsErnull��� ��� nulls ||   �� 
�� 
scptt }}   �� 
�� 
scptu ��~�� ~  � �����
�� 
cobj� ��   �� &
�� 
frmk��  � �����
�� 
cobj� ��   ��
�� 
osax��  v �� @���������� 0 
randomword 
randomWord�� ����� �  ������ 0 	minlength 	minLength�� 0 	maxlength 	maxLength��  � �������� 0 	minlength 	minLength�� 0 	maxlength 	maxLength�� 0 s  �  M��������~ Y�}
�� misccura
�� 
from
�� 
to  � 
�~ .sysorandnmbr    ��� nmbr
�} 
cobj�� (�E�O � *��� Ukh���.%E�[OY��O�w �| u�{�z���y
�| .���:MTmrnull��� ��� ctxt�{ {�x�w z�x 0 nametext nameText�w  �z  � �v�u�v 0 nametext nameText�u 0 timerobject TimerObject� �t |��t 0 timerobject TimerObject� �s��r�q���p
�s .ascrinit****      � ****� k     '��  ���  ���  ���  ���  ���  ���  ���  ���  ��o�o  �r  �q  � 	�n�m�l�k�j�i�h�g�f
�n 
pimr�m 0 
_starttime 
_startTime�l 0 _totalseconds _totalSeconds�k 0 
_isrunning 
_isRunning�j 0 	timername 	timerName�i 0 
starttimer 
startTimer�h 0 	stoptimer 	stopTimer�g 0 elapsedtime elapsedTime�f 0 	totaltime 	totalTime� �e�d ��c�b ��a�`�����
�e 
cobj
�d 
frmk
�c 
msng�b 0 
_starttime 
_startTime�a 0 _totalseconds _totalSeconds�` 0 
_isrunning 
_isRunning� �_ ��^�]���\�_ 0 	timername 	timerName�^  �]  �  �  �\ b   � �[ ��Z�Y���X�[ 0 
starttimer 
startTimer�Z  �Y  �  � �W�V�U
�W misccura�V 0 nsdate NSDate�U @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate�X (b   hY hOeEc  O��,j+ Ec  O)� �T ��S�R���Q�T 0 	stoptimer 	stopTimer�S  �R  � �P�P 0 elapsedtime elapsedTime� �O�N�M
�O misccura�N 0 nsdate NSDate�M @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate�Q 9b   jY hO��,j+ b  E�Ob  �Ec  OfEc  O�� �L ��K�J���I�L 0 elapsedtime elapsedTime�K  �J  � �H�H 0 nsdate NSDate� �G�G @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate�I b   �j+  b  Y j� �F ��E�D���C�F 0 	totaltime 	totalTime�E  �D  �  � �B�B 0 elapsedtime elapsedTime�C b   b  *j+  Y b  �p (�*��/lkv��O�Of�OL OL 	OL 
OL OL �y ��K S���Ax �A  ��A 00 _abortedassertiontoken _AbortedAssertionToken�  ��  
�� 
msng
�� 
msng
�� 
msngy �@T�?�>���=�@ 0 __performunittestforsuite__  �? �<��< �  �;��; 0 suiteobject suiteObject� �:��: �  �9�8�7�6�9 0 	suitename 	suiteName�8 0 handlername handlerName�7 0 handlerkeys handlerKeys�6 0 isstyled isStyled�>  � �5�4�3�2�1�0�/�.�-�,�+�5 0 suiteobject suiteObject�4 0 	suitename 	suiteName�3 0 handlername handlerName�2 0 handlerkeys handlerKeys�1 0 isstyled isStyled�0 0 etext eText�/ 0 enumber eNumber�. 0 efrom eFrom�- 
0 eto eTo�, 0 epartial ePartial�+ 0 
callobject 
callObject� �*��)�(�����'�&�%�$�#�"�!���� #�59B�*  0 maketestreport makeTestReport�) 0 setup setUp�( 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo� ���
� 
ptlr� 0 epartial ePartial�  �' �& .0 makecaughterrorrecord makeCaughtErrorRecord�% 0 	addbroken 	addBroken
�$ 
msng�#  0 makecallobject makeCallObject�" 0 dotest doTest
�! 
bool�  0 
addfailure 
addFailure� 0 teardown tearDown�=#�Ec  O�Ec  
Ob  ���m+  Ec  	O ��kv 
�j+ Y hW 4X  b  	���b  ������+ 	lvkvm+ 
O�Ec  Ob  	Ob  �jl+ E�O ���l+ W JX  �b   	 �b   �& -b  	�%a %a a b  ������+ 	lvkvm+ Y hO �a kv 
�j+ Y hW +X  b  	a a a b  ������+ 	lvkvm+ 
O�Ec  Ob  	z �n�����
� .���:AsRenull��� ��� null�  � ���
� 
Valu� 0 actualresult actualResult� ���
� 
Equa�  0 expectedresult expectedResult� ���
� 
Summ� {��y� 0 testnote testNote�  � �
��	
�
 
FCmp� {���� $0 hasrealtolerance hasRealTolerance�  
� boovfals�	  � ������ ����������� 0 actualresult actualResult�  0 expectedresult expectedResult� 0 testnote testNote� $0 hasrealtolerance hasRealTolerance� 0 isequal isEqual�  0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 epartial ePartial�� 0 testdata testData� "�����������������������������������������������!(��A��
�� 
msng
�� 
errn���T�� "0 astextparameter asTextParameter�� (0 asbooleanparameter asBooleanParameter
�� 
nmbr�� 0 istype isType
�� 
bool���Y
�� 
erob
�� 
errt
�� 
doub�� 
�� 
pcls�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� �����
�� 
errt�� 
0 eto eTo� ������
�� 
ptlr�� 0 epartial ePartial��  �� �� .0 makecaughterrorrecord makeCaughtErrorRecord�� 0 	addbroken 	addBroken�� �� 0 
addsuccess 
addSuccess�� 0 
addfailure 
addFailure�b  �  )��l�Y hO�� zb   ��l+ E�Ob   ��l+ 	E�O�	 b  ��l+ �& )����a a a �a ,%a %Y hO� �b  �	 �b  ��&E�Y �� E�W >X  b  	a �a b  �����a + lvkvm+ O)�b  �b  a hOa �lva �lvlvE�O� b  	��l+ OhY #b  	a  ��m+ !O)�b  �b  a hV{ ��V��������
�� .���:AsErnull��� ��� null��  �� ����
�� 
Hand� {����]�� "0 callhandlername callHandlerName��  � ����
�� 
Args� {��������  0 parametervalue parameterValue��  
�� 
���!� �����
�� 
Equa�� 0 expectederror expectedError� �����
�� 
Summ� {����j�� 0 testnote testNote��  ��  � �������������������������������� "0 callhandlername callHandlerName��  0 parametervalue parameterValue�� 0 expectederror expectedError�� 0 testnote testNote�� 0 
callobject 
callObject�� 0 actualerror actualError�� 0 actualresult actualResult�� 0 isequal isEqual�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 epartial ePartial�� 0 testdata testData�� 0 problemtype problemType� 1������uz{������������������������������������������������������������+1GM_��
�� 
msng
�� 
errn���T�� "0 astextparameter asTextParameter�� &0 asrecordparameter asRecordParameter�� <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord
�� 
ctxt�� 
�� 
���!��  0 makecallobject makeCallObject�� 0 novalue NoValue
�� 
cobj�� 0 dotest doTest�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� �����
�� 
errt�� 
0 eto eTo� ������
�� 
ptlr�� 0 epartial ePartial��  �� .0 makecaughterrorrecord makeCaughtErrorRecord�� 0 	errortext 	errorText
�� 
bool�� 0 errornumber errorNumber�� 0 
errorvalue 
errorValue�� 0 expectedtype expectedType�� 0 partialresult partialResult�� 0 	addbroken 	addBroken
�� 
erob�� �� 0 
addsuccess 
addSuccess��  � ������
�� 
errn���?��  �� 0 
addfailure 
addFailure���b  �  )��l�Y hO����b   ��l+ E�Ob   ��l+ 	E�Ob  �k+ 
E�Ob   ��l+ E�Og� 5��  �b  
[�\[Za \Zi2%E�Y �a  a �%E�Y hVO�a   b  �jl+ E�Y b  �kl+ E�Ob  a ,b  a ,fmvE[a k/E�Z[a l/E�Z[a m/E�ZO �b  �l+ E�W �X  b  �����a + E�OeE�O�	 �a ,b  a ,a & �a ,� E�Y hO�	 �a ,b  a ,a & �a ,� E�Y hO�	 �a ,b  a ,a & �a ,� E�Y hO�	 �a ,b  a ,a & �a ,� E�Y hO�	 �a  ,b  a ,a & �a  ,� E�Y hOPW @X  b  	a !�a "b  �����a + lvkvm+ #O)�b  a $b  a %hOa &�lvkvE�O� b  	��a '�lvkv%l+ (OhY � �E�W X ) *b  a ,E�O�b  a , $a +a ,�lvlvE[a k/E�Z[a l/�6FZY hO�b  a , $a -a .�lvlvE[a k/E�Z[a l/�6FZY hOb  	a /�%��m+ 0O)�b  a $b  a %hVascr  ��ޭ