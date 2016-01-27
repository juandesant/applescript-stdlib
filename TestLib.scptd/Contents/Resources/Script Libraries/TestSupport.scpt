FasdUAS 1.101.10   ��   ��    k             l      ��  ��    V P TestSupport -- handlers and constants used by TestLib's unit testing framework
     � 	 	 �   T e s t S u p p o r t   - -   h a n d l e r s   a n d   c o n s t a n t s   u s e d   b y   T e s t L i b ' s   u n i t   t e s t i n g   f r a m e w o r k 
   
  
 l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��     
 constants     �      c o n s t a n t s      l     ��������  ��  ��        l          h     �� �� 0 novalue NoValue  l     ��  ��    Y S TO DO: would it be safe enough just to use `�class ���!�` (no value placeholder)?      �     �   T O   D O :   w o u l d   i t   b e   s a f e   e n o u g h   j u s t   t o   u s e   ` � c l a s s   � � � ! � `   ( n o   v a l u e   p l a c e h o l d e r ) ?    c ] note: omitted parameters must use `�class ���!� as default parameter values must be literals     � ! ! �   n o t e :   o m i t t e d   p a r a m e t e r s   m u s t   u s e   ` � c l a s s   � � � ! �   a s   d e f a u l t   p a r a m e t e r   v a l u e s   m u s t   b e   l i t e r a l s   " # " l     ��������  ��  ��   #  $ % $ j    
�� &�� 0 _success _SUCCESS & m    	 ' ' � ( (  P A S S %  ) * ) j    �� +�� 0 _failure _FAILURE + m     , , � - -  F A I L *  . / . j    �� 0�� 0 _broken _BROKEN 0 m     1 1 � 2 2  B R O K E N   T E S T /  3 4 3 l     ��������  ��  ��   4  5 6 5 l     �� 7 8��   7 J D--------------------------------------------------------------------    8 � 9 9 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 6  : ; : l     �� < =��   < t n expected/unexpected errors are trapped and their parameters stored in a 'caught error' record for portability    = � > > �   e x p e c t e d / u n e x p e c t e d   e r r o r s   a r e   t r a p p e d   a n d   t h e i r   p a r a m e t e r s   s t o r e d   i n   a   ' c a u g h t   e r r o r '   r e c o r d   f o r   p o r t a b i l i t y ;  ? @ ? l     ��������  ��  ��   @  A B A l      C D E C j    �� F�� $0 _caughterrortype _CaughtErrorType F m    ��
�� 
���� D2, the `class` property of error records passed to TestReport by `assert�` handlers; TestReport checks this record property to determine how to convert test data to its literal representation (unlike other records, which are converted wholesale, error info record properties are individually converted)    E � G GX   t h e   ` c l a s s `   p r o p e r t y   o f   e r r o r   r e c o r d s   p a s s e d   t o   T e s t R e p o r t   b y   ` a s s e r t & `   h a n d l e r s ;   T e s t R e p o r t   c h e c k s   t h i s   r e c o r d   p r o p e r t y   t o   d e t e r m i n e   h o w   t o   c o n v e r t   t e s t   d a t a   t o   i t s   l i t e r a l   r e p r e s e n t a t i o n   ( u n l i k e   o t h e r   r e c o r d s ,   w h i c h   a r e   c o n v e r t e d   w h o l e s a l e ,   e r r o r   i n f o   r e c o r d   p r o p e r t i e s   a r e   i n d i v i d u a l l y   c o n v e r t e d ) B  H I H l     ��������  ��  ��   I  J K J l     ��������  ��  ��   K  L M L i    N O N I      �� P���� .0 makecaughterrorrecord makeCaughtErrorRecord P  Q R Q o      ���� 0 etext eText R  S T S o      ���� 0 enumber eNumber T  U V U o      ���� 0 efrom eFrom V  W X W o      ���� 
0 eto eTo X  Y�� Y o      ���� 0 epartial ePartial��  ��   O L      Z Z K      [ [ �� \ ]
�� 
pcls \ o    ���� $0 _caughterrortype _CaughtErrorType ] �� ^ _�� 0 	errortext 	errorText ^ o    ���� 0 etext eText _ �� ` a�� 0 errornumber errorNumber ` o   	 
���� 0 enumber eNumber a �� b c�� 0 
errorvalue 
errorValue b o    ���� 0 efrom eFrom c �� d e�� 0 expectedtype expectedType d o    ���� 
0 eto eTo e �� f���� 0 partialresult partialResult f o    ���� 0 epartial ePartial��   M  g h g l     ��������  ��  ��   h  i j i l     ��������  ��  ��   j  k l k j    #�� m�� *0 _defaulterrorrecord _defaultErrorRecord m I    "�� n���� .0 makecaughterrorrecord makeCaughtErrorRecord n  o p o o    ���� 0 novalue NoValue p  q r q o    ���� 0 novalue NoValue r  s t s o    ���� 0 novalue NoValue t  u v u o    ���� 0 novalue NoValue v  w�� w o    ���� 0 novalue NoValue��  ��   l  x y x l     ��������  ��  ��   y  z { z l     ��������  ��  ��   {  | } | i  $ ' ~  ~ I      �� ����� <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord �  ��� � o      ���� 0 errorrecord errorRecord��  ��    l    @ � � � � k     @ � �  � � � l     �� � ���   � U O make sure errorRecord contains at least one valid property and no invalid ones    � � � � �   m a k e   s u r e   e r r o r R e c o r d   c o n t a i n s   a t   l e a s t   o n e   v a l i d   p r o p e r t y   a n d   n o   i n v a l i d   o n e s �  � � � Z     � ����� � =      � � � n     � � � 1    ��
�� 
leng � o     ���� 0 errorrecord errorRecord � m    ����   � R    �� � �
�� .ascrerr ****      � **** � m     � � � � � p I n v a l i d    i s    p a r a m e t e r   ( r e c o r d   c o n t a i n e d   n o   p r o p e r t i e s ) . � �� � �
�� 
errn � m   
 �����Y � �� � �
�� 
erob � o    ���� 0 errorrecord errorRecord � �� ���
�� 
errt � m    ��
�� 
reco��  ��  ��   �  � � � r      � � � b     � � � o    ���� 0 errorrecord errorRecord � o    ���� *0 _defaulterrorrecord _defaultErrorRecord � o      ���� $0 normalizedrecord normalizedRecord �  � � � Z  ! = � ����� � >   ! , � � � n  ! $ � � � 1   " $��
�� 
leng � o   ! "���� 0 errorrecord errorRecord � n  $ + � � � 1   ) +��
�� 
leng � o   $ )���� *0 _defaulterrorrecord _defaultErrorRecord � R   / 9�� � �
�� .ascrerr ****      � **** � m   7 8 � � � � � � I n v a l i d    i s    p a r a m e t e r   ( r e c o r d   c o n t a i n e d   u n r e c o g n i z e d   p r o p e r t i e s ) . � �� � �
�� 
errn � m   1 2�����Y � �� � �
�� 
erob � o   3 4���� 0 errorrecord errorRecord � �� ���
�� 
errt � m   5 6��
�� 
reco��  ��  ��   �  ��� � L   > @ � � o   > ?���� $0 normalizedrecord normalizedRecord��   � i c ensure error info record has all the correct properties and that at least one of them is populated    � � � � �   e n s u r e   e r r o r   i n f o   r e c o r d   h a s   a l l   t h e   c o r r e c t   p r o p e r t i e s   a n d   t h a t   a t   l e a s t   o n e   o f   t h e m   i s   p o p u l a t e d }  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  ( + � � � I      �� ����� 0 istype isType �  � � � o      ���� 0 thevalue theValue �  ��� � o      ���� 0 typename typeName��  ��   � L      � � >      � � � l    	 ����� � I    	�� � �
�� .corecnte****       **** � J      � �  ��� � o     �� 0 thevalue theValue��   � �~ ��}
�~ 
kocl � o    �|�| 0 typename typeName�}  ��  ��   � m   	 
�{�{   �  � � � l     �z�y�x�z  �y  �x   �  � � � l     �w�v�u�w  �v  �u   �  � � � l     �t � ��t   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �s � ��s   � "  `assert test error` support    � � � � 8   ` a s s e r t   t e s t   e r r o r `   s u p p o r t �  � � � l     �r�q�p�r  �q  �p   �  � � � i  , / � � � I      �o ��n�o (0 sanitizeidentifier sanitizeIdentifier �  ��m � o      �l�l 0 aname aName�m  �n   � P     s � � � � k    r � �  � � � Z    � ��k�j � =    � � � o    �i�i 0 aname aName � m     � � � � �   � L     � � m     � � � � �  | |�k  �j   �  � � � r     � � � m     � � � � �   � o      �h�h 0 res   �  � � � r     � � � m     � � � � � 6 a b c d e f g h i j k l m n o p q r s t u v w x y z _ � o      �g�g 0 
legalchars 
legalChars �  � � � r       m    �f
�f boovfals o      �e�e 0 usepipes usePipes �  X    _�d k   . Z  Z   . P	
�c�b	 H   . 4 E  . 3 o   . /�a�a 0 
legalchars 
legalChars n  / 2 1   0 2�`
�` 
pcnt o   / 0�_�_ 0 charref charRef
 k   7 L  r   7 : m   7 8�^
�^ boovtrue o      �]�] 0 usepipes usePipes �\ Z  ; L�[�Z E  ; @ m   ; < �  \ | n  < ? 1   = ?�Y
�Y 
pcnt o   < =�X�X 0 charref charRef r   C H b   C F !  m   C D"" �##  \! o   D E�W�W 0 charref charRef o      �V�V 0 charref charRef�[  �Z  �\  �c  �b   $%$ r   Q V&'& b   Q T()( o   Q R�U�U 0 res  ) o   R S�T�T 0 charref charRef' o      �S�S 0 res  % *�R* r   W Z+,+ m   W X-- �.. J a b c d e f g h i j k l m n o p q r s t u v w x y z _ 1 2 3 4 5 6 7 8 9 0, o      �Q�Q 0 
legalchars 
legalChars�R  �d 0 charref charRef o   ! "�P�P 0 aname aName /0/ Z  ` o12�O�N1 o   ` a�M�M 0 usepipes usePipes2 r   d k343 b   d i565 b   d g787 m   d e99 �::  |8 o   e f�L�L 0 res  6 m   g h;; �<<  |4 o      �K�K 0 res  �O  �N  0 =�J= L   p r>> o   p q�I�I 0 res  �J   � �H?
�H consdiac? �G@
�G conshyph@ �FA
�F conspuncA �E�D
�E conswhit�D   � �CB
�C conscaseB �B�A
�B consnume�A   � CDC l     �@�?�>�@  �?  �>  D EFE l     �=�<�;�=  �<  �;  F GHG i  0 3IJI I      �:K�9�:  0 makecallobject makeCallObjectK LML o      �8�8 0 handlername handlerNameM N�7N o      �6�6  0 parametercount parameterCount�7  �9  J k     QOO PQP r     RSR m     TT �UU  S o      �5�5 0 args  Q VWV Z    2XY�4�3X ?    Z[Z o    �2�2  0 parametercount parameterCount[ m    �1�1  Y k   
 .\\ ]^] Y   
  _�0`a�/_ r    bcb b    ded b    fgf o    �.�. 0 args  g m    hh �ii 2 ,   p a r a m e t e r O b j e c t ' s   i t e m  e o    �-�- 0 i  c o      �,�, 0 args  �0 0 i  ` m    �+�+ a o    �*�*  0 parametercount parameterCount�/  ^ j�)j r   ! .klk n   ! ,mnm 7  " ,�(op
