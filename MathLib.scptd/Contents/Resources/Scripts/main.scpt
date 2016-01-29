FasdUAS 1.101.10   ��   ��    k             l      ��  ��   � Math -- common math functions

Notes:

- While it is strongly recommended that dictionary-defined keywords consist of two or more distinct words (e.g. `check number`; not `check` or `checkNumber`) to reduce risk of collisions with other keywords or user-defined identifiers, MathLib makes exceptions for established math terms that users are already familiar with (`abs`, `sin`, etc).

- Some handlers originally based on ESG MathLib <http://www.esglabs.com/>, which in turn are conversions of the ones in the Cephes Mathematical Library by Stephen L. Moshier <http://netlib.org/cephes/>.


TO DO: 

- add `away from zero`

- what else needs implemented? e.g. atan2? (note that trivial operations such as `hypotenuse`, `square` and `square root` are not implemented as those are simple to do using AS's existing `^` operator (e.g. sqrt(n)=n^0.5), while `floor`, `ceil`, etc. are already covered by `round number`

- move `parse number` and `format number` here, and merge the canonical and hex commands below into them

     � 	 	�   M a t h   - -   c o m m o n   m a t h   f u n c t i o n s 
 
 N o t e s : 
 
 -   W h i l e   i t   i s   s t r o n g l y   r e c o m m e n d e d   t h a t   d i c t i o n a r y - d e f i n e d   k e y w o r d s   c o n s i s t   o f   t w o   o r   m o r e   d i s t i n c t   w o r d s   ( e . g .   ` c h e c k   n u m b e r ` ;   n o t   ` c h e c k `   o r   ` c h e c k N u m b e r ` )   t o   r e d u c e   r i s k   o f   c o l l i s i o n s   w i t h   o t h e r   k e y w o r d s   o r   u s e r - d e f i n e d   i d e n t i f i e r s ,   M a t h L i b   m a k e s   e x c e p t i o n s   f o r   e s t a b l i s h e d   m a t h   t e r m s   t h a t   u s e r s   a r e   a l r e a d y   f a m i l i a r   w i t h   ( ` a b s ` ,   ` s i n ` ,   e t c ) . 
 
 -   S o m e   h a n d l e r s   o r i g i n a l l y   b a s e d   o n   E S G   M a t h L i b   < h t t p : / / w w w . e s g l a b s . c o m / > ,   w h i c h   i n   t u r n   a r e   c o n v e r s i o n s   o f   t h e   o n e s   i n   t h e   C e p h e s   M a t h e m a t i c a l   L i b r a r y   b y   S t e p h e n   L .   M o s h i e r   < h t t p : / / n e t l i b . o r g / c e p h e s / > . 
 
 
 T O   D O :   
 
 -   a d d   ` a w a y   f r o m   z e r o ` 
 
 -   w h a t   e l s e   n e e d s   i m p l e m e n t e d ?   e . g .   a t a n 2 ?   ( n o t e   t h a t   t r i v i a l   o p e r a t i o n s   s u c h   a s   ` h y p o t e n u s e ` ,   ` s q u a r e `   a n d   ` s q u a r e   r o o t `   a r e   n o t   i m p l e m e n t e d   a s   t h o s e   a r e   s i m p l e   t o   d o   u s i n g   A S ' s   e x i s t i n g   ` ^ `   o p e r a t o r   ( e . g .   s q r t ( n ) = n ^ 0 . 5 ) ,   w h i l e   ` f l o o r ` ,   ` c e i l ` ,   e t c .   a r e   a l r e a d y   c o v e r e d   b y   ` r o u n d   n u m b e r ` 
 
 -   m o v e   ` p a r s e   n u m b e r `   a n d   ` f o r m a t   n u m b e r `   h e r e ,   a n d   m e r g e   t h e   c a n o n i c a l   a n d   h e x   c o m m a n d s   b e l o w   i n t o   t h e m 
 
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -     !   l     �� " #��   "   support    # � $ $    s u p p o r t !  % & % l     ��������  ��  ��   &  ' ( ' l      ) * + ) j    �� ,�� 0 _supportlib _supportLib , N     - - 4    �� .
�� 
scpt . m     / / � 0 0 " L i b r a r y S u p p o r t L i b * "  used for parameter checking    + � 1 1 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g (  2 3 2 l     ��������  ��  ��   3  4 5 4 i   ! 6 7 6 I      �� 8���� 
0 _error   8  9 : 9 o      ���� 0 handlername handlerName :  ; < ; o      ���� 0 etext eText <  = > = o      ���� 0 enumber eNumber >  ? @ ? o      ���� 0 efrom eFrom @  A�� A o      ���� 
0 eto eTo��  ��   7 n     B C B I    �� D���� &0 throwcommanderror throwCommandError D  E F E m     G G � H H  M a t h L i b F  I J I o    ���� 0 handlername handlerName J  K L K o    ���� 0 etext eText L  M N M o    	���� 0 enumber eNumber N  O P O o   	 
���� 0 efrom eFrom P  Q�� Q o   
 ���� 
0 eto eTo��  ��   C o     ���� 0 _supportlib _supportLib 5  R S R l     ��������  ��  ��   S  T U T l     ��������  ��  ��   U  V W V l     �� X Y��   X J D--------------------------------------------------------------------    Y � Z Z � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - W  [ \ [ l     �� ] ^��   ]  
 constants    ^ � _ _    c o n s t a n t s \  ` a ` l     ��������  ��  ��   a  b c b l      d e f d j   " $�� g�� 	0 __e__   g m   " # h h @�
�_� e ; 5 The mathematical constant e (natural logarithm base)    f � i i j   T h e   m a t h e m a t i c a l   c o n s t a n t   e   ( n a t u r a l   l o g a r i t h m   b a s e ) c  j k j l     ��������  ��  ��   k  l m l j   % '�� n�� 0 _isequaldelta _isEqualDelta n m   % & o o >.�&֕ m  p q p l     ��������  ��  ��   q  r s r l     �� t u��   t a [ pre-calculated values (0-360� in 15� increments) -- TO DO: precalculate for 1� increments?    u � v v �   p r e - c a l c u l a t e d   v a l u e s   ( 0 - 3 6 0 �   i n   1 5 �   i n c r e m e n t s )   - -   T O   D O :   p r e c a l c u l a t e   f o r   1 �   i n c r e m e n t s ? s  w x w j   ( e�� y�� 0 _precalcsine _precalcSine y J   ( d z z  { | { m   ( ) } }          |  ~  ~ m   ) * � � ?А}��(J   � � � m   * + � � ?�       �  � � � m   + , � � ?栞fK� �  � � � m   , / � � ?�z�X=; �  � � � m   / 2 � � ?���GH�� �  � � � m   2 5 � � ?�       �  � � � m   5 8 � � ?���GH�� �  � � � m   8 ; � � ?�z�X=; �  � � � m   ; < � � ?栞fK� �  � � � m   < = � � ?�       �  � � � m   = > � � ?А}��(J �  � � � m   > ? � �          �  � � � m   ? B � � �А}��(J �  � � � m   B E � � ��       �  � � � m   E H � � �栞fK� �  � � � m   H K � � ��z�X=; �  � � � m   K N � � ����GH�� �  � � � m   N Q � � ��       �  � � � m   Q T � � ����GH�� �  � � � m   T W � � ��z�X=; �  � � � m   W Z � � �栞fK� �  � � � m   Z ] � � ��       �  ��� � m   ] ` � � �А}��(J��   x  � � � j   f ��� ��� "0 _precalctangent _precalcTangent � J   f � � �  � � � m   f g � �          �  � � � m   g j � � ?�&^�Ĵ �  � � � m   j m � � ?�y�E�@G �  � � � m   m p � � ?�       �  � � � m   p s � � ?��z�XN� �  � � � m   s v � � @�=t,'j �  � � � m   v y��
�� 
msng �  � � � m   y | � � ��=t,'j �  � � � m   |  � � ���z�XN� �  � � � m    � � � ��       �  � � � m   � � � � ��y�E�@G �  � � � m   � � � � ��&^�Ĵ �  � � � m   � � � �          �  � � � m   � � � � ?�&^�Ĵ �  � � � m   � � � � ?�y�E�@G �  � � � m   � � � � ?�       �  � � � m   � � � � ?��z�XN� �  � � � m   � � � � @�=t,'j �  � � � m   � ���
�� 
msng �  � � � m   � � � � ��=t,'j �    m   � � ���z�XN�  m   � � ��        m   � � ��y�E�@G 	��	 m   � �

 ��&^�Ĵ��   �  l     ��������  ��  ��    l     ��������  ��  ��    l     ����   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����     General    �    G e n e r a l  l     ��������  ��  ��    i  � � I      �������� 60 _canonicalnumberformatter _canonicalNumberFormatter��  ��   k     &  !  r     "#" n    $%$ I    �������� 0 init  ��  ��  % n    &'& I    �������� 	0 alloc  ��  ��  ' n    ()( o    ���� &0 nsnumberformatter NSNumberFormatter) m     ��
�� misccura# o      ���� 0 asocformatter asocFormatter! *+* n   ,-, I    ��.���� "0 setnumberstyle_ setNumberStyle_. /��/ l   0����0 n   121 o    ���� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle2 m    ��
�� misccura��  ��  ��  ��  - o    ���� 0 asocformatter asocFormatter+ 343 l   #5675 n   #898 I    #��:���� 0 
setlocale_ 
setLocale_: ;��; l   <����< n   =>= I    �������� 0 systemlocale systemLocale��  ��  > n   ?@? o    ���� 0 nslocale NSLocale@ m    ��
�� misccura��  ��  ��  ��  9 o    ���� 0 asocformatter asocFormatter6 [ U note: NSNumberFormatter uses currentLocale by default, which isn't what we want here   7 �AA �   n o t e :   N S N u m b e r F o r m a t t e r   u s e s   c u r r e n t L o c a l e   b y   d e f a u l t ,   w h i c h   i s n ' t   w h a t   w e   w a n t   h e r e4 B��B L   $ &CC o   $ %���� 0 asocformatter asocFormatter��   DED l     ��������  ��  ��  E FGF l     ��������  ��  ��  G HIH l     ��������  ��  ��  I JKJ i  � �LML I     ��N��
�� .Mth:NuTenull���     nmbrN o      �� 0 	thenumber 	theNumber��  M Q     BOPQO k    0RR STS Z    "UV�~�}U =    WXW l   Y�|�{Y I   �zZ[
�z .corecnte****       ****Z J    \\ ]�y] o    �x�x 0 	thenumber 	theNumber�y  [ �w^�v
�w 
kocl^ m    �u
�u 
nmbr�v  �|  �{  X m    �t�t  V l   _`a_ n   bcb I    �sd�r�s 60 throwinvalidparametertype throwInvalidParameterTyped efe o    �q�q 0 	thenumber 	theNumberf ghg m    ii �jj  h klk m    mm �nn  n u m b e rl o�po m    �o
�o 
nmbr�p  �r  c o    �n�n 0 _supportlib _supportLib` � � only accept integer or real types (i.e. allowing a text parameter to be coerced to number would defeat the purpose of these handlers, which is to guarantee non-localized conversions)   a �ppn   o n l y   a c c e p t   i n t e g e r   o r   r e a l   t y p e s   ( i . e .   a l l o w i n g   a   t e x t   p a r a m e t e r   t o   b e   c o e r c e d   t o   n u m b e r   w o u l d   d e f e a t   t h e   p u r p o s e   o f   t h e s e   h a n d l e r s ,   w h i c h   i s   t o   g u a r a n t e e   n o n - l o c a l i z e d   c o n v e r s i o n s )�~  �}  T q�mq L   # 0rr c   # /sts l  # -u�l�ku n  # -vwv I   ( -�jx�i�j &0 stringfromnumber_ stringFromNumber_x y�hy o   ( )�g�g 0 	thenumber 	theNumber�h  �i  w I   # (�f�e�d�f 60 _canonicalnumberformatter _canonicalNumberFormatter�e  �d  �l  �k  t m   - .�c
�c 
ctxt�m  P R      �bz{
�b .ascrerr ****      � ****z o      �a�a 0 etext eText{ �`|}
�` 
errn| o      �_�_ 0 enumber eNumber} �^~
�^ 
erob~ o      �]�] 0 efrom eFrom �\��[
�\ 
errt� o      �Z�Z 
0 eto eTo�[  Q I   8 B�Y��X�Y 
0 _error  � ��� m   9 :�� ��� , c o n v e r t   n u m b e r   t o   t e x t� ��� o   : ;�W�W 0 etext eText� ��� o   ; <�V�V 0 enumber eNumber� ��� o   < =�U�U 0 efrom eFrom� ��T� o   = >�S�S 
0 eto eTo�T  �X  K ��� l     �R�Q�P�R  �Q  �P  � ��� l     �O�N�M�O  �N  �M  � ��� i  � ���� I     �L��K
�L .Mth:TeNunull���     ctxt� o      �J�J 0 thetext theText�K  � Q     ]���� k    G�� ��� Z    "���I�H� =    ��� l   ��G�F� I   �E��
�E .corecnte****       ****� J    �� ��D� o    �C�C 0 thetext theText�D  � �B��A
�B 
kocl� m    �@
�@ 
ctxt�A  �G  �F  � m    �?�?  � l   ���� n   ��� I    �>��=�> 60 throwinvalidparametertype throwInvalidParameterType� ��� o    �<�< 0 thetext theText� ��� m    �� ���  � ��� m    �� ���  t e x t� ��;� m    �:
�: 
ctxt�;  �=  � o    �9�9 0 _supportlib _supportLib� � � only accept text (i.e. allowing an integer/real parameter to be coerced to text would defeat the purpose of these handlers, which is to guarantee non-localized conversions)   � ���Z   o n l y   a c c e p t   t e x t   ( i . e .   a l l o w i n g   a n   i n t e g e r / r e a l   p a r a m e t e r   t o   b e   c o e r c e d   t o   t e x t   w o u l d   d e f e a t   t h e   p u r p o s e   o f   t h e s e   h a n d l e r s ,   w h i c h   i s   t o   g u a r a n t e e   n o n - l o c a l i z e d   c o n v e r s i o n s )�I  �H  � ��� r   # /��� n  # -��� I   ( -�8��7�8 &0 numberfromstring_ numberFromString_� ��6� o   ( )�5�5 0 thetext theText�6  �7  � I   # (�4�3�2�4 60 _canonicalnumberformatter _canonicalNumberFormatter�3  �2  � o      �1�1 0 	theresult 	theResult� ��� Z  0 B���0�/� =  0 3��� o   0 1�.�. 0 	theresult 	theResult� m   1 2�-
�- 
msng� R   6 >�,��
�, .ascrerr ****      � ****� m   < =�� ��� Z T e x t   v a l u e   i s n  t   a n   A p p l e S c r i p t - s t y l e   n u m b e r .� �+��
�+ 
errn� m   8 9�*�*�Y� �)��(
�) 
erob� o   : ;�'�' 0 thetext theText�(  �0  �/  � ��&� L   C G�� c   C F��� o   C D�%�% 0 	theresult 	theResult� m   D E�$
�$ 
****�&  � R      �#��
�# .ascrerr ****      � ****� o      �"�" 0 etext eText� �!��
�! 
errn� o      � �  0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � I   O ]���� 
0 _error  � ��� m   P S�� ��� , c o n v e r t   t e x t   t o   n u m b e r� ��� o   S T�� 0 etext eText� ��� o   T U�� 0 enumber eNumber� ��� o   U V�� 0 efrom eFrom� ��� o   V W�� 
0 eto eTo�  �  � ��� l     ����  �  �  � ��� l     ����  � � � TO DO: if the above handlers are merged into `format number`/`parse number` then the following handlers should be renamed `format hexadecimal`/`parse hexadecimal`   � ���F   T O   D O :   i f   t h e   a b o v e   h a n d l e r s   a r e   m e r g e d   i n t o   ` f o r m a t   n u m b e r ` / ` p a r s e   n u m b e r `   t h e n   t h e   f o l l o w i n g   h a n d l e r s   s h o u l d   b e   r e n a m e d   ` f o r m a t   h e x a d e c i m a l ` / ` p a r s e   h e x a d e c i m a l `� ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Mth:NuHenull���     long� o      �� 0 	thenumber 	theNumber� �
��
�
 
Plac� |�	�����	  �  � o      �� 0 padsize padSize�  � l     ���� m      ��  �  �  � ���
� 
Pref� |� �������   ��  � o      ���� 0 	hasprefix 	hasPrefix��  � l     ������ m      ��
�� boovtrue��  ��  �  � l    ����� Q     �� � k    �  r     n    I    ��	���� (0 asintegerparameter asIntegerParameter	 

 o    	���� 0 	thenumber 	theNumber �� m   	 
 �  ��  ��   o    ���� 0 _supportlib _supportLib o      ���� 0 	thenumber 	theNumber  r     n    I    ������ (0 asintegerparameter asIntegerParameter  o    ���� 0 padsize padSize �� m     �  p a d d i n g   t o��  ��   o    ���� 0 _supportlib _supportLib o      ���� 0 padsize padSize  r    , n   *  I   $ *��!���� (0 asbooleanparameter asBooleanParameter! "#" o   $ %���� 0 	hasprefix 	hasPrefix# $��$ m   % &%% �&&  p r e f i x��  ��    o    $���� 0 _supportlib _supportLib o      ���� 0 	hasprefix 	hasPrefix '(' r   - 0)*) m   - .++ �,,  * o      ���� 0 hextext hexText( -.- Z   1 E/0��1/ A   1 4232 o   1 2���� 0 	thenumber 	theNumber3 m   2 3����  0 k   7 ?44 565 r   7 :787 m   7 899 �::  -8 o      ���� 0 	hexprefix 	hexPrefix6 ;��; r   ; ?<=< d   ; =>> o   ; <���� 0 	thenumber 	theNumber= o      ���� 0 	thenumber 	theNumber��  ��  1 r   B E?@? m   B CAA �BB  @ o      ���� 0 	hexprefix 	hexPrefix. CDC Z  F SEF����E o   F G���� 0 	hasprefix 	hasPrefixF r   J OGHG b   J MIJI o   J K���� 0 	hexprefix 	hexPrefixJ m   K LKK �LL  0 xH o      ���� 0 	hexprefix 	hexPrefix��  ��  D MNM V   T sOPO k   \ nQQ RSR r   \ hTUT b   \ fVWV l  \ dX����X n   \ dYZY 4   ] d��[
�� 
cobj[ l  ^ c\����\ [   ^ c]^] `   ^ a_`_ o   ^ _���� 0 	thenumber 	theNumber` m   _ `���� ^ m   a b���� ��  ��  Z m   \ ]aa �bb   0 1 2 3 4 5 6 7 8 9 A B C D E F��  ��  W o   d e���� 0 hextext hexTextU o      ���� 0 hextext hexTextS c��c r   i nded _   i lfgf o   i j���� 0 	thenumber 	theNumberg m   j k���� e o      ���� 0 	thenumber 	theNumber��  P ?   X [hih o   X Y���� 0 	thenumber 	theNumberi m   Y Z����  N jkj V   t �lml r   ~ �non b   ~ �pqp m   ~ rr �ss  0q o    ����� 0 hextext hexTexto o      ���� 0 hextext hexTextm A   x }tut n   x {vwv 1   y {��
�� 
lengw o   x y���� 0 hextext hexTextu o   { |���� 0 padsize padSizek x��x L   � �yy b   � �z{z o   � ����� 0 	hexprefix 	hexPrefix{ o   � ����� 0 hextext hexText��    R      ��|}
�� .ascrerr ****      � ****| o      ���� 0 etext eText} ��~
�� 
errn~ o      ���� 0 enumber eNumber ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I   � �������� 
0 _error  � ��� m   � ��� ��� : c o n v e r t   n u m b e r   t o   h e x a d e c i m a l� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  � � � TO DO: `padding to` is not an ideal name (OTOH, `using padding` sounds awkward, while `with padding` would likely cause confusion as standard `with`/`without` keywords may already be used with boolean `prefix` parameters)   � ����   T O   D O :   ` p a d d i n g   t o `   i s   n o t   a n   i d e a l   n a m e   ( O T O H ,   ` u s i n g   p a d d i n g `   s o u n d s   a w k w a r d ,   w h i l e   ` w i t h   p a d d i n g `   w o u l d   l i k e l y   c a u s e   c o n f u s i o n   a s   s t a n d a r d   ` w i t h ` / ` w i t h o u t `   k e y w o r d s   m a y   a l r e a d y   b e   u s e d   w i t h   b o o l e a n   ` p r e f i x `   p a r a m e t e r s )� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     ����
�� .Mth:HeNunull���     ctxt� o      ���� 0 hextext hexText� �����
�� 
Prec� |����������  ��  � o      ���� 0 	isprecise 	isPrecise��  � l     ������ m      ��
�� boovtrue��  ��  ��  � Q    ���� P    ����� k    ��� ��� r    ��� n   ��� I    ������� "0 astextparameter asTextParameter� ��� o    ���� 0 hextext hexText� ���� m    �� ���  ��  ��  � o    ���� 0 _supportlib _supportLib� o      ���� 0 hextext hexText� ��� r    #��� n   !��� I    !������� (0 asbooleanparameter asBooleanParameter� ��� o    ���� 0 	isprecise 	isPrecise� ���� m    �� ���  f u l l   p r e c i s i o n��  ��  � o    ���� 0 _supportlib _supportLib� o      ���� 0 	isprecise 	isPrecise� ��� Q   $ ����� k   ' ��� ��� r   ' *��� m   ' (����  � o      ���� 0 	thenumber 	theNumber� ��� r   + 0��� C   + .��� o   + ,���� 0 hextext hexText� m   , -�� ���  -� o      ���� 0 
isnegative 
isNegative� ��� Z  1 F������� o   1 2���� 0 
isnegative 
isNegative� r   5 B��� n   5 @��� 7  6 @����
�� 
ctxt� m   : <���� � m   = ?������� o   5 6���� 0 hextext hexText� o      ���� 0 hextext hexText��  ��  � ��� Z  G ^������� C   G J��� o   G H���� 0 hextext hexText� m   H I�� ���  0 x� r   M Z��� n   M X��� 7  N X����
�� 
ctxt� m   R T���� � m   U W������� o   M N���� 0 hextext hexText� o      ���� 0 hextext hexText��  ��  � ���� X   _ ����� k   o ��� ��� r   o t��� ]   o r��� o   o p�~�~ 0 	thenumber 	theNumber� m   p q�}�} � o      �|�| 0 	thenumber 	theNumber� ��� r   u ���� I  u ���{�� z�z�y
�z .sysooffslong    ��� null
�y misccura�{  � �x��
�x 
psof� o   { |�w�w 0 charref charRef� �v��u
�v 
psin� m   } ��� ���   0 1 2 3 4 5 6 7 8 9 A B C D E F�u  � o      �t�t 0 i  � ��� Z  � ����s�r� =   � �   o   � ��q�q 0 i   m   � ��p�p  � R   � ��o�n�m
�o .ascrerr ****      � ****�n  �m  �s  �r  � �l r   � � \   � � [   � � o   � ��k�k 0 	thenumber 	theNumber o   � ��j�j 0 i   m   � ��i�i  o      �h�h 0 	thenumber 	theNumber�l  � 0 charref charRef� o   b c�g�g 0 hextext hexText��  � R      �f�e�d
�f .ascrerr ****      � ****�e  �d  � R   � ��c	

�c .ascrerr ****      � ****	 m   � � � > N o t   a   v a l i d   h e x a d e c i m a l   n u m b e r .
 �b
�b 
errn m   � ��a�a�Y �`�_
�` 
erob o   � ��^�^ 0 hextext hexText�_  �  Z  � ��]�\ F   � � o   � ��[�[ 0 	isprecise 	isPrecise l  � ��Z�Y =   � � o   � ��X�X 0 	thenumber 	theNumber [   � � o   � ��W�W 0 	thenumber 	theNumber m   � ��V�V �Z  �Y   R   � ��U
�U .ascrerr ****      � **** m   � � � j H e x a d e c i m a l   n u m b e r   i s   t o o   l a r g e   t o   c o n v e r t   p r e c i s e l y . �T 
�T 
errn m   � ��S�S�Y  �R!"
�R 
erob! o   � ��Q�Q 0 hextext hexText" �P#�O
�P 
errt# m   � ��N
�N 
doub�O  �]  �\   $%$ Z  � �&'�M�L& o   � ��K�K 0 
isnegative 
isNegative' r   � �()( d   � �** o   � ��J�J 0 	thenumber 	theNumber) o      �I�I 0 	thenumber 	theNumber�M  �L  % +�H+ L   � �,, o   � ��G�G 0 	thenumber 	theNumber�H  � �F-
�F consdiac- �E.
�E conshyph. �D/
�D conspunc/ �C�B
�C conswhit�B  � �A0
�A conscase0 �@�?
�@ consnume�?  � R      �>12
�> .ascrerr ****      � ****1 o      �=�= 0 etext eText2 �<34
�< 
errn3 o      �;�; 0 enumber eNumber4 �:56
�: 
erob5 o      �9�9 0 efrom eFrom6 �87�7
�8 
errt7 o      �6�6 
0 eto eTo�7  � I  �58�4�5 
0 _error  8 9:9 m  	;; �<< : c o n v e r t   h e x a d e c i m a l   t o   n u m b e r: =>= o  	
�3�3 0 etext eText> ?@? o  
�2�2 0 enumber eNumber@ ABA o  �1�1 0 efrom eFromB C�0C o  �/�/ 
0 eto eTo�0  �4  � DED l     �.�-�,�.  �-  �,  E FGF l     �+�*�)�+  �*  �)  G HIH l     �(�'�&�(  �'  �&  I JKJ i  � �LML I     �%N�$
�% .Mth:DeRanull���     doubN o      �#�# 0 n  �$  M Q     OPQO L    RR ]    
STS l   U�"�!U c    VWV o    � �  0 n  W m    �
� 
doub�"  �!  T l   	X��X ^    	YZY 1    �
� 
pi  Z m    �� ��  �  P R      �[\
� .ascrerr ****      � ****[ o      �� 0 etext eText\ �]^
� 
errn] o      �� 0 enumber eNumber^ �_`
� 
erob_ o      �� 0 efrom eFrom` �a�
� 
errta o      �� 
0 eto eTo�  Q I    �b�� 
0 _error  b cdc m    ee �ff 4 c o n v e r t   d e g r e e s   t o   r a d i a n sd ghg o    �� 0 etext eTexth iji o    �� 0 enumber eNumberj klk o    �� 0 efrom eFroml m�m o    �� 
0 eto eTo�  �  K non l     �
�	��
  �	  �  o pqp l     ����  �  �  q rsr i  � �tut I     �v�
� .Mth:RaDenull���     doubv o      �� 0 n  �  u Q     wxyw L    	zz ^    {|{ o    �� 0 n  | l   }� ��} ^    ~~ 1    ��
�� 
pi   m    ���� ��   ��  x R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  y I    ������� 
0 _error  � ��� m    �� ��� 4 c o n v e r t   r a d i a n s   t o   d e g r e e s� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  ��  s ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Abs_null���     nmbr� o      ���� 0 n  ��  � Q     )���� k    �� ��� r    ��� c    ��� o    ���� 0 n  � m    ��
�� 
nmbr� o      ���� 0 n  � ���� Z   	 ������ A   	 ��� o   	 
���� 0 n  � m   
 ����  � L    �� d    �� o    ���� 0 n  ��  � L    �� o    ���� 0 n  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I    )������� 
0 _error  � ��� m     !�� ���  a b s� ��� o   ! "���� 0 etext eText� ��� o   " #���� 0 enumber eNumber� ��� o   # $���� 0 efrom eFrom� ���� o   $ %���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:CmpNnull���     ****� J      �� ��� o      ���� 0 n1  � ���� o      ���� 0 n2  ��  ��  � Q     Y���� k    G�� ��� r    ��� J    �� ��� c    ��� o    ���� 0 n1  � m    ��
�� 
doub� ���� c    	��� o    ���� 0 n2  � m    ��
�� 
doub��  � J      �� ��� o      ���� 0 n1  � ���� o      ���� 0 n2  ��  � ���� Z    G����� F    2��� l   $������ A    $��� \    "��� o    ���� 0 n1  � o    !���� 0 _isequaldelta _isEqualDelta� o   " #���� 0 n2  ��  ��  � l  ' 0������ ?   ' 0��� [   ' .��� o   ' (���� 0 n1  � o   ( -���� 0 _isequaldelta _isEqualDelta� o   . /���� 0 n2  ��  ��  � L   5 7�� m   5 6����  � ��� A   : =��� o   : ;���� 0 n1  � o   ; <���� 0 n2  � ���� L   @ B�� m   @ A��������  � L   E G�� m   E F���� ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� �� 
�� 
errn  o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I   O Y������ 
0 _error    m   P Q �		  c m p 

 o   Q R���� 0 etext eText  o   R S���� 0 enumber eNumber  o   S T���� 0 efrom eFrom �� o   T U���� 
0 eto eTo��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    i  � � I     ����
�� .Mth:MinNnull���     **** o      ���� 0 thelist theList��   Q     Y k    G  r     !  n   "#" I    ��$���� "0 aslistparameter asListParameter$ %&% o    	���� 0 thelist theList& '��' m   	 
(( �))  ��  ��  # o    ���� 0 _supportlib _supportLib! o      ���� 0 thelist theList *+* r    ,-, c    ./. l   0����0 n    121 4   ��3
�� 
cobj3 m    ���� 2 o    ���� 0 thelist theList��  ��  / m    �
� 
nmbr- o      �~�~ 0 	theresult 	theResult+ 454 X    D6�}76 k   * ?88 9:9 r   * 1;<; c   * /=>= n  * -?@? 1   + -�|
�| 
pcnt@ o   * +�{�{ 0 aref aRef> m   - .�z
�z 
nmbr< o      �y�y 0 n  : A�xA Z  2 ?BC�w�vB A   2 5DED o   2 3�u�u 0 n  E o   3 4�t�t 0 	theresult 	theResultC r   8 ;FGF o   8 9�s�s 0 n  G o      �r�r 0 	theresult 	theResult�w  �v  �x  �} 0 aref aRef7 o    �q�q 0 thelist theList5 H�pH L   E GII o   E F�o�o 0 	theresult 	theResult�p   R      �nJK
�n .ascrerr ****      � ****J o      �m�m 0 etext eTextK �lLM
�l 
errnL o      �k�k 0 enumber eNumberM �jNO
�j 
erobN o      �i�i 0 efrom eFromO �hP�g
�h 
errtP o      �f�f 
0 eto eTo�g   I   O Y�eQ�d�e 
0 _error  Q RSR m   P QTT �UU  m i nS VWV o   Q R�c�c 0 etext eTextW XYX o   R S�b�b 0 enumber eNumberY Z[Z o   S T�a�a 0 efrom eFrom[ \�`\ o   T U�_�_ 
0 eto eTo�`  �d   ]^] l     �^�]�\�^  �]  �\  ^ _`_ l     �[�Z�Y�[  �Z  �Y  ` aba i  � �cdc I     �Xe�W
�X .Mth:MaxNnull���     ****e o      �V�V 0 thelist theList�W  d Q     Yfghf k    Gii jkj r    lml n   non I    �Up�T�U "0 aslistparameter asListParameterp qrq o    	�S�S 0 thelist theListr s�Rs m   	 
tt �uu  �R  �T  o o    �Q�Q 0 _supportlib _supportLibm o      �P�P 0 thelist theListk vwv r    xyx c    z{z l   |�O�N| n    }~} 4   �M
�M 
cobj m    �L�L ~ o    �K�K 0 thelist theList�O  �N  { m    �J
�J 
nmbry o      �I�I 0 	theresult 	theResultw ��� X    D��H�� k   * ?�� ��� r   * 1��� c   * /��� n  * -��� 1   + -�G
�G 
pcnt� o   * +�F�F 0 aref aRef� m   - .�E
�E 
nmbr� o      �D�D 0 n  � ��C� Z  2 ?���B�A� ?   2 5��� o   2 3�@�@ 0 n  � o   3 4�?�? 0 	theresult 	theResult� r   8 ;��� o   8 9�>�> 0 n  � o      �=�= 0 	theresult 	theResult�B  �A  �C  �H 0 aref aRef� o    �<�< 0 thelist theList� ��;� L   E G�� o   E F�:�: 0 	theresult 	theResult�;  g R      �9��
�9 .ascrerr ****      � ****� o      �8�8 0 etext eText� �7��
�7 
errn� o      �6�6 0 enumber eNumber� �5��
�5 
erob� o      �4�4 0 efrom eFrom� �3��2
�3 
errt� o      �1�1 
0 eto eTo�2  h I   O Y�0��/�0 
0 _error  � ��� m   P Q�� ���  m a x� ��� o   Q R�.�. 0 etext eText� ��� o   R S�-�- 0 enumber eNumber� ��� o   S T�,�, 0 efrom eFrom� ��+� o   T U�*�* 
0 eto eTo�+  �/  b ��� l     �)�(�'�)  �(  �'  � ��� l     �&�%�$�&  �%  �$  � ��� i  � ���� I     �#��
�# .Mth:RouNnull���     doub� o      �"�" 0 num  � �!��
�! 
Plac� |� �����   �  � o      �� 0 decimalplaces decimalPlaces�  � l     ���� m      ��  �  �  � ���
� 
Dire� |������  �  � o      �� &0 roundingdirection roundingDirection�  � l     ���� m      �
� MRndRNhE�  �  �  � k    C�� ��� l     ����  � � � TO DO: implement `rounding halves toward zero` and `rounding away from zero` for complete consistency with NSNumberFormatterRoundingMode (which is used by `format number`)   � ���X   T O   D O :   i m p l e m e n t   ` r o u n d i n g   h a l v e s   t o w a r d   z e r o `   a n d   ` r o u n d i n g   a w a y   f r o m   z e r o `   f o r   c o m p l e t e   c o n s i s t e n c y   w i t h   N S N u m b e r F o r m a t t e r R o u n d i n g M o d e   ( w h i c h   i s   u s e d   b y   ` f o r m a t   n u m b e r ` )� ��� Q    C���� k   -�� ��� r    ��� n   ��� I    ���� "0 asrealparameter asRealParameter� ��� o    	�� 0 num  � ��� m   	 
�� ���  �  �  � o    �
�
 0 _supportlib _supportLib� o      �	�	 0 num  � ��� r    ��� n   ��� I    ���� (0 asintegerparameter asIntegerParameter� ��� o    �� 0 decimalplaces decimalPlaces� ��� m    �� ���  t o   p l a c e s�  �  � o    �� 0 _supportlib _supportLib� o      �� 0 decimalplaces decimalPlaces� ��� Z    8����� >    "��� o     � �  0 decimalplaces decimalPlaces� m     !����  � k   % 4�� ��� r   % *��� a   % (��� m   % &���� 
� o   & '���� 0 decimalplaces decimalPlaces� o      ���� 0 themultiplier theMultiplier� ���� l  + 4���� r   + 4��� ^   + 2��� ]   + 0��� ]   + .��� o   + ,���� 0 num  � m   , -���� 
� o   . /���� 0 themultiplier theMultiplier� m   0 1���� 
� o      ���� 0 num  ��� multiplying and dividing by 10 before and after applying the multiplier helps avoid poor rounding results for some numbers due to inevitable loss of precision in floating-point math (e.g. `324.21 * 100 div 1 / 100` returns 324.2 but needs to be 324.21), though this hasn't been tested on all possible values for obvious reasons -- TO DO: shouldn't /10 be done after rounding is applied (in which case following calculations should use mod 10, etc)?   � ����   m u l t i p l y i n g   a n d   d i v i d i n g   b y   1 0   b e f o r e   a n d   a f t e r   a p p l y i n g   t h e   m u l t i p l i e r   h e l p s   a v o i d   p o o r   r o u n d i n g   r e s u l t s   f o r   s o m e   n u m b e r s   d u e   t o   i n e v i t a b l e   l o s s   o f   p r e c i s i o n   i n   f l o a t i n g - p o i n t   m a t h   ( e . g .   ` 3 2 4 . 2 1   *   1 0 0   d i v   1   /   1 0 0 `   r e t u r n s   3 2 4 . 2   b u t   n e e d s   t o   b e   3 2 4 . 2 1 ) ,   t h o u g h   t h i s   h a s n ' t   b e e n   t e s t e d   o n   a l l   p o s s i b l e   v a l u e s   f o r   o b v i o u s   r e a s o n s   - -   T O   D O :   s h o u l d n ' t   / 1 0   b e   d o n e   a f t e r   r o u n d i n g   i s   a p p l i e d   ( i n   w h i c h   c a s e   f o l l o w i n g   c a l c u l a t i o n s   s h o u l d   u s e   m o d   1 0 ,   e t c ) ?��  �  �  � ��� l  9 9������  � � � TO DO: check the following real comparisons work reliably and won't fall afoul of floating point imprecisions (might be an idea to use `cmp` or similar to allow for that; eliminating current magic math would also make this code easier to verify)   � ����   T O   D O :   c h e c k   t h e   f o l l o w i n g   r e a l   c o m p a r i s o n s   w o r k   r e l i a b l y   a n d   w o n ' t   f a l l   a f o u l   o f   f l o a t i n g   p o i n t   i m p r e c i s i o n s   ( m i g h t   b e   a n   i d e a   t o   u s e   ` c m p `   o r   s i m i l a r   t o   a l l o w   f o r   t h a t ;   e l i m i n a t i n g   c u r r e n t   m a g i c   m a t h   w o u l d   a l s o   m a k e   t h i s   c o d e   e a s i e r   t o   v e r i f y )� ��� Z   9   =  9 < o   9 :���� &0 roundingdirection roundingDirection l  : ;���� m   : ;��
�� MRndRNhE��  ��   Z   ? m	
 E  ? K J   ? C  m   ? @ ��       �� m   @ A ?�      ��   J   C J �� `   C H l  C F���� ^   C F o   C D���� 0 num   m   D E���� ��  ��   m   F G���� ��   l  N S r   N S _   N Q  o   N O���� 0 num    m   O P����  o      ���� 0 num   T N if num ends in .5 and its div is even then round toward zero so it stays even    �!! �   i f   n u m   e n d s   i n   . 5   a n d   i t s   d i v   i s   e v e n   t h e n   r o u n d   t o w a r d   z e r o   s o   i t   s t a y s   e v e n	 "#" ?   V Y$%$ o   V W���� 0 num  % m   W X����  # &��& l  \ c'()' r   \ c*+* _   \ a,-, l  \ _.����. [   \ _/0/ o   \ ]���� 0 num  0 m   ] ^11 ?�      ��  ��  - m   _ `���� + o      ���� 0 num  ( H B else round to nearest whole digit (.5 will round up if positive�)   ) �22 �   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t   ( . 5   w i l l   r o u n d   u p   i f   p o s i t i v e & )��  
 l  f m3453 r   f m676 _   f k898 l  f i:����: \   f i;<; o   f g���� 0 num  < m   g h== ?�      ��  ��  9 m   i j���� 7 o      ���� 0 num  4 4 . (�or down if negative to give an even result)   5 �>> \   ( & o r   d o w n   i f   n e g a t i v e   t o   g i v e   a n   e v e n   r e s u l t ) ?@? =  p sABA o   p q���� &0 roundingdirection roundingDirectionB l  q rC����C m   q r��
�� MRndRNhT��  ��  @ DED Z   v �FGHIF E  v �JKJ J   v zLL MNM m   v wOO ��      N P��P m   w xQQ ?�      ��  K J   z RR S��S `   z }TUT o   z {���� 0 num  U m   { |���� ��  G l  � �VWXV r   � �YZY _   � �[\[ o   � ����� 0 num  \ m   � ����� Z o      ���� 0 num  W 0 * if num ends in .5 then round towards zero   X �]] T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r oH ^_^ ?   � �`a` o   � ����� 0 num  a m   � �����  _ b��b l  � �cdec r   � �fgf _   � �hih l  � �j����j [   � �klk o   � ����� 0 num  l m   � �mm ?�      ��  ��  i m   � ����� g o      ���� 0 num  d ( " else round to nearest whole digit   e �nn D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t��  I r   � �opo _   � �qrq l  � �s����s \   � �tut o   � ����� 0 num  u m   � �vv ?�      ��  ��  r m   � ����� p o      ���� 0 num  E wxw =  � �yzy o   � ����� &0 roundingdirection roundingDirectionz l  � �{����{ m   � ���
�� MRndRN_T��  ��  x |}| r   � �~~ _   � ���� o   � ����� 0 num  � m   � �����  o      ���� 0 num  } ��� =  � ���� o   � ����� &0 roundingdirection roundingDirection� l  � ������� m   � ���
�� MRndRN_U��  ��  � ��� Z   � ������� G   � ���� A   � ���� o   � ����� 0 num  � m   � �����  � =   � ���� `   � ���� o   � ����� 0 num  � m   � ����� � m   � �����  � r   � ���� _   � ���� o   � ����� 0 num  � m   � ����� � o      ���� 0 num  ��  � r   � ���� _   � ���� l  � ������� [   � ���� o   � ����� 0 num  � m   � ����� ��  ��  � m   � ����� � o      ���� 0 num  � ��� =  � ���� o   � ����� &0 roundingdirection roundingDirection� l  � ������� m   � ���
�� MRndRN_D��  ��  � ���� Z   � ������ G   � ���� ?   � ���� o   � ����� 0 num  � m   � �����  � =   � ���� `   � ���� o   � ����� 0 num  � m   � ����� � m   � �����  � r   � ���� _   � ���� o   � ����� 0 num  � m   � ����� � o      ���� 0 num  ��  � r   � ��� _   � ���� l  � ������� \   � ���� o   � ����� 0 num  � m   � ����� ��  ��  � m   � ����� � o      ���� 0 num  ��   n ��� I  ������� >0 throwinvalidparameterconstant throwInvalidParameterConstant� ��� o  	���� &0 roundingdirection roundingDirection� ���� m  	
�� ���  b y��  ��  � o  ���� 0 _supportlib _supportLib� ���� Z  -����� =  ��� o  ���� 0 decimalplaces decimalPlaces� m  ����  � L  �� _  ��� o  ���� 0 num  � m  ���� � ��� A  ��� o  ���� 0 decimalplaces decimalPlaces� m  ����  � ���� L  "&�� _  "%��� o  "#���� 0 num  � o  #$���� 0 themultiplier theMultiplier��  � L  )-�� ^  ),��� o  )*���� 0 num  � o  *+���� 0 themultiplier theMultiplier��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      �� 0 enumber eNumber� �~��
�~ 
erob� o      �}�} 0 efrom eFrom� �|��{
�| 
errt� o      �z�z 
0 eto eTo�{  � I  5C�y��x�y 
0 _error  � ��� m  69�� ���  r o u n d   n u m b e r� ��� o  9:�w�w 0 etext eText� ��� o  :;�v�v 0 enumber eNumber� ��� o  ;<�u�u 0 efrom eFrom� ��t� o  <=�s�s 
0 eto eTo�t  �x  �  � ��� l     �r�q�p�r  �q  �p  � ��� l     �o�n�m�o  �n  �m  � ��� l     �l���l  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �k���k  �   Trigonometry   � ���    T r i g o n o m e t r y� ��� l     �j�i�h�j  �i  �h  � ��� i  � ���� I      �g��f�g 0 _sin  �  �e  o      �d�d 0 x  �e  �f  � k      Z     +�c�b =     `     	 o     �a�a 0 x  	 m    �`�`  m    �_�_   l   '

 k    '  Z   �^�] A     o    	�\�\ 0 x   m   	 
�[�[   r     d     o    �Z�Z 0 x   o      �Y�Y 0 x  �^  �]   �X L    ' n   & 4    %�W
�W 
cobj l   $�V�U [    $ _    "  `     !"! o    �T�T 0 x  " m    �S�Sh  m     !�R�R  m   " #�Q�Q �V  �U   o    �P�P 0 _precalcsine _precalcSine�X   1 + performance optimisation for common values    �## V   p e r f o r m a n c e   o p t i m i s a t i o n   f o r   c o m m o n   v a l u e s�c  �b   $%$ l  , 5&'(& r   , 5)*) ^   , 3+,+ ]   , 1-.- `   , //0/ o   , -�O�O 0 x  0 m   - .�N�Nh. 1   / 0�M
�M 
pi  , m   1 2�L�L �* o      �K�K 0 x  ' &   convert from degrees to radians   ( �11 @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n s% 232 r   6 ;454 A   6 9676 o   6 7�J�J 0 x  7 m   7 8�I�I  5 o      �H�H 0 isneg isNeg3 898 Z  < H:;�G�F: o   < =�E�E 0 isneg isNeg; r   @ D<=< d   @ B>> o   @ A�D�D 0 x  = o      �C�C 0 x  �G  �F  9 ?@? r   I RABA _   I PCDC l  I NE�B�AE ]   I NFGF o   I J�@�@ 0 x  G l  J MH�?�>H ^   J MIJI m   J K�=�= J 1   K L�<
�< 
pi  �?  �>  �B  �A  D m   N O�;�; B o      �:�: 0 y  @ KLK r   S ^MNM \   S \OPO o   S T�9�9 0 y  P ]   T [QRQ l  T YS�8�7S _   T YTUT ]   T WVWV o   T U�6�6 0 y  W m   U VXX ?�      U m   W X�5�5 �8  �7  R m   Y Z�4�4 N o      �3�3 0 z  L YZY Z   _ v[\�2�1[ =  _ d]^] `   _ b_`_ o   _ `�0�0 0 z  ` m   ` a�/�/ ^ m   b c�.�. \ k   g raa bcb r   g lded [   g jfgf o   g h�-�- 0 z  g m   h i�,�, e o      �+�+ 0 z  c h�*h r   m riji [   m pklk o   m n�)�) 0 y  l m   n o�(�( j o      �'�' 0 y  �*  �2  �1  Z mnm r   w |opo `   w zqrq o   w x�&�& 0 z  r m   x y�%�% p o      �$�$ 0 z  n sts Z   } �uv�#�"u ?   } �wxw o   } ~�!�! 0 z  x m   ~ � �  v k   � �yy z{z r   � �|}| H   � �~~ o   � ��� 0 isneg isNeg} o      �� 0 isneg isNeg{ � r   � ���� \   � ���� o   � ��� 0 z  � m   � ��� � o      �� 0 z  �  �#  �"  t ��� r   � ���� \   � ���� l  � ����� \   � ���� l  � ����� \   � ���� o   � ��� 0 x  � ]   � ���� o   � ��� 0 y  � m   � ��� ?�!�?��v�  �  � ]   � ���� o   � ��� 0 y  � m   � ��� >dD,���J�  �  � ]   � ���� o   � ��� 0 y  � m   � ��� <�F���P�� o      �� 0 z2  � ��� r   � ���� ]   � ���� o   � ��� 0 z2  � o   � ��� 0 z2  � o      �� 0 zz  � ��� Z   ������ G   � ���� =  � ���� o   � ��� 0 z  � m   � ��� � =  � ���� o   � ��
�
 0 z  � m   � ��	�	 � r   � ���� [   � ���� \   � ���� m   � ��� ?�      � ^   � ���� o   � ��� 0 zz  � m   � ��� � ]   � ���� ]   � ���� o   � ��� 0 zz  � o   � ��� 0 zz  � l  � ����� [   � ���� ]   � ���� l  � ����� \   � ���� ]   � ���� l  � ��� ��� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� m   � ��� ���I���� o   � ����� 0 zz  � m   � ��� >!�{N>���  ��  � o   � ����� 0 zz  � m   � ��� >�~O~�K���  ��  � o   � ����� 0 zz  � m   � ��� >���D��   ��  � o   � ����� 0 zz  � m   � ��� ?V�l�=��  �  � o   � ����� 0 zz  � m   � ��� ?�UUUV��  �  � o      ���� 0 y  �  � r   ���� [   �	��� o   � ����� 0 z2  � ]   ���� ]   � ���� o   � ����� 0 z2  � o   � ����� 0 zz  � l  ������� \   ���� ]   ���� l  ������� [   ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� m   � ��� =���ќ�� o   � ����� 0 zz  � m   � ��� >Z��)[��  ��  � o   � ����� 0 zz  � m   � ��� >��V}H���  ��  � o   � ����� 0 zz  � m   � ��� ?*������  ��  � o   � ����� 0 zz  � m   � �� ?�"w��  ��  � o  ���� 0 zz  � m  �� ?�UUUU�?��  ��  � o      ���� 0 y  � ��� Z � ����� o  ���� 0 isneg isNeg  r   d   o  ���� 0 y   o      ���� 0 y  ��  ��  � �� L   o  ���� 0 y  ��  �  l     ��������  ��  ��   	 l     ��������  ��  ��  	 

 l     ��������  ��  ��    i  � � I     ����
�� .Mth:Sin_null���     doub o      ���� 0 n  ��   Q      L     I    ������ 0 _sin   �� c     o    ���� 0 x   m    ��
�� 
nmbr��  ��   R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   I    �� ���� 
0 _error    !"! m    ## �$$  s i n" %&% o    ���� 0 etext eText& '(' o    ���� 0 enumber eNumber( )*) o    ���� 0 efrom eFrom* +��+ o    ���� 
0 eto eTo��  ��   ,-, l     ��������  ��  ��  - ./. l     ��������  ��  ��  / 010 i  � �232 I     ��4��
�� .Mth:Cos_null���     doub4 o      ���� 0 n  ��  3 Q      5675 L    88 I    ��9���� 0 _sin  9 :��: [    	;<; l   =����= c    >?> o    ���� 0 n  ? m    ��
�� 
nmbr��  ��  < m    ���� Z��  ��  6 R      ��@A
�� .ascrerr ****      � ****@ o      ���� 0 etext eTextA ��BC
�� 
errnB o      ���� 0 enumber eNumberC ��DE
�� 
erobD o      ���� 0 efrom eFromE ��F��
�� 
errtF o      ���� 
0 eto eTo��  7 I     ��G���� 
0 _error  G HIH m    JJ �KK  c o sI LML o    ���� 0 etext eTextM NON o    ���� 0 enumber eNumberO PQP o    ���� 0 efrom eFromQ R��R o    ���� 
0 eto eTo��  ��  1 STS l     ��������  ��  ��  T UVU l     ��������  ��  ��  V WXW i  � �YZY I     ��[��
�� .Mth:Tan_null���     doub[ o      ���� 0 n  ��  Z Q    4\]^\ k   __ `a` r    bcb c    ded o    ���� 0 n  e m    ��
�� 
nmbrc o      ���� 0 x  a fgf Z   	 Ohi����h =  	 jkj `   	 lml o   	 
���� 0 x  m m   
 ���� k m    ����  i l   Knopn k    Kqq rsr Z   tu����t A    vwv o    ���� 0 x  w m    ����  u r    xyx d    zz o    ���� 0 x  y o      ���� 0 x  ��  ��  s {|{ Z    :}~����} G     +� =    #��� o     !�� 0 x  � m   ! "�~�~ Z� =  & )��� o   & '�}�} 0 x  � m   ' (�|�|~ R   . 6�{��
�{ .ascrerr ****      � ****� m   4 5�� ��� F I n v a l i d   n u m b e r   ( r e s u l t   w o u l d   b e  " ) .� �z��
�z 
errn� m   0 1�y�y�Y� �x��w
�x 
erob� o   2 3�v�v 0 x  �w  ��  ��  | ��u� L   ; K�� n  ; J��� 4   @ I�t�
�t 
cobj� l  A H��s�r� [   A H��� _   A F��� `   A D��� o   A B�q�q 0 x  � m   B C�p�ph� m   D E�o�o � m   F G�n�n �s  �r  � o   ; @�m�m "0 _precalctangent _precalcTangent�u  o 1 + performance optimisation for common values   p ��� V   p e r f o r m a n c e   o p t i m i s a t i o n   f o r   c o m m o n   v a l u e s��  ��  g ��� l  P Y���� r   P Y��� ^   P W��� ]   P U��� `   P S��� o   P Q�l�l 0 x  � m   Q R�k�kh� 1   S T�j
�j 
pi  � m   U V�i�i �� o      �h�h 0 x  � &   convert from degrees to radians   � ��� @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n s� ��� r   Z _��� A   Z ]��� o   Z [�g�g 0 x  � m   [ \�f�f  � o      �e�e 0 isneg isNeg� ��� Z  ` l���d�c� o   ` a�b�b 0 isneg isNeg� r   d h��� d   d f�� o   d e�a�a 0 x  � o      �`�` 0 x  �d  �c  � ��� r   m v��� _   m t��� l  m r��_�^� ^   m r��� o   m n�]�] 0 x  � l  n q��\�[� ^   n q��� 1   n o�Z
�Z 
pi  � m   o p�Y�Y �\  �[  �_  �^  � m   r s�X�X � o      �W�W 0 y  � ��� r   w ���� \   w ���� o   w x�V�V 0 y  � ]   x ��� l  x }��U�T� _   x }��� ]   x {��� o   x y�S�S 0 y  � m   y z�� ?�      � m   { |�R�R �U  �T  � m   } ~�Q�Q � o      �P�P 0 z  � ��� Z   � ����O�N� =  � ���� `   � ���� o   � ��M�M 0 z  � m   � ��L�L � m   � ��K�K � k   � ��� ��� r   � ���� [   � ���� o   � ��J�J 0 z  � m   � ��I�I � o      �H�H 0 z  � ��G� r   � ���� [   � ���� o   � ��F�F 0 y  � m   � ��E�E � o      �D�D 0 y  �G  �O  �N  � ��� r   � ���� \   � ���� l  � ���C�B� \   � ���� l  � ���A�@� \   � ���� o   � ��?�? 0 x  � ]   � ���� o   � ��>�> 0 y  � m   � ��� ?�!�P M�A  �@  � ]   � ���� o   � ��=�= 0 y  � m   � ��� >A�`  �C  �B  � ]   � ���� o   � ��<�< 0 y  � m   � ��� <��&3\� o      �;�; 0 z2  � ��� r   � ���� ]   � ���� o   � ��:�: 0 z2  � o   � ��9�9 0 z2  � o      �8�8 0 zz  � ��� Z   � �� �7� ?   � � o   � ��6�6 0 zz   m   � � =����+�  r   � � [   � � o   � ��5�5 0 z2   ^   � �	
	 ]   � � ]   � � o   � ��4�4 0 z2   o   � ��3�3 0 zz   l  � ��2�1 \   � � ]   � � l  � ��0�/ [   � � ]   � � m   � � �ɒ��O?D o   � ��.�. 0 zz   m   � � A1������0  �/   o   � ��-�- 0 zz   m   � � Aq��)�y�2  �1  
 l  � ��,�+ \   � � ]   � �  l  � �!�*�)! [   � �"#" ]   � �$%$ l  � �&�(�'& \   � �'(' ]   � �)*) l  � �+�&�%+ [   � �,-, o   � ��$�$ 0 zz  - m   � �.. @ʸ��et�&  �%  * o   � ��#�# 0 zz  ( m   � �// A4'�X*���(  �'  % o   � ��"�" 0 zz  # m   � �00 Awُ�����*  �)    o   � ��!�! 0 zz   m   � �11 A���<�Z6�,  �+   o      � �  0 y  �7   r   � �232 o   � ��� 0 z2  3 o      �� 0 y  � 454 Z  �67��6 G   �898 =  � �:;: o   � ��� 0 z  ; m   � ��� 9 =  � <=< o   � ��� 0 z  = m   � ��� 7 r  
>?> ^  @A@ m  ����A o  �� 0 y  ? o      �� 0 y  �  �  5 BCB Z DE��D o  �� 0 isneg isNegE r  FGF d  HH o  �� 0 y  G o      �� 0 y  �  �  C I�I L  JJ o  �� 0 y  �  ] R      �KL
� .ascrerr ****      � ****K o      �� 0 etext eTextL �MN
� 
errnM o      �
�
 0 enumber eNumberN �	OP
�	 
erobO o      �� 0 efrom eFromP �Q�
� 
errtQ o      �� 
0 eto eTo�  ^ I  &4�R�� 
0 _error  R STS m  '*UU �VV  t a nT WXW o  *+�� 0 etext eTextX YZY o  +,�� 0 enumber eNumberZ [\[ o  ,-� �  0 efrom eFrom\ ]��] o  -.���� 
0 eto eTo��  �  X ^_^ l     ��������  ��  ��  _ `a` l     ��������  ��  ��  a bcb l     ��de��  d  -----   e �ff 
 - - - - -c ghg l     ��ij��  i   inverse   j �kk    i n v e r s eh lml l     ��������  ��  ��  m non i  � �pqp I      ��r���� 	0 _asin  r s��s o      ���� 0 n  ��  ��  q k     �tt uvu r     wxw A     yzy o     ���� 0 x  z m    ����  x o      ���� 0 isneg isNegv {|{ Z   }~����} o    ���� 0 isneg isNeg~ r   
 � d   
 �� o   
 ���� 0 x  � o      ���� 0 x  ��  ��  | ��� Z   %������� ?    ��� o    ���� 0 x  � m    ���� � R    !����
�� .ascrerr ****      � ****� m     �� ��� T I n v a l i d   n u m b e r   ( n o t   b e t w e e n   - 1 . 0   a n d   1 . 0 ) .� ����
�� 
errn� m    �����Y� �����
�� 
erob� o    ���� 0 x  ��  ��  ��  � ��� Z   & ������ ?   & )��� o   & '���� 0 x  � m   ' (�� ?�      � k   , �� ��� r   , 1��� \   , /��� m   , -���� � o   - .���� 0 x  � o      ���� 0 zz  � ��� r   2 W��� ^   2 U��� ]   2 E��� o   2 3���� 0 zz  � l  3 D������ [   3 D��� ]   3 B��� l  3 @������ \   3 @��� ]   3 >��� l  3 <������ [   3 <��� ]   3 :��� l  3 8������ \   3 8��� ]   3 6��� m   3 4�� ?hOØ��� o   4 5���� 0 zz  � m   6 7�� ?��Y�,���  ��  � o   8 9���� 0 zz  � m   : ;�� @����?���  ��  � o   < =���� 0 zz  � m   > ?�� @9����"��  ��  � o   @ A���� 0 zz  � m   B C�� @<�b@����  ��  � l  E T������ [   E T��� ]   E R��� l  E P������ \   E P��� ]   E N��� l  E L������ [   E L��� ]   E J��� l  E H������ \   E H��� o   E F���� 0 zz  � m   F G�� @5򢶿]R��  ��  � o   H I���� 0 zz  � m   J K�� @bb�j1��  ��  � o   L M���� 0 zz  � m   N O�� @w���c���  ��  � o   P Q���� 0 zz  � m   R S�� @ug	��D���  ��  � o      ���� 0 p  � ��� r   X _��� a   X ]��� l  X [������ [   X [��� o   X Y���� 0 zz  � o   Y Z���� 0 zz  ��  ��  � m   [ \�� ?�      � o      ���� 0 zz  � ��� r   ` i��� \   ` g��� l  ` e������ ^   ` e��� 1   ` c��
�� 
pi  � m   c d���� ��  ��  � o   e f���� 0 zz  � o      ���� 0 z  � ��� r   j s��� \   j q��� ]   j m��� o   j k���� 0 zz  � o   k l���� 0 p  � m   m p�� <��&3\
� o      ���� 0 zz  � ���� r   t ��� [   t }��� \   t w��� o   t u���� 0 z  � o   u v���� 0 zz  � l  w |������ ^   w |��� 1   w z��
�� 
pi  � m   z {���� ��  ��  � o      ���� 0 z  ��  � ��� A   � ���� o   � ����� 0 x  � m   � �	 	  >Ey��0�:� 	��	 r   � �			 o   � ����� 0 x  	 o      ���� 0 z  ��  � k   � �		 			 r   � �			 ]   � �			
		 o   � ����� 0 x  	
 o   � ����� 0 x  	 o      ���� 0 zz  	 	��	 r   � �			 [   � �			 ]   � �			 ^   � �			 ]   � �			 o   � ����� 0 zz  	 l  � �	����	 \   � �			 ]   � �			 l  � �	����	 [   � �			 ]   � �			 l  � �	 ����	  \   � �	!	"	! ]   � �	#	$	# l  � �	%����	% [   � �	&	'	& ]   � �	(	)	( l  � �	*����	* \   � �	+	,	+ ]   � �	-	.	- m   � �	/	/ ?qk��v�	. o   � ����� 0 zz  	, m   � �	0	0 ?�CA3>M���  ��  	) o   � ����� 0 zz  	' m   � �	1	1 @�K�/��  ��  	$ o   � ����� 0 zz  	" m   � �	2	2 @0C1�'����  ��  	 o   � ����� 0 zz  	 m   � �	3	3 @3��w����  ��  	 o   � ����� 0 zz  	 m   � �	4	4 @ elΰ8��  ��  	 l  � �	5����	5 \   � �	6	7	6 ]   � �	8	9	8 l  � �	:����	: [   � �	;	<	; ]   � �	=	>	= l  � �	?����	? \   � �	@	A	@ ]   � �	B	C	B l  � �	D����	D [   � �	E	F	E ]   � �	G	H	G l  � �	I����	I \   � �	J	K	J o   � ����� 0 zz  	K m   � �	L	L @-{Y^���  ��  	H o   � ����� 0 zz  	F m   � �	M	M @Q��%��6��  ��  	C o   � ����� 0 zz  	A m   � �	N	N @be�m5v���  ��  	> o   � ����� 0 zz  	< m   � �	O	O @apV������  ��  	9 o   � ����� 0 zz  	7 m   � �	P	P @H�"
6���  ��  	 o   � ����� 0 x  	 o   � ����� 0 x  	 o      �� 0 z  ��  � 	Q	R	Q Z  � �	S	T�~�}	S o   � ��|�| 0 isneg isNeg	T r   � �	U	V	U d   � �	W	W o   � ��{�{ 0 z  	V o      �z�z 0 z  �~  �}  	R 	X�y	X L   � �	Y	Y ^   � �	Z	[	Z o   � ��x�x 0 z  	[ l  � �	\�w�v	\ ^   � �	]	^	] 1   � ��u
�u 
pi  	^ m   � ��t�t ��w  �v  �y  o 	_	`	_ l     �s�r�q�s  �r  �q  	` 	a	b	a l     �p�o�n�p  �o  �n  	b 	c	d	c l     �m�l�k�m  �l  �k  	d 	e	f	e i  � �	g	h	g I     �j	i�i
�j .Mth:Sinanull���     doub	i o      �h�h 0 n  �i  	h Q     	j	k	l	j L    	m	m I    �g	n�f�g 	0 _asin  	n 	o�e	o c    	p	q	p o    �d�d 0 n  	q m    �c
�c 
nmbr�e  �f  	k R      �b	r	s
�b .ascrerr ****      � ****	r o      �a�a 0 etext eText	s �`	t	u
�` 
errn	t o      �_�_ 0 enumber eNumber	u �^	v	w
�^ 
erob	v o      �]�] 0 efrom eFrom	w �\	x�[
�\ 
errt	x o      �Z�Z 
0 eto eTo�[  	l I    �Y	y�X�Y 
0 _error  	y 	z	{	z m    	|	| �	}	}  a s i n	{ 	~		~ o    �W�W 0 etext eText	 	�	�	� o    �V�V 0 enumber eNumber	� 	�	�	� o    �U�U 0 efrom eFrom	� 	��T	� o    �S�S 
0 eto eTo�T  �X  	f 	�	�	� l     �R�Q�P�R  �Q  �P  	� 	�	�	� l     �O�N�M�O  �N  �M  	� 	�	�	� i  � �	�	�	� I     �L	��K
�L .Mth:Cosanull���     doub	� o      �J�J 0 n  �K  	� Q      	�	�	�	� L    	�	� \    	�	�	� m    �I�I Z	� l   	��H�G	� I    �F	��E�F 	0 _asin  	� 	��D	� c    	�	�	� o    �C�C 0 n  	� m    �B
�B 
nmbr�D  �E  �H  �G  	� R      �A	�	�
�A .ascrerr ****      � ****	� o      �@�@ 0 etext eText	� �?	�	�
�? 
errn	� o      �>�> 0 enumber eNumber	� �=	�	�
�= 
erob	� o      �<�< 0 efrom eFrom	� �;	��:
�; 
errt	� o      �9�9 
0 eto eTo�:  	� I     �8	��7�8 
0 _error  	� 	�	�	� m    	�	� �	�	�  a c o s	� 	�	�	� o    �6�6 0 etext eText	� 	�	�	� o    �5�5 0 enumber eNumber	� 	�	�	� o    �4�4 0 efrom eFrom	� 	��3	� o    �2�2 
0 eto eTo�3  �7  	� 	�	�	� l     �1�0�/�1  �0  �/  	� 	�	�	� l     �.�-�,�.  �-  �,  	� 	�	�	� i  � �	�	�	� I     �+	��*
�+ .Mth:Tananull���     doub	� o      �)�) 0 n  �*  	� Q     *	�	�	�	� k    	�	� 	�	�	� r    	�	�	� c    	�	�	� o    �(�( 0 n  	� m    �'
�' 
nmbr	� o      �&�& 0 x  	� 	��%	� L   	 	�	� I   	 �$	��#�$ 	0 _asin  	� 	��"	� ^   
 	�	�	� o   
 �!�! 0 x  	� l   	�� �	� a    	�	�	� l   	���	� [    	�	�	� ]    	�	�	� o    �� 0 x  	� o    �� 0 x  	� m    �� �  �  	� m    	�	� ?�      �   �  �"  �#  �%  	� R      �	�	�
� .ascrerr ****      � ****	� o      �� 0 etext eText	� �	�	�
� 
errn	� o      �� 0 enumber eNumber	� �	�	�
� 
erob	� o      �� 0 efrom eFrom	� �	��
� 
errt	� o      �� 
0 eto eTo�  	� I     *�	��� 
0 _error  	� 	�	�	� m   ! "	�	� �	�	�  a t a n	� 	�	�	� o   " #�� 0 etext eText	� 	�	�	� o   # $�� 0 enumber eNumber	� 	�	�	� o   $ %�� 0 efrom eFrom	� 	��	� o   % &�
�
 
0 eto eTo�  �  	� 	�	�	� l     �	���	  �  �  	� 	�	�	� l     ����  �  �  	� 	�	�	� l     �	�	��  	�  -----   	� �	�	� 
 - - - - -	� 	�	�	� l     �	�	��  	�   hyperbolic   	� �	�	�    h y p e r b o l i c	� 	�	�	� l     �� ���  �   ��  	� 	�	�	� i  	�	�	� I     ��	���
�� .Mth:Sinhnull���     doub	� o      ���� 0 n  ��  	� Q     .	�	�	�	� k    	�	� 	�	�	� r    	�	�	� c    	�	�	� o    ���� 0 n  	� m    ��
�� 
nmbr	� o      ���� 0 x  	� 
 ��
  L   	 

 ]   	 


 m   	 


 ?�      
 l  
 
����
 \   
 


 a   
 

	
 o   
 ���� 	0 __e__  
	 o    ���� 0 x  
 a    




 o    ���� 	0 __e__  
 d    

 o    ���� 0 x  ��  ��  ��  	� R      ��


�� .ascrerr ****      � ****
 o      ���� 0 etext eText
 ��


�� 
errn
 o      ���� 0 enumber eNumber
 ��


�� 
erob
 o      ���� 0 efrom eFrom
 ��
��
�� 
errt
 o      ���� 
0 eto eTo��  	� I   $ .��
���� 
0 _error  
 


 m   % &

 �

 
 a s i n h
 


 o   & '���� 0 etext eText
 


 o   ' (���� 0 enumber eNumber
 


 o   ( )���� 0 efrom eFrom
 
��
 o   ) *���� 