�( 
ctxto m   & (�'�' p m   ) +�&�&��n o   ! "�%�% 0 args  l o      �$�$ 0 args  �)  �4  �3  W q�#q L   3 Qrr I  3 P�"s�!
�" .sysodsct****        scpts b   3 Ltut b   3 Jvwv b   3 Hxyx b   3 Fz{z b   3 ?|}| b   3 =~~ m   3 4�� ��� 0 o n   r u n 
 	 	 	 	 	 	 	 	 	 	 s c r i p t   I   4 <� ���  (0 sanitizeidentifier sanitizeIdentifier� ��� b   5 8��� m   5 6�� ���  C a l l O b j e c t _� o   6 7�� 0 handlername handlerName�  �  } m   = >�� ��� � 
 	 	 	 	 	 	 	 	 	 	 	 o n   d o T e s t ( s u i t e O b j e c t ,   p a r a m e t e r O b j e c t ) 
 	 	 	 	 	 	 	 	 	 	 	 	 r e t u r n   s u i t e O b j e c t ' s  { I   ? E���� (0 sanitizeidentifier sanitizeIdentifier� ��� o   @ A�� 0 handlername handlerName�  �  y m   F G�� ���  (w o   H I�� 0 args  u m   J K�� ��� t ) 
 	 	 	 	 	 	 	 	 	 	 	 e n d   r u n 
 	 	 	 	 	 	 	 	 	 	 e n d   s c r i p t 
 	 	 	 	 	 	 	 	 	 e n d   r u n�!  �#  H ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ����  �   report generation   � ��� $   r e p o r t   g e n e r a t i o n� ��� l     ����  �  �  � ��� i  4 7��� I      ���� 0 vt100 VT100� ��
� o      �	�	 0 
formatcode 
formatCode�
  �  � k     �� ��� l      ����  �F@ Returns a magic character sequence that will apply the specified formatting or other control operation in Terminal.app and other VT100 terminal emulators. Multiple codes may be given as semicolon-separated numeric text, e.g. "1;7". Commonly used style codes are:
	
		0 = reset/normal
		1 = bold
		2 = faint
		4 = underline
		5 = blink
		7 = negative
		8 = conceal
		30-37 = foreground colors (black, red, green, yellow, blue, magenta, cyan, white)
		38;5;N = xterm-256 foreground colors (N = 0-255)
		39 = default foreground color
		40-49 = background colors (as for 30-39)
	   � ����   R e t u r n s   a   m a g i c   c h a r a c t e r   s e q u e n c e   t h a t   w i l l   a p p l y   t h e   s p e c i f i e d   f o r m a t t i n g   o r   o t h e r   c o n t r o l   o p e r a t i o n   i n   T e r m i n a l . a p p   a n d   o t h e r   V T 1 0 0   t e r m i n a l   e m u l a t o r s .   M u l t i p l e   c o d e s   m a y   b e   g i v e n   a s   s e m i c o l o n - s e p a r a t e d   n u m e r i c   t e x t ,   e . g .   " 1 ; 7 " .   C o m m o n l y   u s e d   s t y l e   c o d e s   a r e : 
 	 
 	 	 0   =   r e s e t / n o r m a l 
 	 	 1   =   b o l d 
 	 	 2   =   f a i n t 
 	 	 4   =   u n d e r l i n e 
 	 	 5   =   b l i n k 
 	 	 7   =   n e g a t i v e 
 	 	 8   =   c o n c e a l 
 	 	 3 0 - 3 7   =   f o r e g r o u n d   c o l o r s   ( b l a c k ,   r e d ,   g r e e n ,   y e l l o w ,   b l u e ,   m a g e n t a ,   c y a n ,   w h i t e ) 
 	 	 3 8 ; 5 ; N   =   x t e r m - 2 5 6   f o r e g r o u n d   c o l o r s   ( N   =   0 - 2 5 5 ) 
 	 	 3 9   =   d e f a u l t   f o r e g r o u n d   c o l o r 
 	 	 4 0 - 4 9   =   b a c k g r o u n d   c o l o r s   ( a s   f o r   3 0 - 3 9 ) 
 	� ��� L     �� b     ��� b     	��� b     ��� l    ���� 5     ���
� 
cha � m    �� 
� kfrmID  �  �  � m    �� ���  [� o    �� 0 
formatcode 
formatCode� m   	 
�� ���  m�  � ��� l     � �����   ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ��������  ��  ��  � ��� i  8 ;��� I      �������  0 maketestreport makeTestReport� ��� o      ���� 0 testsuitename testSuiteName� ��� o      ���� "0 testhandlername testHandlerName� ���� o      ���� 0 isstyled isStyled��  ��  � k     U�� ��� Z     I������ o     ���� 0 isstyled isStyled� r    2��� K    0�� ������ 0 n  � I    ������� 0 vt100 VT100� ���� m    ����  ��  ��  � ������ 0 b  � I    ������� 0 vt100 VT100� ���� m    ���� ��  ��  � ������ 0 u  � I    ������� 0 vt100 VT100� ���� m    ���� ��  ��  � ������ 0 r  � I     ������� 0 vt100 VT100� ���� m    ���� ��  ��  � ������ 0 g  � I   ! '������� 0 vt100 VT100� ���� m   " #����  ��  ��  � ������� 0 e  � I   ( .������� 0 vt100 VT100� ���� m   ) *���� "��  ��  ��  � o      ���� 0 vtstyle vtStyle��  � r   5 I��� K   5 G�� ������ 0 n  � m   6 7�� ���  � ������ 0 b  � m   8 9�� ���  � ������ 0 u  � m   : ;�� ���  � ������ 0 r  � m   < =   �  � ���� 0 g   m   > A �   ������ 0 e   m   B E �  ��  � o      ���� 0 vtstyle vtStyle� 	��	 h   J U��
�� 0 
testreport 
TestReport
 k        l     ��������  ��  ��    l      j     ���� 0 _testresults _testResults J     ����   c ] a single test_NAME handler may perform multiple asserts, the result of each is recorded here    � �   a   s i n g l e   t e s t _ N A M E   h a n d l e r   m a y   p e r f o r m   m u l t i p l e   a s s e r t s ,   t h e   r e s u l t   o f   e a c h   i s   r e c o r d e d   h e r e  l     ��������  ��  ��    i    I      ������ 0 
_addreport 
_addReport  o      ���� 0 outcometype outcomeType  o      ���� (0 outcomedescription outcomeDescription  !  o      ���� 0 testnote testNote! "��" o      ���� 0 testdata testData��  ��   l    #$%# k     && '(' l     ��)*��  ) ] W outcomeType indicates if test_NAME succeeded, failed, or aborted due to defective test   * �++ �   o u t c o m e T y p e   i n d i c a t e s   i f   t e s t _ N A M E   s u c c e e d e d ,   f a i l e d ,   o r   a b o r t e d   d u e   t o   d e f e c t i v e   t e s t( ,-, l     ��./��  . W Q testNote is any additional info passed by `assert�` for inclusion in test report   / �00 �   t e s t N o t e   i s   a n y   a d d i t i o n a l   i n f o   p a s s e d   b y   ` a s s e r t & `   f o r   i n c l u s i o n   i n   t e s t   r e p o r t- 121 l     ��34��  3 � � testData is record of form {expectedResult:�, expectedError:�, actualResult:�, actualError:�}, unused properties should be omitted -- TO DO: make this a key-value list (easier to read, reformat, and render)   4 �55�   t e s t D a t a   i s   r e c o r d   o f   f o r m   { e x p e c t e d R e s u l t : & ,   e x p e c t e d E r r o r : & ,   a c t u a l R e s u l t : & ,   a c t u a l E r r o r : & } ,   u n u s e d   p r o p e r t i e s   s h o u l d   b e   o m i t t e d   - -   T O   D O :   m a k e   t h i s   a   k e y - v a l u e   l i s t   ( e a s i e r   t o   r e a d ,   r e f o r m a t ,   a n d   r e n d e r )2 676 r     898 K     
:: ��;<�� 0 outcometype outcomeType; o    ���� 0 outcometype outcomeType< ��=>�� (0 outcomedescription outcomeDescription= o    ���� (0 outcomedescription outcomeDescription> ��?@�� 0 testnote testNote? o    ���� 0 testnote testNote@ ��A���� 0 testdata testDataA o    ���� 0 testdata testData��  9 n      BCB  ;    C o   
 ���� 0 _testresults _testResults7 D��D l   ��EF��  E  log result -- DEBUG   F �GG & l o g   r e s u l t   - -   D E B U G��  $ � � TO DO: include param for indicating cause (`assert test result` received wrong result, `assert test error` received wrong/no error, unexpected error in `test_NAME` handler, etc)   % �HHd   T O   D O :   i n c l u d e   p a r a m   f o r   i n d i c a t i n g   c a u s e   ( ` a s s e r t   t e s t   r e s u l t `   r e c e i v e d   w r o n g   r e s u l t ,   ` a s s e r t   t e s t   e r r o r `   r e c e i v e d   w r o n g / n o   e r r o r ,   u n e x p e c t e d   e r r o r   i n   ` t e s t _ N A M E `   h a n d l e r ,   e t c ) IJI l     ��������  ��  ��  J KLK l     ��������  ��  ��  L MNM l     ��������  ��  ��  N OPO i   QRQ I      ��S���� 0 
addsuccess 
addSuccessS TUT o      ���� 0 testnote testNoteU V��V o      ���� 0 testdata testData��  ��  R I     ��W���� 0 
_addreport 
_addReportW XYX o    ���� 0 _success _SUCCESSY Z[Z m    \\ �]]  [ ^_^ o    ���� 0 testnote testNote_ `��` o    	���� 0 testdata testData��  ��  P aba l     ��������  ��  ��  b cdc i   efe I      ��g���� 0 
addfailure 
addFailureg hih o      ���� (0 outcomedescription outcomeDescriptioni jkj o      ���� 0 testnote testNotek l��l o      ���� 0 testdata testData��  ��  f I     ��m���� 0 
_addreport 
_addReportm non o    ���� 0 _failure _FAILUREo pqp o    ���� (0 outcomedescription outcomeDescriptionq rsr o    ���� 0 testnote testNotes t��t o    	���� 0 testdata testData��  ��  d uvu l     ��������  ��  ��  v wxw i   yzy I      �{�~� 0 	addbroken 	addBroken{ |}| o      �}�} (0 outcomedescription outcomeDescription} ~~ o      �|�| 0 testnote testNote ��{� o      �z�z 0 testdata testData�{  �~  z I     �y��x�y 0 
_addreport 
_addReport� ��� o    �w�w 0 _broken _BROKEN� ��� o    �v�v (0 outcomedescription outcomeDescription� ��� o    �u�u 0 testnote testNote� ��t� o    	�s�s 0 testdata testData�t  �x  x ��� l     �r�q�p�r  �q  �p  � ��� l     �o���o  �  -----   � ��� 
 - - - - -� ��� l     �n���n  ��� note: Converting AS objects to their literal representations requires some hoop-jumping: it's impractical for `perform unit test` to format test results on the fly as `osatest` doesn't have an event loop so sending itself AEs while the script is executing might be a tad fiddly. Instead, TestReport just captures everything in its _testResults property and is returned by `perform unit test` on completion (ensuring the captured data stays inside an AS context, so that e.g. application references don't lose their target application as happens when they're packed into an AE as a naked typeObjectSpecifier descriptor). `osaglue` must then repeatedly call the nextRawData() iterator via OSAExecuteEvent, which loads the result value directly into a new scriptValueID; that value's literal representation can then be retrieved via OSADisplay and the resulting text passed back to TestReport's updateRawData(), which reinserts it into the original _testResults data. Once the iterator is exhausted, `osatest` can then call TestReport's renderReport() to assemble all that information (which is now all concatenatable text values) into the final report text, which `osatext` can then print to stdout before doing the whole exercise all over again for the next test handler.   � ���	�   n o t e :   C o n v e r t i n g   A S   o b j e c t s   t o   t h e i r   l i t e r a l   r e p r e s e n t a t i o n s   r e q u i r e s   s o m e   h o o p - j u m p i n g :   i t ' s   i m p r a c t i c a l   f o r   ` p e r f o r m   u n i t   t e s t `   t o   f o r m a t   t e s t   r e s u l t s   o n   t h e   f l y   a s   ` o s a t e s t `   d o e s n ' t   h a v e   a n   e v e n t   l o o p   s o   s e n d i n g   i t s e l f   A E s   w h i l e   t h e   s c r i p t   i s   e x e c u t i n g   m i g h t   b e   a   t a d   f i d d l y .   I n s t e a d ,   T e s t R e p o r t   j u s t   c a p t u r e s   e v e r y t h i n g   i n   i t s   _ t e s t R e s u l t s   p r o p e r t y   a n d   i s   r e t u r n e d   b y   ` p e r f o r m   u n i t   t e s t `   o n   c o m p l e t i o n   ( e n s u r i n g   t h e   c a p t u r e d   d a t a   s t a y s   i n s i d e   a n   A S   c o n t e x t ,   s o   t h a t   e . g .   a p p l i c a t i o n   r e f e r e n c e s   d o n ' t   l o s e   t h e i r   t a r g e t   a p p l i c a t i o n   a s   h a p p e n s   w h e n   t h e y ' r e   p a c k e d   i n t o   a n   A E   a s   a   n a k e d   t y p e O b j e c t S p e c i f i e r   d e s c r i p t o r ) .   ` o s a g l u e `   m u s t   t h e n   r e p e a t e d l y   c a l l   t h e   n e x t R a w D a t a ( )   i t e r a t o r   v i a   O S A E x e c u t e E v e n t ,   w h i c h   l o a d s   t h e   r e s u l t   v a l u e   d i r e c t l y   i n t o   a   n e w   s c r i p t V a l u e I D ;   t h a t   v a l u e ' s   l i t e r a l   r e p r e s e n t a t i o n   c a n   t h e n   b e   r e t r i e v e d   v i a   O S A D i s p l a y   a n d   t h e   r e s u l t i n g   t e x t   p a s s e d   b a c k   t o   T e s t R e p o r t ' s   u p d a t e R a w D a t a ( ) ,   w h i c h   r e i n s e r t s   i t   i n t o   t h e   o r i g i n a l   _ t e s t R e s u l t s   d a t a .   O n c e   t h e   i t e r a t o r   i s   e x h a u s t e d ,   ` o s a t e s t `   c a n   t h e n   c a l l   T e s t R e p o r t ' s   r e n d e r R e p o r t ( )   t o   a s s e m b l e   a l l   t h a t   i n f o r m a t i o n   ( w h i c h   i s   n o w   a l l   c o n c a t e n a t a b l e   t e x t   v a l u e s )   i n t o   t h e   f i n a l   r e p o r t   t e x t ,   w h i c h   ` o s a t e x t `   c a n   t h e n   p r i n t   t o   s t d o u t   b e f o r e   d o i n g   t h e   w h o l e   e x e r c i s e   a l l   o v e r   a g a i n   f o r   t h e   n e x t   t e s t   h a n d l e r .� ��� l     �m�l�k�m  �l  �k  � ��� l     �j���j  � � {{class:error info record, errorText:eText, errorNumber:eNumber, errorValue:eFrom, expectedType:eTo, partialResult:ePartial}   � ��� � { c l a s s : e r r o r   i n f o   r e c o r d ,   e r r o r T e x t : e T e x t ,   e r r o r N u m b e r : e N u m b e r ,   e r r o r V a l u e : e F r o m ,   e x p e c t e d T y p e : e T o ,   p a r t i a l R e s u l t : e P a r t i a l }� ��� j    �i��i $0 _errorrecordrefs _errorRecordRefs� J    �h�h  � ��� j    �g��g 0 
_dataindex 
_dataIndex� m    �f�f � ��� j    �e��e 0 _datasubindex _dataSubIndex� m    �d�d � ��� l     �c�b�a�c  �b  �a  � ��� i   !��� I      �`�_�^�` 0 nextrawdata  �_  �^  � l   1���� k    1�� ��� l     �]���]  � g a note: while most of these values can be dealt with natively, for now just toss them to formatter   � ��� �   n o t e :   w h i l e   m o s t   o f   t h e s e   v a l u e s   c a n   b e   d e a l t   w i t h   n a t i v e l y ,   f o r   n o w   j u s t   t o s s   t h e m   t o   f o r m a t t e r� ��� l     �\���\  � D > TO DO: need to see what happens when ocids/optrs are returned   � ��� |   T O   D O :   n e e d   t o   s e e   w h a t   h a p p e n s   w h e n   o c i d s / o p t r s   a r e   r e t u r n e d� ��� Z    &���[�Z� B     ��� o     �Y�Y 0 
_dataindex 
_dataIndex� n   ��� 1   
 �X
�X 
leng� o    
�W�W 0 _testresults _testResults� k   "�� ��� l   �V���V  � 4 . currently working way through an error record   � ��� \   c u r r e n t l y   w o r k i n g   w a y   t h r o u g h   a n   e r r o r   r e c o r d� ��� Z    n���U�T� >   ��� o    �S�S $0 _errorrecordrefs _errorRecordRefs� J    �R�R  � k    j�� ��� r    '��� n    %��� 1   # %�Q
�Q 
pcnt� n    #��� 4    #�P�
�P 
cobj� m   ! "�O�O � o     �N�N $0 _errorrecordrefs _errorRecordRefs� o      �M�M 0 	erroritem 	errorItem� ��� Z   ( g���L�K� =  ( /��� o   ( )�J�J 0 	erroritem 	errorItem� o   ) .�I�I 0 novalue NoValue� k   2 c�� ��� r   2 ?��� n   2 9��� 1   7 9�H
�H 
rest� o   2 7�G�G $0 _errorrecordrefs _errorRecordRefs� o      �F�F $0 _errorrecordrefs _errorRecordRefs� ��� Z  @ \���E�D� =  @ H��� o   @ E�C�C $0 _errorrecordrefs _errorRecordRefs� J   E G�B�B  � r   K X��� [   K R��� o   K P�A�A 0 _datasubindex _dataSubIndex� m   P Q�@�@ � o      �?�? 0 _datasubindex _dataSubIndex�E  �D  � ��>� L   ] c�� I   ] b�=�<�;�= 0 nextrawdata  �<  �;  �>  �L  �K  � ��:� L   h j�� o   h i�9�9 0 	erroritem 	errorItem�:  �U  �T  � ��� r   o ��� n   o }��� o   { }�8�8 0 testdata testData� n   o {��� 4   t {�7�
�7 
cobj� o   u z�6�6 0 
_dataindex 
_dataIndex� o   o t�5�5 0 _testresults _testResults� o      �4�4 0 datalist dataList� ��3� Z   �"���2�� B   � �� � o   � ��1�1 0 _datasubindex _dataSubIndex  n  � � 1   � ��0
�0 
leng o   � ��/�/ 0 datalist dataList� k   � �  l  � ��.�.   4 .	log {"NEXT:", item _dataSubIndex of dataList}    � \ 	 l o g   { " N E X T : " ,   i t e m   _ d a t a S u b I n d e x   o f   d a t a L i s t } 	
	 r   � � n   � � 4   � ��-
�- 
cobj m   � ��,�,  n   � � 4   � ��+
�+ 
cobj o   � ��*�* 0 _datasubindex _dataSubIndex o   � ��)�) 0 datalist dataList o      �(�( 0 thedata theData
  Z   � ��'�& F   � � I   � ��%�$�% 0 istype isType  o   � ��#�# 0 thedata theData �" m   � ��!
�! 
reco�"  �$   =  � � n  � �  m   � �� 
�  
pcls  o   � ��� 0 thedata theData o   � ��� $0 _caughterrortype _CaughtErrorType k   � �!! "#" r   � �$%$ J   � �&& '(' l 	 � �)��) N   � �** n   � �+,+ o   � ��� 0 errornumber errorNumber, o   � ��� 0 thedata theData�  �  ( -.- N   � �// n   � �010 o   � ��� 0 
errorvalue 
errorValue1 o   � ��� 0 thedata theData. 232 l 	 � �4��4 N   � �55 n   � �676 o   � ��� 0 expectedtype expectedType7 o   � ��� 0 thedata theData�  �  3 8�8 N   � �99 n   � �:;: o   � ��� 0 partialresult partialResult; o   � ��� 0 thedata theData�  % o      �� $0 _errorrecordrefs _errorRecordRefs# <=< Z  � �>?��> H   � �@@ I   � ��A�� 0 istype isTypeA BCB n   � �DED o   � ��� 0 	errortext 	errorTextE o   � ��
�
 0 thedata theDataC F�	F m   � ��
� 
ctxt�	  �  ? r   � �GHG N   � �II n   � �JKJ o   � ��� 0 	errortext 	errorTextK o   � ��� 0 thedata theDataH n      LML  ;   � �M o   � ��� $0 _errorrecordrefs _errorRecordRefs�  �  = N�N L   � �OO I   � ����� 0 nextrawdata  �  �  �  �'  �&   P� P L   � �QQ o   � ����� 0 thedata theData�   �2  � k   �"RR STS r   �UVU J   �WW XYX [   �Z[Z o   � ����� 0 
_dataindex 
_dataIndex[ m   � ���� Y \��\ m  ���� ��  V J      ]] ^_^ o      ���� 0 
_dataindex 
_dataIndex_ `��` o      ���� 0 _datasubindex _dataSubIndex��  T a��a L  "bb I  !�������� 0 nextrawdata  ��  ��  ��  �3  �[  �Z  � c��c l '1defd R  '1����g
�� .ascrerr ****      � ****��  g ��h��
�� 
errnh m  +.����f��  e 1 + `osatest` will check for this error number   f �ii V   ` o s a t e s t `   w i l l   c h e c k   f o r   t h i s   e r r o r   n u m b e r��  � ~ x repeatedly called by `osatest` when converting test data to literal representations; once exhausted, returns error 6502   � �jj �   r e p e a t e d l y   c a l l e d   b y   ` o s a t e s t `   w h e n   c o n v e r t i n g   t e s t   d a t a   t o   l i t e r a l   r e p r e s e n t a t i o n s ;   o n c e   e x h a u s t e d ,   r e t u r n s   e r r o r   6 5 0 2� klk l     ��������  ��  ��  l mnm i  " %opo I      ��q���� 0 updaterawdata  q r��r o      ���� 0 literaltext literalText��  ��  p l    pstus k     pvv wxw Z     myz��{y =    |}| o     ���� $0 _errorrecordrefs _errorRecordRefs} J    ����  z k    3~~ � l   ������  � # log {"UPDATE:", _testResults}   � ��� : l o g   { " U P D A T E : " ,   _ t e s t R e s u l t s }� ��� r    %��� o    ���� 0 literaltext literalText� n      ��� 4   ! $���
�� 
cobj� m   " #���� � n    !��� 4    !���
�� 
cobj� o     ���� 0 _datasubindex _dataSubIndex� n    ��� o    ���� 0 testdata testData� n    ��� 4    ���
�� 
cobj� o    ���� 0 
_dataindex 
_dataIndex� o    ���� 0 _testresults _testResults� ���� r   & 3��� [   & -��� o   & +���� 0 _datasubindex _dataSubIndex� m   + ,���� � o      ���� 0 _datasubindex _dataSubIndex��  ��  { k   6 m�� ��� r   6 B��� o   6 7���� 0 literaltext literalText� n      ��� 1   ? A��
�� 
pcnt� n   7 ?��� 4  < ?���
�� 
cobj� m   = >���� � o   7 <���� $0 _errorrecordrefs _errorRecordRefs� ��� r   C P��� n   C J��� 1   H J��
�� 
rest� o   C H���� $0 _errorrecordrefs _errorRecordRefs� o      ���� $0 _errorrecordrefs _errorRecordRefs� ���� Z  Q m������� =  Q Y��� o   Q V���� $0 _errorrecordrefs _errorRecordRefs� J   V X����  � r   \ i��� [   \ c��� o   \ a���� 0 _datasubindex _dataSubIndex� m   a b���� � o      ���� 0 _datasubindex _dataSubIndex��  ��  ��  x ���� L   n p����  ��  ta[ called by `osatest` to reinsert the raw data's literal representation; must be called after each nextRawData() (if formatting fails for any reason, use a placeholder, e.g. "�object�") -- TO DO: might be better to pass a boolean parameter along with literalText that indicates if the conversion failed; that way, reporter can decide what to insert   u ����   c a l l e d   b y   ` o s a t e s t `   t o   r e i n s e r t   t h e   r a w   d a t a ' s   l i t e r a l   r e p r e s e n t a t i o n ;   m u s t   b e   c a l l e d   a f t e r   e a c h   n e x t R a w D a t a ( )   ( i f   f o r m a t t i n g   f a i l s   f o r   a n y   r e a s o n ,   u s e   a   p l a c e h o l d e r ,   e . g .   " � o b j e c t � " )   - -   T O   D O :   m i g h t   b e   b e t t e r   t o   p a s s   a   b o o l e a n   p a r a m e t e r   a l o n g   w i t h   l i t e r a l T e x t   t h a t   i n d i c a t e s   i f   t h e   c o n v e r s i o n   f a i l e d ;   t h a t   w a y ,   r e p o r t e r   c a n   d e c i d e   w h a t   t o   i n s e r tn ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  & )��� I      �������� 0 renderreport  ��  ��  � l    ����� k     ��� ��� r     ��� m     �� ���  � o      ���� 0 testresults testResults� ��� Y    F�������� k    A�� ��� r    ��� n    ��� 4    ���
�� 
cobj� o    ���� 0 assertcount assertCount� o    ���� 0 _testresults _testResults� o      ���� 0 assertresult assertResult� ��� l     ������  � T N {outcomeType:FLAG, outcomeDescription:TEXT, testNote:USERTEXT, testData:LIST}   � ��� �   { o u t c o m e T y p e : F L A G ,   o u t c o m e D e s c r i p t i o n : T E X T ,   t e s t N o t e : U S E R T E X T ,   t e s t D a t a : L I S T }� ���� Z     A������ =    )��� n    #��� o   ! #���� 0 outcometype outcomeType� o     !���� 0 assertresult assertResult� o   # (���� 0 _failure _FAILURE� l  , ,��������  ��  ��  � ��� =  0 9��� n  0 3��� o   1 3���� 0 outcometype outcomeType� o   0 1���� 0 assertresult assertResult� o   3 8���� 0 _broken _BROKEN� ���� l  < <��������  ��  ��  ��  ��  ��  �� 0 assertcount assertCount� m    ���� � n    ��� 1    ��
�� 
leng� o    ���� 0 _testresults _testResults��  � ��� Z   G ������� =  G J��� o   G H���� 0 testresults testResults� m   H I�� ���  � Z   M ������� ?   M V��� n   M T��� 1   R T��
�� 
leng� o   M R���� 0 _testresults _testResults� m   T U����  � r   Y x��� b   Y v��� b   Y t��� b   Y l   b   Y j b   Y b n  Y ` o   ^ `���� 0 g   o   Y ^���� 0 vtstyle vtStyle m   ` a �		  P A S S n  b i

 o   g i���� 0 n   o   b g���� 0 vtstyle vtStyle m   j k � "   ( t e s t   p e r f o r m e d  � n   l s 1   q s��
�� 
leng o   l q���� 0 _testresults _testResults� m   t u �    a s s e r t i o n s )� o      ���� 0 testresults testResults��  � r   { � b   { � b   { � b   { � n  { � o   � ����� 0 e   o   { ����� 0 vtstyle vtStyle m   � � �  S K I P n  � � o   � ����� 0 n   o   � ����� 0 vtstyle vtStyle m   � �   �!! >   ( t e s t   p e r f o r m e d   n o   a s s e r t i o n s ) o      ���� 0 testresults testResults��  � l  � �"#$" r   � �%&% b   � �'(' b   � �)*) b   � �+,+ b   � �-.- b   � �/0/ n  � �121 o   � ����� 0 r  2 o   � ����� 0 vtstyle vtStyle0 n  � �343 o   � ����� 0 outcometype outcomeType4 o   � ����� 0 assertresult assertResult. n  � �565 o   � ����� 0 n  6 o   � ����� 0 vtstyle vtStyle, m   � �77 �88 8   ( t e s t   s t o p p e d   o n   a s s e r t i o n  * o   � ����� 0 assertcount assertCount( m   � �99 �::  )& o      ���� 0 testresults testResults# O I TO DO: don't use constants as message text; add "FAIL" or "BROKEN" here    $ �;; �   T O   D O :   d o n ' t   u s e   c o n s t a n t s   a s   m e s s a g e   t e x t ;   a d d   " F A I L "   o r   " B R O K E N "   h e r e  � <��< L   � �== o   � ����� 0 testresults testResults��  � m g construct final report text; also needs to return ok/fail/broke status flag for generating final tally   � �>> �   c o n s t r u c t   f i n a l   r e p o r t   t e x t ;   a l s o   n e e d s   t o   r e t u r n   o k / f a i l / b r o k e   s t a t u s   f l a g   f o r   g e n e r a t i n g   f i n a l   t a l l y� ?��? l     ����~��  �  �~  ��  ��  � @A@ l     �}�|�{�}  �|  �{  A B�zB l     �y�x�w�y  �x  �w  �z       �vCD ' , 1�uEFGHIJKL�v  C �t�s�r�q�p�o�n�m�l�k�j�i�h�t 0 novalue NoValue�s 0 _success _SUCCESS�r 0 _failure _FAILURE�q 0 _broken _BROKEN�p $0 _caughterrortype _CaughtErrorType�o .0 makecaughterrorrecord makeCaughtErrorRecord�n *0 _defaulterrorrecord _defaultErrorRecord�m <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord�l 0 istype isType�k (0 sanitizeidentifier sanitizeIdentifier�j  0 makecallobject makeCallObject�i 0 vt100 VT100�h  0 maketestreport makeTestReportD �g   M�g 0 novalue NoValueM  NN  
�u 
����E �f O�e�dOP�c�f .0 makecaughterrorrecord makeCaughtErrorRecord�e �bQ�b Q  �a�`�_�^�]�a 0 etext eText�` 0 enumber eNumber�_ 0 efrom eFrom�^ 
0 eto eTo�] 0 epartial ePartial�d  O �\�[�Z�Y�X�\ 0 etext eText�[ 0 enumber eNumber�Z 0 efrom eFrom�Y 
0 eto eTo�X 0 epartial ePartialP �W�V�U�T�S�R�Q
�W 
pcls�V 0 	errortext 	errorText�U 0 errornumber errorNumber�T 0 
errorvalue 
errorValue�S 0 expectedtype expectedType�R 0 partialresult partialResult�Q �c �b  ������F �P�OR
�P 
pcls
�O 
����R �NDS�N 0 	errortext 	errorTextS �MDT�M 0 errornumber errorNumberT �LDU�L 0 
errorvalue 
errorValueU �KDV�K 0 expectedtype expectedTypeV �JD�I�J 0 partialresult partialResult�I  G �H �G�FWX�E�H <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord�G �DY�D Y  �C�C 0 errorrecord errorRecord�F  W �B�A�B 0 errorrecord errorRecord�A $0 normalizedrecord normalizedRecordX 	�@�?�>�=�<�;�: � �
�@ 
leng
�? 
errn�>�Y
�= 
erob
�< 
errt
�; 
reco�: �E A��,j  )�������Y hO�b  %E�O��,b  �, )�������Y hO�H �9 ��8�7Z[�6�9 0 istype isType�8 �5\�5 \  �4�3�4 0 thevalue theValue�3 0 typename typeName�7  Z �2�1�2 0 thevalue theValue�1 0 typename typeName[ �0�/
�0 
kocl
�/ .corecnte****       ****�6 �kv�l jI �. ��-�,]^�+�. (0 sanitizeidentifier sanitizeIdentifier�- �*_�* _  �)�) 0 aname aName�,  ] �(�'�&�%�$�( 0 aname aName�' 0 res  �& 0 
legalchars 
legalChars�% 0 usepipes usePipes�$ 0 charref charRef^  � � � � � ��#�"�!� "-9;
�# 
kocl
�" 
cobj
�! .corecnte****       ****
�  
pcnt�+ t�� p��  �Y hO�E�O�E�OfE�O @�[��l kh ���, eE�O��, 
�%E�Y hY hO��%E�O�E�[OY��O� ��%�%E�Y hO�VJ �J��`a��  0 makecallobject makeCallObject� �b� b  ��� 0 handlername handlerName�  0 parametercount parameterCount�  ` ����� 0 handlername handlerName�  0 parametercount parameterCount� 0 args  � 0 i  a 
Th��������
� 
ctxt� (0 sanitizeidentifier sanitizeIdentifier
� .sysodsct****        scpt� R�E�O�j ) k�kh ��%�%E�[OY��O�[�\[Zm\Zi2E�Y hO�*�%k+ %�%*�k+ %�%�%�%j 	K ����cd�� 0 vt100 VT100� �e� e  �� 0 
formatcode 
formatCode�  c �� 0 
formatcode 
formatCoded �
�	���
�
 
cha �	 
� kfrmID  � )���0�%�%�%L ����fg��  0 maketestreport makeTestReport� �h� h  ��� � 0 testsuitename testSuiteName� "0 testhandlername testHandlerName�  0 isstyled isStyled�  f ������������ 0 testsuitename testSuiteName�� "0 testhandlername testHandlerName�� 0 isstyled isStyled�� 0 vtstyle vtStyle�� 0 
testreport 
TestReportg ��������������������������� ��
i�� 0 n  �� 0 vt100 VT100�� 0 b  �� 0 u  �� �� 0 r  �� �� 0 g  ��  �� 0 e  �� "�� �� 0 
testreport 
TestReporti ��j����kl��
�� .ascrinit****      � ****j k     )mm nn oo Opp cqq wrr �ss �tt �uu �vv mww �����  ��  ��  k ������������������������ 0 _testresults _testResults�� 0 
_addreport 
_addReport�� 0 
addsuccess 
addSuccess�� 0 
addfailure 
addFailure�� 0 	addbroken 	addBroken�� $0 _errorrecordrefs _errorRecordRefs�� 0 
_dataindex 
_dataIndex�� 0 _datasubindex _dataSubIndex�� 0 nextrawdata  �� 0 updaterawdata  �� 0 renderreport  l ��xyz{������|}~�� 0 _testresults _testResultsx ����������� 0 
_addreport 
_addReport�� ����� �  ���������� 0 outcometype outcomeType�� (0 outcomedescription outcomeDescription�� 0 testnote testNote�� 0 testdata testData��   ���������� 0 outcometype outcomeType�� (0 outcomedescription outcomeDescription�� 0 testnote testNote�� 0 testdata testData� ������������ 0 outcometype outcomeType�� (0 outcomedescription outcomeDescription�� 0 testnote testNote�� 0 testdata testData�� �� �����b   6FOPy ��R���������� 0 
addsuccess 
addSuccess�� ����� �  ������ 0 testnote testNote�� 0 testdata testData��  � ������ 0 testnote testNote�� 0 testdata testData� \������ �� 0 
_addreport 
_addReport�� *b  ࠡ�+ z ��f���������� 0 
addfailure 
addFailure�� ����� �  �������� (0 outcomedescription outcomeDescription�� 0 testnote testNote�� 0 testdata testData��  � �������� (0 outcomedescription outcomeDescription�� 0 testnote testNote�� 0 testdata testData� ������ �� 0 
_addreport 
_addReport�� *b  ����+ { ��z���������� 0 	addbroken 	addBroken�� ����� �  �������� (0 outcomedescription outcomeDescription�� 0 testnote testNote�� 0 testdata testData��  � �������� (0 outcomedescription outcomeDescription�� 0 testnote testNote�� 0 testdata testData� ������ �� 0 
_addreport 
_addReport�� *b  ����+ �� $0 _errorrecordrefs _errorRecordRefs�� 0 
_dataindex 
_dataIndex�� 0 _datasubindex _dataSubIndex| ������������� 0 nextrawdata  ��  ��  � �������� 0 	erroritem 	errorItem�� 0 datalist dataList�� 0 thedata theData� ��������������������������������������
�� 
leng
�� 
cobj
�� 
pcnt
�� 
rest�� 0 nextrawdata  �� 0 testdata testData
�� 
reco�� 0 istype isType
�� 
pcls
�� 
bool�� 0 errornumber errorNumber�� 0 
errorvalue 
errorValue�� 0 expectedtype expectedType�� 0 partialresult partialResult�� �� 0 	errortext 	errorText
�� 
ctxt
�� 
errn��f��2b  b   �,b  jv Tb  �k/�,E�O�b     6b  �,Ec  Ob  jv  b  kEc  Y hO*j+ Y hO�Y hOb   �b  /�,E�Ob  ��, p��b  /�l/E�O*��l+ 	 ��,b   �& C��,��,��,��,�vEc  O*��,a l+  ��,b  6FY hO*j+ Y hO�Y *b  kklvE[�k/Ec  Z[�l/Ec  ZO*j+ Y hO)a a lh} ��p���������� 0 updaterawdata  �� ����� �  ���� 0 literaltext literalText��  � ���� 0 literaltext literalText� ������~
�� 
cobj�� 0 testdata testData
� 
pcnt
�~ 
rest�� qb  jv  -�b   �b  /�,�b  /�l/FOb  kEc  Y 9�b  �k/�,FOb  �,Ec  Ob  jv  b  kEc  Y hOh~ �}��|�{���z�} 0 renderreport  �|  �{  � �y�x�w�y 0 testresults testResults�x 0 assertcount assertCount�w 0 assertresult assertResult� ��v�u�t��s�r�q �p79
�v 
leng
�u 
cobj�t 0 outcometype outcomeType�s 0 g  �r 0 n  �q 0 e  �p 0 r  �z ��E�O Akb   �,Ekh b   �/E�O��,b    hY ��,b    hY h[OY��O��  Hb   �,j $b  �,�%b  �,%�%b   �,%�%E�Y b  �,�%b  �,%�%E�Y b  �,��,%b  �,%�%�%�%E�O��� *jv�OL OL OL OL Ojv�Ok�Ok�OL OL 	OL 
� V� 3�*jk+ �*kk+ �*�k+ �*�k+ �*�k+ �*�k+ �E�Y ���������a �a �E�Oa a K S� ascr  ��ޭ