0 eto eTo��  ��  	� 
 
!
  l     ��������  ��  ��  
! 
"
#
" l     ��������  ��  ��  
# 
$
%
$ i 
&
'
& I     ��
(��
�� .Mth:Coshnull���     doub
( o      ���� 0 n  ��  
' Q     .
)
*
+
) k    
,
, 
-
.
- r    
/
0
/ c    
1
2
1 o    ���� 0 n  
2 m    ��
�� 
nmbr
0 o      ���� 0 x  
. 
3��
3 L   	 
4
4 ]   	 
5
6
5 m   	 

7
7 ?�      
6 l  
 
8����
8 [   
 
9
:
9 a   
 
;
<
; o   
 ���� 	0 __e__  
< o    ���� 0 x  
: a    
=
>
= o    ���� 	0 __e__  
> d    
?
? o    ���� 0 x  ��  ��  ��  
* R      ��
@
A
�� .ascrerr ****      � ****
@ o      ���� 0 etext eText
A ��
B
C
�� 
errn
B o      ���� 0 enumber eNumber
C ��
D
E
�� 
erob
D o      ���� 0 efrom eFrom
E ��
F��
�� 
errt
F o      ���� 
0 eto eTo��  
+ I   $ .��
G���� 
0 _error  
G 
H
I
H m   % &
J
J �
K
K 
 a c o s h
I 
L
M
L o   & '���� 0 etext eText
M 
N
O
N o   ' (���� 0 enumber eNumber
O 
P
Q
P o   ( )���� 0 efrom eFrom
Q 
R��
R o   ) *���� 
0 eto eTo��  ��  
% 
S
T
S l     ��������  ��  ��  
T 
U
V
U l     ��������  ��  ��  
V 
W
X
W i 
Y
Z
Y I     ��
[��
�� .Mth:Tanhnull���     doub
[ o      ���� 0 n  ��  
Z Q     =
\
]
^
\ k    +
_
_ 
`
a
` r    
b
c
b c    
d
e
d o    ���� 0 n  
e m    ��
�� 
nmbr
c o      ���� 0 x  
a 
f��
f L   	 +
g
g ^   	 *
h
i
h l  	 
j����
j \   	 
k
l
k a   	 
m
n
m o   	 ���� 	0 __e__  
n o    ���� 0 x  
l a    
o
p
o o    ���� 	0 __e__  
p d    
q
q o    ���� 0 x  ��  ��  
i l   )
r����
r [    )
s
t
s a     
u
v
u o    ���� 	0 __e__  
v o    ���� 0 x  
t a     (
w
x
w o     %���� 	0 __e__  
x d   % '
y
y o   % &���� 0 x  ��  ��  ��  
] R      ��
z
{
�� .ascrerr ****      � ****
z o      ���� 0 etext eText
{ ��
|
}
�� 
errn
| o      ���� 0 enumber eNumber
} ��
~

�� 
erob
~ o      ���� 0 efrom eFrom
 ��
���
�� 
errt
� o      ���� 
0 eto eTo��  
^ I   3 =��
����� 
0 _error  
� 
�
�
� m   4 5
�
� �
�
� 
 a t a n h
� 
�
�
� o   5 6���� 0 etext eText
� 
�
�
� o   6 7���� 0 enumber eNumber
� 
�
�
� o   7 8���� 0 efrom eFrom
� 
���
� o   8 9���� 
0 eto eTo��  ��  
X 
�
�
� l     ��������  ��  ��  
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� l     ��
�
���  
� J D--------------------------------------------------------------------   
� �
�
� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
� 
�
�
� l     ��
�
���  
�   Logarithms   
� �
�
�    L o g a r i t h m s
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� i 
�
�
� I      ��
����� 
0 _frexp  
� 
���
� o      ���� 0 m  ��  ��  
� k     n
�
� 
�
�
� Z    
�
�����
� =    
�
�
� o     ���� 0 m  
� m    ����  
� L    
�
� J    

�
� 
�
�
� m    
�
�         
� 
���
� m    ����  ��  ��  ��  
� 
�
�
� r    
�
�
� A    
�
�
� o    ���� 0 m  
� m    ��  
� o      �~�~ 0 isneg isNeg
� 
�
�
� Z   "
�
��}�|
� o    �{�{ 0 isneg isNeg
� r    
�
�
� d    
�
� o    �z�z 0 m  
� o      �y�y 0 m  �}  �|  
� 
�
�
� r   # &
�
�
� m   # $�x�x  
� o      �w�w 0 e  
� 
�
�
� W   ' [
�
�
� Z   7 V
�
��v
�
� @   7 :
�
�
� o   7 8�u�u 0 m  
� m   8 9�t�t 
� k   = H
�
� 
�
�
� r   = B
�
�
� ^   = @
�
�
� o   = >�s�s 0 m  
� m   > ?�r�r 
� o      �q�q 0 m  
� 
��p
� r   C H
�
�
� [   C F
�
�
� o   C D�o�o 0 e  
� m   D E�n�n 
� o      �m�m 0 e  �p  �v  
� k   K V
�
� 
�
�
� r   K P
�
�
� ]   K N
�
�
� o   K L�l�l 0 m  
� m   L M�k�k 
� o      �j�j 0 m  
� 
��i
� r   Q V
�
�
� \   Q T
�
�
� o   Q R�h�h 0 e  
� m   R S�g�g 
� o      �f�f 0 e  �i  
� F   + 6
�
�
� @   + .
�
�
� o   + ,�e�e 0 m  
� m   , -
�
� ?�      
� A   1 4
�
�
� o   1 2�d�d 0 m  
� m   2 3�c�c 
� 
�
�
� Z  \ h
�
��b�a
� o   \ ]�`�` 0 isneg isNeg
� r   ` d
�
�
� d   ` b
�
� o   ` a�_�_ 0 m  
� o      �^�^ 0 m  �b  �a  
� 
��]
� L   i n
�
� J   i m
�
� 
�
�
� o   i j�\�\ 0 m  
� 
��[
� o   j k�Z�Z 0 e  �[  �]  
� 
�
�
� l     �Y�X�W�Y  �X  �W  
� 
�
�
� l     �V�U�T�V  �U  �T  
� 
�
�
� i 
�
�
� I      �S
��R�S 	0 _logn  
� 
��Q
� o      �P�P 0 x  �Q  �R  
� k    ;    Z    �O�N B      o     �M�M 0 x   m    �L�L   R    �K
�K .ascrerr ****      � **** m   
 		 �

 8 I n v a l i d   n u m b e r   ( m u s t   b e   > 0 ) . �J�I
�J 
errn m    	�H�H�Y�I  �O  �N    r    & I      �G�F�G 
0 _frexp   �E o    �D�D 0 x  �E  �F   J        o      �C�C 0 x   �B o      �A�A 0 e  �B    Z   '8�@ G   ' 2 A   ' * o   ' (�?�? 0 e   m   ( )�>�>�� ?   - 0  o   - .�=�= 0 e    m   . /�<�<  k   5 �!! "#" Z   5 ^$%�;&$ A   5 8'(' o   5 6�:�: 0 x  ( m   6 7)) ?栞fK�% l  ; N*+,* k   ; N-- ./. r   ; @010 \   ; >232 o   ; <�9�9 0 e  3 m   < =�8�8 1 o      �7�7 0 e  / 454 r   A F676 \   A D898 o   A B�6�6 0 x  9 m   B C:: ?�      7 o      �5�5 0 z  5 ;�4; r   G N<=< [   G L>?> ]   G J@A@ m   G HBB ?�      A o   H I�3�3 0 z  ? m   J KCC ?�      = o      �2�2 0 y  �4  +   (2 ^ 0.5) / 2   , �DD    ( 2   ^   0 . 5 )   /   2�;  & k   Q ^EE FGF r   Q VHIH \   Q TJKJ o   Q R�1�1 0 x  K m   R S�0�0 I o      �/�/ 0 z  G L�.L r   W ^MNM [   W \OPO ]   W ZQRQ m   W XSS ?�      R o   X Y�-�- 0 x  P m   Z [TT ?�      N o      �,�, 0 y  �.  # UVU r   _ dWXW ^   _ bYZY o   _ `�+�+ 0 z  Z o   ` a�*�* 0 y  X o      �)�) 0 x  V [\[ r   e j]^] ]   e h_`_ o   e f�(�( 0 x  ` o   f g�'�' 0 x  ^ o      �&�& 0 z  \ aba r   k �cdc ^   k �efe ]   k xghg ]   k niji o   k l�%�% 0 x  j o   l m�$�$ 0 z  h l  n wk�#�"k \   n wlml ]   n unon l  n sp�!� p [   n sqrq ]   n qsts m   n ouu ��D=�l�t o   o p�� 0 z  r m   q rvv @0b�s{��!  �   o o   s t�� 0 z  m m   u vww @P	"*?�#  �"  f l  x �x��x \   x �yzy ]   x �{|{ l  x }��} [   x ~~ ]   x }��� l  x {���� \   x {��� o   x y�� 0 z  � m   y z�� @A�C�l��  �  � o   { |�� 0 z   m   } ~�� @s��*�
�  �  | o    ��� 0 z  z m   � ��� @���?;�  �  d o      �� 0 z  b ��� r   � ���� o   � ��� 0 e  � o      �� 0 y  � ��� r   � ���� [   � ���� [   � ���� \   � ���� o   � ��� 0 z  � ]   � ���� o   � ��� 0 y  � m   � ��� ?+�\a�� o   � ��� 0 x  � ]   � ���� o   � ��� 0 e  � m   � ��� ?�0     � o      �� 0 z  �  �@   k   �8�� ��� Z   � ������ A   � ���� o   � ��
�
 0 x  � m   � ��� ?栞fK�� l  � ����� k   � ��� ��� r   � ���� \   � ���� o   � ��	�	 0 e  � m   � ��� � o      �� 0 e  � ��� r   � ���� \   � ���� ]   � ���� m   � ��� � o   � ��� 0 x  � m   � ��� � o      �� 0 x  �  �   (2 ^ 0.5) / 2   � ���    ( 2   ^   0 . 5 )   /   2�  � r   � ���� \   � ���� o   � ��� 0 x  � m   � �� �  � o      ���� 0 x  � ��� r   � ���� ]   � ���� o   � ����� 0 x  � o   � ����� 0 x  � o      ���� 0 z  � ��� r   ���� ^   ���� ]   � ���� ]   � ���� o   � ����� 0 x  � o   � ����� 0 z  � l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� m   � ��� ?���� o   � ����� 0 x  � m   � ��� ?���?Vd���  ��  � o   � ����� 0 x  � m   � ��� @Һ�i���  ��  � o   � ����� 0 x  � m   � ��� @,�r�>����  ��  � o   � ����� 0 x  � m   � ��� @1�֒K�R��  ��  � o   � ����� 0 x  � m   � ��� @�c}~ݝ��  ��  � l  ������� [   ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� o   � ����� 0 x  � m   � �   @&� �����  ��  � o   � ����� 0 x  � m   � � @F�,N���  ��  � o   � ����� 0 x  � m   � � @T�3�&����  ��  � o   � ����� 0 x  � m   � � @Q���^���  ��  � o   � ����� 0 x  � m   �  @7 
�&5��  ��  � o      ���� 0 y  �  Z  ���� >  	
	 o  ���� 0 e  
 m  ����   r   \   o  ���� 0 y   ]   o  ���� 0 e   m   ?+�\a� o      ���� 0 y  ��  ��    r   \   o  ���� 0 y   l ���� ^   o  ���� 0 z   m  ���� ��  ��   o      ���� 0 y    r  $ [  "  o   ���� 0 x    o   !���� 0 y   o      ���� 0 z   !��! Z %8"#����" >  %($%$ o  %&���� 0 e  % m  &'����  # r  +4&'& [  +2()( o  +,���� 0 z  ) ]  ,1*+* o  ,-���� 0 e  + m  -0,, ?�0     ' o      ���� 0 z  ��  ��  ��   -��- L  9;.. o  9:���� 0 z  ��  
� /0/ l     ��������  ��  ��  0 121 l     ��������  ��  ��  2 343 l     ��������  ��  ��  4 565 i 787 I     ��9��
�� .Mth:Lognnull���     doub9 o      ���� 0 n  ��  8 Q     :;<: L    == I    ��>���� 	0 _logn  > ?��? c    @A@ o    ���� 0 n  A m    ��
�� 
nmbr��  ��  ; R      ��BC
�� .ascrerr ****      � ****B o      ���� 0 etext eTextC ��DE
�� 
errnD o      ���� 0 enumber eNumberE ��FG
�� 
erobF o      ���� 0 efrom eFromG ��H��
�� 
errtH o      ���� 
0 eto eTo��  < I    ��I���� 
0 _error  I JKJ m    LL �MM  l o g nK NON o    ���� 0 etext eTextO PQP o    ���� 0 enumber eNumberQ RSR o    ���� 0 efrom eFromS T��T o    ���� 
0 eto eTo��  ��  6 UVU l     ��������  ��  ��  V WXW l     ��������  ��  ��  X YZY i [\[ I     ��]��
�� .Mth:Lo10null���     doub] o      ���� 0 n  ��  \ Q     $^_`^ l   abca L    dd ^    efe ]    ghg l   i����i ^    jkj I    ��l���� 	0 _logn  l m��m c    non o    ���� 0 n  o m    ��
�� 
nmbr��  ��  k m    pp @k���T���  ��  h m    qq @r�     f m    rr @r�    jb   correct for minor drift   c �ss 0   c o r r e c t   f o r   m i n o r   d r i f t_ R      ��tu
�� .ascrerr ****      � ****t o      ���� 0 etext eTextu ��vw
�� 
errnv o      ���� 0 enumber eNumberw ��xy
�� 
erobx o      ���� 0 efrom eFromy ��z��
�� 
errtz o      ���� 
0 eto eTo��  ` I    $��{���� 
0 _error  { |}| m    ~~ � 
 l o g 1 0} ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ���� o     ���� 
0 eto eTo��  ��  Z ��� l     ��~�}�  �~  �}  � ��� l     �|�{�z�|  �{  �z  � ��� i ��� I     �y��
�y .Mth:Logbnull���     doub� o      �x�x 0 n  � �w��v
�w 
Base� o      �u�u 0 b  �v  � Q     '���� L    �� ^    ��� I    �t��s�t 	0 _logn  � ��r� c    ��� o    �q�q 0 n  � m    �p
�p 
nmbr�r  �s  � l   ��o�n� I    �m��l�m 	0 _logn  � ��k� c    ��� o    �j�j 0 b  � m    �i
�i 
nmbr�k  �l  �o  �n  � R      �h��
�h .ascrerr ****      � ****� o      �g�g 0 etext eText� �f��
�f 
errn� o      �e�e 0 enumber eNumber� �d��
�d 
erob� o      �c�c 0 efrom eFrom� �b��a
�b 
errt� o      �`�` 
0 eto eTo�a  � I    '�_��^�_ 
0 _error  � ��� m    �� ���  l o g b� ��� o     �]�] 0 etext eText� ��� o     !�\�\ 0 enumber eNumber� ��� o   ! "�[�[ 0 efrom eFrom� ��Z� o   " #�Y�Y 
0 eto eTo�Z  �^  � ��� l     �X�W�V�X  �W  �V  � ��U� l     �T�S�R�T  �S  �R  �U       %�Q���� h o�������������������������������Q  � #�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.
�P 
pimr�O 0 _supportlib _supportLib�N 
0 _error  �M 	0 __e__  �L 0 _isequaldelta _isEqualDelta�K 0 _precalcsine _precalcSine�J "0 _precalctangent _precalcTangent�I 60 _canonicalnumberformatter _canonicalNumberFormatter
�H .Mth:NuTenull���     nmbr
�G .Mth:TeNunull���     ctxt
�F .Mth:NuHenull���     long
�E .Mth:HeNunull���     ctxt
�D .Mth:DeRanull���     doub
�C .Mth:RaDenull���     doub
�B .Mth:Abs_null���     nmbr
�A .Mth:CmpNnull���     ****
�@ .Mth:MinNnull���     ****
�? .Mth:MaxNnull���     ****
�> .Mth:RouNnull���     doub�= 0 _sin  
�< .Mth:Sin_null���     doub
�; .Mth:Cos_null���     doub
�: .Mth:Tan_null���     doub�9 	0 _asin  
�8 .Mth:Sinanull���     doub
�7 .Mth:Cosanull���     doub
�6 .Mth:Tananull���     doub
�5 .Mth:Sinhnull���     doub
�4 .Mth:Coshnull���     doub
�3 .Mth:Tanhnull���     doub�2 
0 _frexp  �1 	0 _logn  
�0 .Mth:Lognnull���     doub
�/ .Mth:Lo10null���     doub
�. .Mth:Logbnull���     doub� �-��- �  ��� �,��+
�, 
cobj� ��   �* 
�* 
frmk�+  � �)��(
�) 
cobj� ��   �'
�' 
osax�(  � ��   �& /
�& 
scpt� �% 7�$�#���"�% 
0 _error  �$ �!��! �  � �����  0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�#  � ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  G��� � &0 throwcommanderror throwCommandError�" b  ࠡ����+ � ��� �   } � � � � � � � � � � � } � � � � � � � � � � �� ��� �   } � � � � �� � � � � � } � � � � �� � � � � �
� 
msng
� 
msng� ������� 60 _canonicalnumberformatter _canonicalNumberFormatter�  �  � �� 0 asocformatter asocFormatter� 	��
�	������
� misccura�
 &0 nsnumberformatter NSNumberFormatter�	 	0 alloc  � 0 init  � D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� "0 setnumberstyle_ setNumberStyle_� 0 nslocale NSLocale� 0 systemlocale systemLocale� 0 
setlocale_ 
setLocale_� '��,j+ j+ E�O���,k+ O���,j+ k+ O�� �M�� ����
� .Mth:NuTenull���     nmbr� 0 	thenumber 	theNumber�   � ������������ 0 	thenumber 	theNumber�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ������im������������������
�� 
kocl
�� 
nmbr
�� .corecnte****       ****�� �� 60 throwinvalidparametertype throwInvalidParameterType�� 60 _canonicalnumberformatter _canonicalNumberFormatter�� &0 stringfromnumber_ stringFromNumber_
�� 
ctxt�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� C 2�kv��l j  b  �����+ Y hO*j+ �k+ �&W X 
 *졢���+ � �����������
�� .Mth:TeNunull���     ctxt�� 0 thetext theText��  � �������������� 0 thetext theText�� 0 	theresult 	theResult�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� �����������������������������������
�� 
kocl
�� 
ctxt
�� .corecnte****       ****�� �� 60 throwinvalidparametertype throwInvalidParameterType�� 60 _canonicalnumberformatter _canonicalNumberFormatter�� &0 numberfromstring_ numberFromString_
�� 
msng
�� 
errn���Y
�� 
erob
�� 
****�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� ^ I�kv��l j  b  �����+ Y hO*j+ �k+ E�O��  )�����Y hO��&W X  *a ����a + � �����������
�� .Mth:NuHenull���     long�� 0 	thenumber 	theNumber�� ����
�� 
Plac� {�������� 0 padsize padSize��  ��  � �����
�� 
Pref� {�������� 0 	hasprefix 	hasPrefix��  
�� boovtrue��  � 	�������������������� 0 	thenumber 	theNumber�� 0 padsize padSize�� 0 	hasprefix 	hasPrefix�� 0 hextext hexText�� 0 	hexprefix 	hexPrefix�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ��%��+9AKa������r���������� (0 asintegerparameter asIntegerParameter�� (0 asbooleanparameter asBooleanParameter
�� 
cobj�� 
�� 
leng�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � �b  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�O�E�O�j �E�O�'E�Y �E�O� 
��%E�Y hO h�j���#k/�%E�O��"E�[OY��O h��,���%E�[OY��O��%W X  *a ����a + � �����������
�� .Mth:HeNunull���     ctxt�� 0 hextext hexText�� �����
�� 
Prec� {�������� 0 	isprecise 	isPrecise��  
�� boovtrue��  � 
���������������������� 0 hextext hexText�� 0 	isprecise 	isPrecise�� 0 	thenumber 	theNumber�� 0 
isnegative 
isNegative�� 0 charref charRef�� 0 i  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� #�����������������������������������������~�}�|�{�z�;�y�x�� "0 astextparameter asTextParameter�� (0 asbooleanparameter asBooleanParameter
�� 
ctxt
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 
�� misccura
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null��  ��  
�� 
errn���Y
� 
erob
�~ 
bool
�} 
errt
�| 
doub�{ �z 0 etext eText� �w�v�
�w 
errn�v 0 enumber eNumber� �u�t�
�u 
erob�t 0 efrom eFrom� �s�r�q
�s 
errt�r 
0 eto eTo�q  �y �x 
0 _error  �� ��� �b  ��l+ E�Ob  ��l+ E�O �jE�O��E�O� �[�\[Zl\Zi2E�Y hO�� �[�\[Zm\Zi2E�Y hO E�[��l kh �� E�O� *��a a  UE�O�j  	)jhY hO��kE�[OY��W X  )a a a �a a O�	 ��k a & )a a a �a a a a Y hO� 	�'E�Y hO�VW X  *a  ����a !+ "� �pM�o�n �m
�p .Mth:DeRanull���     doub�o 0 n  �n    �l�k�j�i�h�l 0 n  �k 0 etext eText�j 0 enumber eNumber�i 0 efrom eFrom�h 
0 eto eTo �g�f�e�de�c�b
�g 
doub
�f 
pi  �e ��d 0 etext eText �a�`
�a 
errn�` 0 enumber eNumber �_�^
�_ 
erob�^ 0 efrom eFrom �]�\�[
�] 
errt�\ 
0 eto eTo�[  �c �b 
0 _error  �m  ��&��! W X  *塢���+ � �Zu�Y�X�W
�Z .Mth:RaDenull���     doub�Y 0 n  �X   �V�U�T�S�R�V 0 n  �U 0 etext eText�T 0 enumber eNumber�S 0 efrom eFrom�R 
0 eto eTo �Q�P�O��N�M
�Q 
pi  �P ��O 0 etext eText �L�K
�L 
errn�K 0 enumber eNumber �J�I	
�J 
erob�I 0 efrom eFrom	 �H�G�F
�H 
errt�G 
0 eto eTo�F  �N �M 
0 _error  �W  ���!!W X  *䡢���+ � �E��D�C
�B
�E .Mth:Abs_null���     nmbr�D 0 n  �C  
 �A�@�?�>�=�A 0 n  �@ 0 etext eText�? 0 enumber eNumber�> 0 efrom eFrom�= 
0 eto eTo �<�;��:�9
�< 
nmbr�; 0 etext eText �8�7
�8 
errn�7 0 enumber eNumber �6�5
�6 
erob�5 0 efrom eFrom �4�3�2
�4 
errt�3 
0 eto eTo�2  �: �9 
0 _error  �B * ��&E�O�j �'Y �W X  *㡢���+ � �1��0�/�.
�1 .Mth:CmpNnull���     ****�0 �-�-   �,�+�, 0 n1  �+ 0 n2  �/   �*�)�(�'�&�%�* 0 n1  �) 0 n2  �( 0 etext eText�' 0 enumber eNumber�& 0 efrom eFrom�% 
0 eto eTo �$�#�"�!� �
�$ 
doub
�# 
cobj
�" 
bool�! 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  �  � 
0 _error  �. Z I��&��&lvE[�k/E�Z[�l/E�ZO�b  �	 �b  ��& jY �� iY kW X  *墣���+ � ����
� .Mth:MinNnull���     ****� 0 thelist theList�   ��������� 0 thelist theList� 0 	theresult 	theResult� 0 aref aRef� 0 n  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo (��
�	����T��� "0 aslistparameter asListParameter
�
 
cobj
�	 
nmbr
� 
kocl
� .corecnte****       ****
� 
pcnt� 0 etext eText ��
� 
errn� 0 enumber eNumber � ��
�  
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  � Z Ib  ��l+ E�O��k/�&E�O )�[��l kh ��,�&E�O�� �E�Y h[OY��O�W X  *餥���+ � ��d������
�� .Mth:MaxNnull���     ****�� 0 thelist theList��   ������������������ 0 thelist theList�� 0 	theresult 	theResult�� 0 aref aRef�� 0 n  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo t��������������������� "0 aslistparameter asListParameter
�� 
cobj
�� 
nmbr
�� 
kocl
�� .corecnte****       ****
�� 
pcnt�� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� Z Ib  ��l+ E�O��k/�&E�O )�[��l kh ��,�&E�O�� �E�Y h[OY��O�W X  *餥���+ � ������� ��
�� .Mth:RouNnull���     doub�� 0 num  �� ��!"
�� 
Plac! {�������� 0 decimalplaces decimalPlaces��  ��  " ��#��
�� 
Dire# {�������� &0 roundingdirection roundingDirection��  
�� MRndRNhE��   ������������������ 0 num  �� 0 decimalplaces decimalPlaces�� &0 roundingdirection roundingDirection�� 0 themultiplier theMultiplier�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo  ����������1��O�������������$������� "0 asrealparameter asRealParameter�� (0 asintegerparameter asIntegerParameter�� 

�� MRndRNhE
�� MRndRNhT
�� MRndRN_T
�� MRndRN_U
�� 
bool
�� MRndRN_D�� >0 throwinvalidparameterconstant throwInvalidParameterConstant�� 0 etext eText$ ����%
�� 
errn�� 0 enumber eNumber% ����&
�� 
erob�� 0 efrom eFrom& ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��D/b  ��l+ E�Ob  ��l+ E�O�j �$E�O�� � �!E�Y hO��  3��lv�l!k#kv 
�k"E�Y �j ��k"E�Y 	��k"E�Y ���  1��lv�k#kv 
�k"E�Y �j ��k"E�Y 	��k"E�Y k��  
�k"E�Y ]��  $�j
 	�k#j �& 
�k"E�Y 	�kk"E�Y 5��  $�j
 	�k#j �& 
�k"E�Y 	�kk"E�Y b  ��l+ O�j  	�k"Y �j 	��"Y ��!W X  *a ����a + � �������'(���� 0 _sin  �� ��)�� )  ���� 0 x  ��  ' �������������� 0 x  �� 0 isneg isNeg�� 0 y  �� 0 z  �� 0 z2  �� 0 zz  ( ������������X������������������������ 
�� 
cobj��h
�� 
pi  �� ��� �� �� 
�� 
bool����#j  $�j 	�'E�Y hOb  ��#�"k/EY hO��#� �!E�O�jE�O� 	�'E�Y hO���! k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��#E�O�m �E�O��E�Y hO��� �� �� E�O�� E�O�k 
 �l �& .��l!�� � �� a � a � a � a  E�Y +��� a � a � a � a � a � a  E�O� 	�'E�Y hO�� ������*+��
�� .Mth:Sin_null���     doub�� 0 n  ��  * �������������� 0 n  �� 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo+ ������,#����
�� 
nmbr�� 0 _sin  �� 0 etext eText, ����-
�� 
errn�� 0 enumber eNumber- ����.
�� 
erob�� 0 efrom eFrom. ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��  *��&k+ W X  *䢣���+ � ��3����/0��
�� .Mth:Cos_null���     doub�� 0 n  ��  / ������������ 0 n  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo0 �������1J�~�}
�� 
nmbr�� Z�� 0 _sin  � 0 etext eText1 �|�{2
�| 
errn�{ 0 enumber eNumber2 �z�y3
�z 
erob�y 0 efrom eFrom3 �x�w�v
�x 
errt�w 
0 eto eTo�v  �~ �} 
0 _error  �� ! *��&�k+ W X  *塢���+ � �uZ�t�s45�r
�u .Mth:Tan_null���     doub�t 0 n  �s  4 �q�p�o�n�m�l�k�j�i�h�g�q 0 n  �p 0 x  �o 0 isneg isNeg�n 0 y  �m 0 z  �l 0 z2  �k 0 zz  �j 0 etext eText�i 0 enumber eNumber�h 0 efrom eFrom�g 
0 eto eTo5 !�f�e�d�c�b�a�`�_�^��]�\�[�Z��Y���./01�X�W6U�V�U
�f 
nmbr�e �d Z�c
�b 
bool
�a 
errn�`�Y
�_ 
erob�^ 
�] 
cobj�\h
�[ 
pi  �Z ��Y �X �W 0 etext eText6 �T�S7
�T 
errn�S 0 enumber eNumber7 �R�Q8
�R 
erob�Q 0 efrom eFrom8 �P�O�N
�P 
errt�O 
0 eto eTo�N  �V �U 
0 _error  �r5 ��&E�O��#j  ?�j 	�'E�Y hO�� 
 �� �& )�����Y hOb  ��#�"k/EY hO��#� �!E�O�jE�O� 	�'E�Y hO���!!k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��a  �a  �a  E�O�� E�O�a  4��� a � a � a  �a � a � a � a !E�Y �E�O�l 
 	�a  �& 
i�!E�Y hO� 	�'E�Y hO�W X  *a ����a +  � �Mq�L�K9:�J�M 	0 _asin  �L �I;�I ;  �H�H 0 n  �K  9 �G�F�E�D�C�B�G 0 n  �F 0 x  �E 0 isneg isNeg�D 0 zz  �C 0 p  �B 0 z  : �A�@�?�>�������������=�	 	/	0	1	2	3	4	L	M	N	O	P�<
�A 
errn�@�Y
�? 
erob�> 
�= 
pi  �< ��J ��jE�O� 	�'E�Y hO�k )�����Y hO�� Xk�E�O�� �� �� �� � ��� �� �� �!E�O���$E�O_ �!�E�O�� a E�O��_ �!E�Y ]�a  �E�Y O�� E�O�a � a � a � a � a � a  �a � a � a � a � a !� �E�O� 	�'E�Y hO�_ a !!� �;	h�:�9<=�8
�; .Mth:Sinanull���     doub�: 0 n  �9  < �7�6�5�4�3�7 0 n  �6 0 etext eText�5 0 enumber eNumber�4 0 efrom eFrom�3 
0 eto eTo= �2�1�0>	|�/�.
�2 
nmbr�1 	0 _asin  �0 0 etext eText> �-�,?
�- 
errn�, 0 enumber eNumber? �+�*@
�+ 
erob�* 0 efrom eFrom@ �)�(�'
�) 
errt�( 
0 eto eTo�'  �/ �. 
0 _error  �8  *��&k+ W X  *䡢���+ � �&	��%�$AB�#
�& .Mth:Cosanull���     doub�% 0 n  �$  A �"�!� ���" 0 n  �! 0 etext eText�  0 enumber eNumber� 0 efrom eFrom� 
0 eto eToB ����C	���� Z
� 
nmbr� 	0 _asin  � 0 etext eTextC ��D
� 
errn� 0 enumber eNumberD ��E
� 
erob� 0 efrom eFromE ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �# ! �*��&k+ W X  *塢���+ � �	���FG�
� .Mth:Tananull���     doub� 0 n  �  F ���
�	��� 0 n  � 0 x  �
 0 etext eText�	 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToG �	���H	���
� 
nmbr� 	0 _asin  � 0 etext eTextH �� I
� 
errn�  0 enumber eNumberI ����J
�� 
erob�� 0 efrom eFromJ ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  � + ��&E�O*��� k�$!k+ W X  *墣���+ � ��	�����KL��
�� .Mth:Sinhnull���     doub�� 0 n  ��  K �������������� 0 n  �� 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToL ��
��M
����
�� 
nmbr�� 0 etext eTextM ����N
�� 
errn�� 0 enumber eNumberN ����O
�� 
erob�� 0 efrom eFromO ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� / ��&E�O�b  �$b  �'$ W X  *䢣���+ � ��
'����PQ��
�� .Mth:Coshnull���     doub�� 0 n  ��  P �������������� 0 n  �� 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToQ ��
7��R
J����
�� 
nmbr�� 0 etext eTextR ����S
�� 
errn�� 0 enumber eNumberS ����T
�� 
erob�� 0 efrom eFromT ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� / ��&E�O�b  �$b  �'$ W X  *䢣���+ � ��
Z����UV��
�� .Mth:Tanhnull���     doub�� 0 n  ��  U �������������� 0 n  �� 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToV ����W
�����
�� 
nmbr�� 0 etext eTextW ����X
�� 
errn�� 0 enumber eNumberX ����Y
�� 
erob�� 0 efrom eFromY ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� > -��&E�Ob  �$b  �'$b  �$b  �'$!W X  *㢣���+ � ��
�����Z[���� 
0 _frexp  �� ��\�� \  ���� 0 m  ��  Z �������� 0 m  �� 0 isneg isNeg�� 0 e  [ 
�
���
�� 
bool�� o�j  
�jlvY hO�jE�O� 	�'E�Y hOjE�O 3h��	 �k�&�k �l!E�O�kE�Y �l E�O�kE�[OY��O� 	�'E�Y hO��lv� ��
�����]^���� 	0 _logn  �� ��_�� _  ���� 0 x  ��  ] ���������� 0 x  �� 0 e  �� 0 z  �� 0 y  ^ ����	��������):uvw����������� 
�� 
errn���Y�� 
0 _frexp  
�� 
cobj����
�� 
bool��<�j )��l�Y hO*�k+ E[�k/E�Z[�l/E�ZO��
 �l�& j�� �kE�O��E�O� �E�Y �kE�O� �E�O��!E�O�� E�O�� � �� � ��� �� �!E�O�E�O��� ��a  E�Y ��� �kE�Ol� kE�Y �kE�O�� E�O�� a � a � a � a � a � a  �a � a � a � a � a !E�O�j ��� E�Y hO��l!E�O��E�O�j ��a  E�Y hO�� ��8����`a��
�� .Mth:Lognnull���     doub�� 0 n  ��  ` ������������ 0 n  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToa ������bL����
�� 
nmbr�� 	0 _logn  �� 0 etext eTextb ����c
�� 
errn�� 0 enumber eNumberc ����d
�� 
erob�� 0 efrom eFromd ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��  *��&k+ W X  *䡢���+ � ��\����ef��
�� .Mth:Lo10null���     doub�� 0 n  ��  e ������������ 0 n  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTof 
����pqr��g~���
�� 
nmbr�� 	0 _logn  �� 0 etext eTextg �~�}h
�~ 
errn�} 0 enumber eNumberh �|�{i
�| 
erob�{ 0 efrom eFromi �z�y�x
�z 
errt�y 
0 eto eTo�x  �� � 
0 _error  �� % *��&k+ �!� �!W X  *硢���+ 	� �w��v�ujk�t
�w .Mth:Logbnull���     doub�v 0 n  �u �s�r�q
�s 
Base�r 0 b  �q  j �p�o�n�m�l�k�p 0 n  �o 0 b  �n 0 etext eText�m 0 enumber eNumber�l 0 efrom eFrom�k 
0 eto eTok �j�i�hl��g�f
�j 
nmbr�i 	0 _logn  �h 0 etext eTextl �e�dm
�e 
errn�d 0 enumber eNumberm �c�bn
�c 
erob�b 0 efrom eFromn �a�`�_
�a 
errt�` 
0 eto eTo�_  �g �f 
0 _error  �t ( *��&k+ *��&k+ !W X  *䢣���+ ascr  ��ޭ