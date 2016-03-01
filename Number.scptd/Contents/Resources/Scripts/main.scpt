FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ]W Number -- manipulate numeric values and perform common math functions

Notes:

- The Trigonometry and Logarithm handlers are slightly modified versions of handlers found in ESG MathLib <http://www.esglabs.com/>, which in turn are conversions of functions in the Cephes Mathematical Library by Stephen L. Moshier <http://netlib.org/cephes/>.


TO DO: 

- debug, finalize `parse/format number` behaviors

- should `tan` return `infinity` symbol instead of erroring?

- use identifiers rather than properties in number format record? (other libraries already do this to mimimize namespace pollution)

     � 	 	�   N u m b e r   - -   m a n i p u l a t e   n u m e r i c   v a l u e s   a n d   p e r f o r m   c o m m o n   m a t h   f u n c t i o n s 
 
 N o t e s : 
 
 -   T h e   T r i g o n o m e t r y   a n d   L o g a r i t h m   h a n d l e r s   a r e   s l i g h t l y   m o d i f i e d   v e r s i o n s   o f   h a n d l e r s   f o u n d   i n   E S G   M a t h L i b   < h t t p : / / w w w . e s g l a b s . c o m / > ,   w h i c h   i n   t u r n   a r e   c o n v e r s i o n s   o f   f u n c t i o n s   i n   t h e   C e p h e s   M a t h e m a t i c a l   L i b r a r y   b y   S t e p h e n   L .   M o s h i e r   < h t t p : / / n e t l i b . o r g / c e p h e s / > . 
 
 
 T O   D O :   
 
 -   d e b u g ,   f i n a l i z e   ` p a r s e / f o r m a t   n u m b e r `   b e h a v i o r s 
 
 -   s h o u l d   ` t a n `   r e t u r n   ` i n f i n i t y `   s y m b o l   i n s t e a d   o f   e r r o r i n g ? 
 
 -   u s e   i d e n t i f i e r s   r a t h e r   t h a n   p r o p e r t i e s   i n   n u m b e r   f o r m a t   r e c o r d ?   ( o t h e r   l i b r a r i e s   a l r e a d y   d o   t h i s   t o   m i m i m i z e   n a m e s p a c e   p o l l u t i o n ) 
 
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -     !   l     �� " #��   "   support    # � $ $    s u p p o r t !  % & % l     ��������  ��  ��   &  ' ( ' l      ) * + ) j    �� ,�� 0 _support   , N     - - 4    �� .
�� 
scpt . m     / / � 0 0  T y p e S u p p o r t * "  used for parameter checking    + � 1 1 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g (  2 3 2 l     ��������  ��  ��   3  4 5 4 i   ! 6 7 6 I      �� 8���� 
0 _error   8  9 : 9 o      ���� 0 handlername handlerName :  ; < ; o      ���� 0 etext eText <  = > = o      ���� 0 enumber eNumber >  ? @ ? o      ���� 0 efrom eFrom @  A�� A o      ���� 
0 eto eTo��  ��   7 n     B C B I    �� D���� &0 throwcommanderror throwCommandError D  E F E m     G G � H H  N u m b e r F  I J I o    ���� 0 handlername handlerName J  K L K o    ���� 0 etext eText L  M N M o    	���� 0 enumber eNumber N  O P O o   	 
���� 0 efrom eFrom P  Q�� Q o   
 ���� 
0 eto eTo��  ��   C o     ���� 0 _support   5  R S R l     ��������  ��  ��   S  T U T l     ��������  ��  ��   U  V W V l     �� X Y��   X J D--------------------------------------------------------------------    Y � Z Z � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - W  [ \ [ l     �� ] ^��   ]  
 constants    ^ � _ _    c o n s t a n t s \  ` a ` l     ��������  ��  ��   a  b c b l      d e f d j   " $�� g�� 	0 __e__   g m   " # h h @�
�_� e ; 5 the mathematical constant e (natural logarithm base)    f � i i j   t h e   m a t h e m a t i c a l   c o n s t a n t   e   ( n a t u r a l   l o g a r i t h m   b a s e ) c  j k j l     ��������  ��  ��   k  l m l l      n o p n j   % '�� q�� 0 _isequaldelta _isEqualDelta q m   % & r r =q���-� o i c multiplier used by `cmp` to allow for slight differences due to floating point's limited precision    p � s s �   m u l t i p l i e r   u s e d   b y   ` c m p `   t o   a l l o w   f o r   s l i g h t   d i f f e r e n c e s   d u e   t o   f l o a t i n g   p o i n t ' s   l i m i t e d   p r e c i s i o n m  t u t l     ��������  ��  ��   u  v w v l     ��������  ��  ��   w  x y x l     �� z {��   z J D--------------------------------------------------------------------    { � | | � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - y  } ~ } l     ��  ���      parse and format    � � � � "   p a r s e   a n d   f o r m a t ~  � � � l     ��������  ��  ��   �  � � � i  ( + � � � I      �� ����� (0 _asintegerproperty _asIntegerProperty �  � � � o      ���� 0 thevalue theValue �  � � � o      ���� 0 propertyname propertyName �  ��� � o      ���� 0 minvalue minValue��  ��   � l    8 � � � � Q     8 � � � � k    & � �  � � � r     � � � c     � � � o    ���� 0 thevalue theValue � m    ��
�� 
long � o      ���� 0 n   �  � � � Z  	 # � ����� � G   	  � � � >   	  � � � o   	 
���� 0 n   � c   
  � � � o   
 ���� 0 thevalue theValue � m    ��
�� 
doub � A     � � � o    ���� 0 n   � o    ���� 0 minvalue minValue � R    ���� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � m    �����Y��  ��  ��   �  ��� � L   $ & � � o   $ %���� 0 n  ��   � R      ���� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � d       � � m      �������   � R   . 8�� � �
�� .ascrerr ****      � **** � b   2 7 � � � b   2 5 � � � m   2 3 � � � � � J  n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    � o   3 4���� 0 propertyname propertyName � m   5 6 � � � � � P    p r o p e r t y   i s   n o t   a   n o n - n e g a t i v e   i n t e g e r � �� ���
�� 
errn � m   0 1�����Y��   � . ( TO DO: what about sensible upper bound?    � � � � P   T O   D O :   w h a t   a b o u t   s e n s i b l e   u p p e r   b o u n d ? �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  , / � � � I      �� ����� ,0 _makenumberformatter _makeNumberFormatter �  � � � o      ���� 0 formatstyle formatStyle �  � � � o      ���� 0 
localecode 
localeCode �  ��� � o      ���� 0 defaultstyle defaultStyle��  ��   � l   � � � � � k    � � �  � � � l     � � � � r      � � � n     � � � I    �������� 0 init  ��  ��   � n     � � � I    �������� 	0 alloc  ��  ��   � n     � � � o    ���� &0 nsnumberformatter NSNumberFormatter � m     ��
�� misccura � o      ���� 0 asocformatter asocFormatter �	 (note that while NSFormatter provides a global +setDefaultFormatterBehavior: option to change all NSNumberFormatters to use pre-10.4 behavior, we don't bother to call setFormatterBehavior: as it's very unlikely nowadays that a host process would change this)    � � � �   ( n o t e   t h a t   w h i l e   N S F o r m a t t e r   p r o v i d e s   a   g l o b a l   + s e t D e f a u l t F o r m a t t e r B e h a v i o r :   o p t i o n   t o   c h a n g e   a l l   N S N u m b e r F o r m a t t e r s   t o   u s e   p r e - 1 0 . 4   b e h a v i o r ,   w e   d o n ' t   b o t h e r   t o   c a l l   s e t F o r m a t t e r B e h a v i o r :   a s   i t ' s   v e r y   u n l i k e l y   n o w a d a y s   t h a t   a   h o s t   p r o c e s s   w o u l d   c h a n g e   t h i s ) �  � � � Q   � � � � � Z   j � �� � � =     � � � l    ��~�} � I   �| � �
�| .corecnte****       **** � J     � �  ��{ � o    �z�z 0 formatstyle formatStyle�{   � �y ��x
�y 
kocl � m    �w
�w 
reco�x  �~  �}   � m    �v�v  � k   N � �  � � � r    P � � � n   N � � � I   $ N�u ��t�u 60 asoptionalrecordparameter asOptionalRecordParameter �  � � � o   $ %�s�s 0 formatstyle formatStyle �  � � � K   % G � � �r � �
�r 
pcls � l  & ' ��q�p � m   & '�o
�o 
MthR�q  �p   � �n � �
�n 
MthA � n  ( / � � � o   - /�m�m 0 requiredvalue RequiredValue � o   ( -�l�l 0 _support   � �k � �
�k 
MthB � m   0 1�j
�j 
msng � �i 
�i 
MthC  m   2 3�h
�h 
msng �g
�g 
MthD m   4 5�f
�f 
msng �e
�e 
MthE m   6 7�d
�d 
msng �c
�c 
MthF m   : ;�b
�b 
msng �a	
�a 
MthG m   > ?�`
�` 
msng	 �_
�^
�_ 
MthH
 m   B C�]
�] 
msng�^   � �\ m   G J � 
 u s i n g�\  �t   � o    $�[�[ 0 _support   � o      �Z�Z 0 formatrecord formatRecord �  I   Q [�Y�X�Y "0 _setbasicformat _setBasicFormat  o   R S�W�W 0 asocformatter asocFormatter  n  S V 1   T V�V
�V 
MthA o   S T�U�U 0 formatrecord formatRecord �T o   V W�S�S 0 defaultstyle defaultStyle�T  �X    Z   \ y�R�Q >  \ a n  \ _ 1   ] _�P
�P 
MthB o   \ ]�O�O 0 formatrecord formatRecord m   _ `�N
�N 
msng n  d u !  I   e u�M"�L�M 60 setminimumfractiondigits_ setMinimumFractionDigits_" #�K# I   e q�J$�I�J (0 _asintegerproperty _asIntegerProperty$ %&% n  f i'(' 1   g i�H
�H 
MthB( o   f g�G�G 0 formatrecord formatRecord& )*) m   i l++ �,, , m i n i m u m   d e c i m a l   p l a c e s* -�F- m   l m�E�E  �F  �I  �K  �L  ! o   d e�D�D 0 asocformatter asocFormatter�R  �Q   ./. Z   z �01�C�B0 >  z 232 n  z }454 1   { }�A
�A 
MthC5 o   z {�@�@ 0 formatrecord formatRecord3 m   } ~�?
�? 
msng1 n  � �676 I   � ��>8�=�> 60 setmaximumfractiondigits_ setMaximumFractionDigits_8 9�<9 I   � ��;:�:�; (0 _asintegerproperty _asIntegerProperty: ;<; n  � �=>= 1   � ��9
�9 
MthC> o   � ��8�8 0 formatrecord formatRecord< ?@? m   � �AA �BB , m a x i m u m   d e c i m a l   p l a c e s@ C�7C m   � ��6�6  �7  �:  �<  �=  7 o   � ��5�5 0 asocformatter asocFormatter�C  �B  / DED Z   � �FG�4�3F >  � �HIH n  � �JKJ 1   � ��2
�2 
MthDK o   � ��1�1 0 formatrecord formatRecordI m   � ��0
�0 
msngG k   � �LL MNM n  � �OPO I   � ��/Q�.�/ <0 setminimumsignificantdigits_ setMinimumSignificantDigits_Q R�-R I   � ��,S�+�, (0 _asintegerproperty _asIntegerPropertyS TUT n  � �VWV 1   � ��*
�* 
MthDW o   � ��)�) 0 formatrecord formatRecordU XYX m   � �ZZ �[[ 4 m i n i m u m   s i g n i f i c a n t   d i g i t sY \�(\ m   � ��'�'  �(  �+  �-  �.  P o   � ��&�& 0 asocformatter asocFormatterN ]�%] n  � �^_^ I   � ��$`�#�$ 60 setusessignificantdigits_ setUsesSignificantDigits_` a�"a m   � ��!
�! boovtrue�"  �#  _ o   � �� �  0 asocformatter asocFormatter�%  �4  �3  E bcb Z   � �de��d >  � �fgf n  � �hih 1   � ��
� 
MthEi o   � ��� 0 formatrecord formatRecordg m   � ��
� 
msnge k   � �jj klk n  � �mnm I   � ��o�� <0 setmaximumsignificantdigits_ setMaximumSignificantDigits_o p�p I   � ��q�� (0 _asintegerproperty _asIntegerPropertyq rsr n  � �tut 1   � ��
� 
MthEu o   � ��� 0 formatrecord formatRecords vwv m   � �xx �yy 4 m a x i m u m   s i g n i f i c a n t   d i g i t sw z�z m   � ���  �  �  �  �  n o   � ��� 0 asocformatter asocFormatterl {�{ n  � �|}| I   � ��~�� 60 setusessignificantdigits_ setUsesSignificantDigits_~ � m   � ��
� boovtrue�  �  } o   � ��� 0 asocformatter asocFormatter�  �  �  c ��� Z   �2���
�	� >  � ���� n  � ���� 1   � ��
� 
MthF� o   � ��� 0 formatrecord formatRecord� m   � ��
� 
msng� Q   �.���� k   ��� ��� r   � ���� c   � ���� n  � ���� 1   � ��
� 
MthF� o   � ��� 0 formatrecord formatRecord� m   � ��
� 
ctxt� o      �� 0 s  � ��� Z  ����� � =   ���� n  � ��� 1   � ��
�� 
leng� o   � ����� 0 s  � m   ����  � R  �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  	�����Y��  �  �   � ���� n ��� I  ������� ,0 setdecimalseparator_ setDecimalSeparator_� ���� o  ���� 0 s  ��  ��  � o  ���� 0 asocformatter asocFormatter��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � R  ".����
�� .ascrerr ****      � ****� m  *-�� ��� �  n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    d e c i m a l   s e p a r a t o r    p r o p e r t y   i s   n o t   n o n - e m p t y   t e x t� �����
�� 
errn� m  &)�����Y��  �
  �	  � ��� Z  3�������� > 3:��� n 38��� 1  48��
�� 
MthG� o  34���� 0 formatrecord formatRecord� m  89��
�� 
msng� Q  =����� k  @l�� ��� r  @K��� c  @I��� n @E��� 1  AE��
�� 
MthG� o  @A���� 0 formatrecord formatRecord� m  EH��
�� 
ctxt� o      ���� 0 s  � ���� Z  Ll������ =  LS��� n LQ��� 1  MQ��
�� 
leng� o  LM���� 0 s  � m  QR����  � n V\��� I  W\������� 60 setusesgroupingseparator_ setUsesGroupingSeparator_� ���� m  WX��
�� boovfals��  ��  � o  VW���� 0 asocformatter asocFormatter��  � k  _l�� ��� n _e��� I  `e������� 60 setusesgroupingseparator_ setUsesGroupingSeparator_� ���� m  `a��
�� boovtrue��  ��  � o  _`���� 0 asocformatter asocFormatter� ���� n fl��� I  gl������� .0 setgroupingseparator_ setGroupingSeparator_� ���� o  gh���� 0 s  ��  ��  � o  fg���� 0 asocformatter asocFormatter��  ��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � R  t�����
�� .ascrerr ****      � ****� m  |�� ��� �  n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    g r o u p i n g   s e p a r a t o r    p r o p e r t y   i s   n o t   t e x t� �����
�� 
errn� m  x{�����Y��  ��  ��  � ���� Z  �N������� > ����� n ����� 1  ����
�� 
MthH� o  ������ 0 formatrecord formatRecord� m  ����
�� 
msng� Z  �J����� = ����� n ����� 1  ����
�� 
MthH� o  ������ 0 formatrecord formatRecord� l �������� m  ����
�� MRndRNhE��  ��  � n ����� I  ��������� $0 setroundingmode_ setRoundingMode_� ���� l �������� n ����� o  ������ @0 nsnumberformatterroundhalfeven NSNumberFormatterRoundHalfEven� m  ����
�� misccura��  ��  ��  ��  � o  ������ 0 asocformatter asocFormatter� ��� = ����� n ����� 1  ����
�� 
MthH� o  ������ 0 formatrecord formatRecord� l �������� m  ����
�� MRndRNhT��  ��  � ��� n ��� � I  �������� $0 setroundingmode_ setRoundingMode_ �� l ������ n �� o  ������ @0 nsnumberformatterroundhalfdown NSNumberFormatterRoundHalfDown m  ����
�� misccura��  ��  ��  ��    o  ������ 0 asocformatter asocFormatter�  = ��	 n ��

 1  ����
�� 
MthH o  ������ 0 formatrecord formatRecord	 l ������ m  ����
�� MRndRNhF��  ��    n �� I  �������� $0 setroundingmode_ setRoundingMode_ �� l ������ n �� o  ������ <0 nsnumberformatterroundhalfup NSNumberFormatterRoundHalfUp m  ����
�� misccura��  ��  ��  ��   o  ������ 0 asocformatter asocFormatter  = �� n �� 1  ����
�� 
MthH o  ������ 0 formatrecord formatRecord l ������ m  ����
�� MRndRN_T��  ��    n ��  I  ����!���� $0 setroundingmode_ setRoundingMode_! "��" l ��#����# n ��$%$ o  ������ 80 nsnumberformatterrounddown NSNumberFormatterRoundDown% m  ����
�� misccura��  ��  ��  ��    o  ������ 0 asocformatter asocFormatter &'& = ��()( n ��*+* 1  ����
�� 
MthH+ o  ������ 0 formatrecord formatRecord) l ��,����, m  ����
�� MRndRN_F��  ��  ' -.- n �	/0/ I   	��1���� $0 setroundingmode_ setRoundingMode_1 2��2 l  3��~3 n  454 o  �}�} 40 nsnumberformatterroundup NSNumberFormatterRoundUp5 m   �|
�| misccura�  �~  ��  ��  0 o  � �{�{ 0 asocformatter asocFormatter. 676 = 898 n :;: 1  �z
�z 
MthH; o  �y�y 0 formatrecord formatRecord9 l <�x�w< m  �v
�v MRndRN_U�x  �w  7 =>= n "?@? I  "�uA�t�u $0 setroundingmode_ setRoundingMode_A B�sB l C�r�qC n DED o  �p�p >0 nsnumberformatterroundceiling NSNumberFormatterRoundCeilingE m  �o
�o misccura�r  �q  �s  �t  @ o  �n�n 0 asocformatter asocFormatter> FGF = %.HIH n %*JKJ 1  &*�m
�m 
MthHK o  %&�l�l 0 formatrecord formatRecordI l *-L�k�jL m  *-�i
�i MRndRN_D�k  �j  G M�hM n 1;NON I  2;�gP�f�g $0 setroundingmode_ setRoundingMode_P Q�eQ l 27R�d�cR n 27STS o  37�b�b :0 nsnumberformatterroundfloor NSNumberFormatterRoundFloorT m  23�a
�a misccura�d  �c  �e  �f  O o  12�`�` 0 asocformatter asocFormatter�h  � R  >J�_UV
�_ .ascrerr ****      � ****U m  FIWW �XX �  n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    r o u n d i n g   b e h a v i o r    i s   n o t   a n   a l l o w e d   c o n s t a n tV �^Y�]
�^ 
errnY m  BE�\�\�Y�]  ��  ��  ��  �   � Q  QjZ[\Z I  T\�[]�Z�[ "0 _setbasicformat _setBasicFormat] ^_^ o  UV�Y�Y 0 asocformatter asocFormatter_ `a` o  VW�X�X 0 formatstyle formatStylea b�Wb o  WX�V�V 0 defaultstyle defaultStyle�W  �Z  [ R      �U�Tc
�U .ascrerr ****      � ****�T  c �Sd�R
�S 
errnd d      ee m      �Q�Q��R  \ R  dj�Pf�O
�P .ascrerr ****      � ****f m  figg �hh | n o t   a    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d   o r   a n   a l l o w e d   c o n s t a n t�O   � R      �Nij
�N .ascrerr ****      � ****i o      �M�M 0 etext eTextj �Lk�K
�L 
errnk d      ll m      �J�J��K   � n r�mnm I  w��Io�H�I .0 throwinvalidparameter throwInvalidParametero pqp o  wx�G�G 0 formatstyle formatStyleq rsr m  x{tt �uu 
 u s i n gs vwv J  {�xx yzy m  {|�F
�F 
recoz {�E{ m  |�D
�D 
enum�E  w |�C| o  ���B�B 0 etext eText�C  �H  n o  rw�A�A 0 _support   � }~} n ��� I  ���@��?�@ 0 
setlocale_ 
setLocale_� ��>� l ����=�<� n ����� I  ���;��:�; *0 asnslocaleparameter asNSLocaleParameter� ��� o  ���9�9 0 
localecode 
localeCode� ��8� m  ���� ���  f o r   l o c a l e�8  �:  � o  ���7�7 0 _support  �=  �<  �>  �?  � o  ���6�6 0 asocformatter asocFormatter~ ��5� L  ���� o  ���4�4 0 asocformatter asocFormatter�5   � o i note: this doesn't handle `default format` option as the appropriate default may vary according to usage    � ��� �   n o t e :   t h i s   d o e s n ' t   h a n d l e   ` d e f a u l t   f o r m a t `   o p t i o n   a s   t h e   a p p r o p r i a t e   d e f a u l t   m a y   v a r y   a c c o r d i n g   t o   u s a g e � ��� l     �3�2�1�3  �2  �1  � ��� l     �0�/�.�0  �/  �.  � ��� i  0 3��� I      �-��,�- "0 _setbasicformat _setBasicFormat� ��� o      �+�+ 0 asocformatter asocFormatter� ��� o      �*�* 0 
formatname 
formatName� ��)� o      �(�( 0 defaultstyle defaultStyle�)  �,  � Z     ������ =    ��� o     �'�' 0 
formatname 
formatName� m    �&
�& MthZMth0� n   ��� I    �%��$�% "0 setnumberstyle_ setNumberStyle_� ��#� o    �"�" 0 defaultstyle defaultStyle�#  �$  � o    �!�! 0 asocformatter asocFormatter� ��� =   ��� o    � �  0 
formatname 
formatName� m    �
� MthZMth3� ��� l   ���� n   ��� I    ���� "0 setnumberstyle_ setNumberStyle_� ��� l   ���� n   ��� o    �� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m    �
� misccura�  �  �  �  � o    �� 0 asocformatter asocFormatter�   uses exponent notation   � ��� .   u s e s   e x p o n e n t   n o t a t i o n� ��� =    #��� o     !�� 0 
formatname 
formatName� m   ! "�
� MthZMth1� ��� l  & .���� n  & .��� I   ' .���� "0 setnumberstyle_ setNumberStyle_� ��� l  ' *���� n  ' *��� o   ( *�� 40 nsnumberformatternostyle NSNumberFormatterNoStyle� m   ' (�
� misccura�  �  �  �  � o   & '�� 0 asocformatter asocFormatter� "  uses plain integer notation   � ��� 8   u s e s   p l a i n   i n t e g e r   n o t a t i o n� ��� =  1 4��� o   1 2�� 0 
formatname 
formatName� m   2 3�
� MthZMth2� ��� l  7 ?���� n  7 ?��� I   8 ?�
��	�
 "0 setnumberstyle_ setNumberStyle_� ��� l  8 ;���� n  8 ;��� o   9 ;�� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� m   8 9�
� misccura�  �  �  �	  � o   7 8�� 0 asocformatter asocFormatter� - ' uses thousands separators, no exponent   � ��� N   u s e s   t h o u s a n d s   s e p a r a t o r s ,   n o   e x p o n e n t� ��� =  B E��� o   B C�� 0 
formatname 
formatName� m   C D�
� MthZMth5� ��� l  H P���� n  H P��� I   I P� ����  "0 setnumberstyle_ setNumberStyle_� ���� l  I L������ n  I L��� o   J L���� @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle� m   I J��
�� misccura��  ��  ��  ��  � o   H I���� 0 asocformatter asocFormatter�   adds currency symbol   � ��� *   a d d s   c u r r e n c y   s y m b o l� ��� =  S V��� o   S T���� 0 
formatname 
formatName� m   T U��
�� MthZMth4� ��� l  Y a���� n  Y a��� I   Z a������� "0 setnumberstyle_ setNumberStyle_� ���� l  Z ]������ n  Z ]��� o   [ ]���� >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle� m   Z [��
�� misccura��  ��  ��  ��  � o   Y Z���� 0 asocformatter asocFormatter� ( " multiplies by 100 and appends '%'   � ��� D   m u l t i p l i e s   b y   1 0 0   a n d   a p p e n d s   ' % '� ��� =  d g��� o   d e���� 0 
formatname 
formatName� m   e f��
�� MthZMth6�    l  j r n  j r I   k r������ "0 setnumberstyle_ setNumberStyle_ �� l  k n	����	 n  k n

 o   l n���� @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle m   k l��
�� misccura��  ��  ��  ��   o   j k���� 0 asocformatter asocFormatter   uses words    �    u s e s   w o r d s  >   u � l  u ����� I  u ���
�� .corecnte****       **** J   u x �� o   u v���� 0 
formatname 
formatName��   ����
�� 
kocl m   y |��
�� 
ctxt��  ��  ��   m   � �����   �� n  � � I   � ������� 0 
setformat_ 
setFormat_ �� o   � ����� 0 
formatname 
formatName��  ��   o   � ����� 0 asocformatter asocFormatter��  � R   � ���
�� .ascrerr ****      � **** m   � � � p i n v a l i d    b a s i c   f o r m a t    p r o p e r t y :   n o t   a n   a l l o w e d   c o n s t a n t �� !
�� 
errn  m   � ������Y! ��"#
�� 
erob" o   � ����� 0 
formatname 
formatName# ��$��
�� 
errt$ m   � ���
�� 
enum��  � %&% l     ��������  ��  ��  & '(' l     ��������  ��  ��  ( )*) i  4 7+,+ I      ��-����  0 _nameforformat _nameForFormat- .��. o      ���� 0 formatstyle formatStyle��  ��  , l    H/01/ Z     H23452 =    676 o     ���� 0 formatstyle formatStyle7 m    ��
�� MthZMth13 L    88 m    99 �::  i n t e g e r4 ;<; =   =>= o    ���� 0 formatstyle formatStyle> m    ��
�� MthZMth2< ?@? L    AA m    BB �CC  d e c i m a l@ DED =   FGF o    ���� 0 formatstyle formatStyleG m    ��
�� MthZMth5E HIH L    JJ m    KK �LL  c u r r e n c yI MNM =  ! $OPO o   ! "���� 0 formatstyle formatStyleP m   " #��
�� MthZMth4N QRQ L   ' )SS m   ' (TT �UU  p e r c e n tR VWV =  , /XYX o   , -���� 0 formatstyle formatStyleY m   - .��
�� MthZMth3W Z[Z L   2 4\\ m   2 3]] �^^  s c i e n t i f i c[ _`_ =  7 :aba o   7 8���� 0 formatstyle formatStyleb m   8 9��
�� MthZMth6` c��c L   = ?dd m   = >ee �ff  w o r d��  5 L   B Hgg b   B Ghih b   B Ejkj m   B Cll �mm  k o   C D���� 0 formatstyle formatStylei m   E Fnn �oo  0 G A used for error reporting; formatStyle is either constant or text   1 �pp �   u s e d   f o r   e r r o r   r e p o r t i n g ;   f o r m a t S t y l e   i s   e i t h e r   c o n s t a n t   o r   t e x t* qrq l     ��������  ��  ��  r sts l     ��������  ��  ��  t uvu l     ��wx��  w  -----   x �yy 
 - - - - -v z{z l     ��������  ��  ��  { |}| i  8 ;~~ I     ����
�� .Mth:FNumnull���     nmbr� o      ���� 0 	thenumber 	theNumber� ����
�� 
Usin� |����������  ��  � o      ���� 0 formatstyle formatStyle��  � l     ������ m      ��
�� MthZMth0��  ��  � �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � l     ������ m      �� ���  n o n e��  ��  ��   Q     ����� k    ��� ��� l   "���� Z   "������� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 	thenumber 	theNumber��  � �����
�� 
kocl� m    ��
�� 
nmbr��  ��  ��  � m    ����  � n   ��� I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 	thenumber 	theNumber� ��� m    �� ���  � ��� m    ��
�� 
nmbr� ���� m    �� ���  n u m b e r��  ��  � o    ���� 0 _support  ��  ��  � � � only accept integer or real types (i.e. allowing a text parameter to be coerced to number would defeat the purpose of these handlers, which is to avoid unintended localization behavior)   � ���t   o n l y   a c c e p t   i n t e g e r   o r   r e a l   t y p e s   ( i . e .   a l l o w i n g   a   t e x t   p a r a m e t e r   t o   b e   c o e r c e d   t o   n u m b e r   w o u l d   d e f e a t   t h e   p u r p o s e   o f   t h e s e   h a n d l e r s ,   w h i c h   i s   t o   a v o i d   u n i n t e n d e d   l o c a l i z a t i o n   b e h a v i o r )� ��� l  # #������  � � � TO DO: fix this: needs to mimic AS behavior, so use No/Decimal(?) by default and switch to Sci only when number is beyond certain ranges (currently reals always display as sci)   � ���b   T O   D O :   f i x   t h i s :   n e e d s   t o   m i m i c   A S   b e h a v i o r ,   s o   u s e   N o / D e c i m a l ( ? )   b y   d e f a u l t   a n d   s w i t c h   t o   S c i   o n l y   w h e n   n u m b e r   i s   b e y o n d   c e r t a i n   r a n g e s   ( c u r r e n t l y   r e a l s   a l w a y s   d i s p l a y   a s   s c i )� ��� Z   # ������� F   # .��� =  # &��� o   # $���� 0 formatstyle formatStyle� m   $ %��
�� MthZMth0� =  ) ,��� o   ) *���� 0 
localecode 
localeCode� m   * +��
�� 
msng� k   1 o�� ��� r   1 >��� n  1 <��� I   8 <�������� 0 init  ��  ��  � n  1 8��� I   4 8��~�}� 	0 alloc  �~  �}  � n  1 4��� o   2 4�|�| &0 nsnumberformatter NSNumberFormatter� m   1 2�{
�{ misccura� o      �z�z 0 asocformatter asocFormatter� ��� n  ? K��� I   @ K�y��x�y 0 
setlocale_ 
setLocale_� ��w� l  @ G��v�u� n  @ G��� I   C G�t�s�r�t 0 systemlocale systemLocale�s  �r  � n  @ C��� o   A C�q�q 0 nslocale NSLocale� m   @ A�p
�p misccura�v  �u  �w  �x  � o   ? @�o�o 0 asocformatter asocFormatter� ��n� Z   L o���m�� =  L U��� n  L Q��� m   M Q�l
�l 
pcls� o   L M�k�k 0 	thenumber 	theNumber� m   Q T�j
�j 
long� n  X b��� I   Y b�i��h�i "0 setnumberstyle_ setNumberStyle_� ��g� l  Y ^��f�e� n  Y ^��� o   Z ^�d�d 40 nsnumberformatternostyle NSNumberFormatterNoStyle� m   Y Z�c
�c misccura�f  �e  �g  �h  � o   X Y�b�b 0 asocformatter asocFormatter�m  � n  e o��� I   f o�a��`�a "0 setnumberstyle_ setNumberStyle_� ��_� l  f k��^�]� n  f k��� o   g k�\�\ D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m   f g�[
�[ misccura�^  �]  �_  �`  � o   e f�Z�Z 0 asocformatter asocFormatter�n  ��  � k   r ��� ��� r   r y��� n  r w��� o   s w�Y�Y D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m   r s�X
�X misccura� o      �W�W 0 defaultstyle defaultStyle� ��V� r   z ���� I   z ��U��T�U ,0 _makenumberformatter _makeNumberFormatter� ��� o   { |�S�S 0 formatstyle formatStyle� ��� o   | }�R�R 0 
localecode 
localeCode� ��Q� o   } ~�P�P 0 defaultformat defaultFormat�Q  �T  � o      �O�O 0 asocformatter asocFormatter�V  � ��� r   � ���� n  � �� � I   � ��N�M�N &0 stringfromnumber_ stringFromNumber_ �L o   � ��K�K 0 	thenumber 	theNumber�L  �M    o   � ��J�J 0 asocformatter asocFormatter� o      �I�I 0 
asocstring 
asocString�  l  � � Z  � �	�H�G =  � �

 o   � ��F�F 0 
asocstring 
asocString m   � ��E
�E 
msng	 R   � ��D
�D .ascrerr ****      � **** m   � � � F I n v a l i d   n u m b e r   ( c o n v e r s i o n   f a i l e d ) . �C
�C 
errn m   � ��B�B�Y �A�@
�A 
erob o   � ��?�? 0 	thenumber 	theNumber�@  �H  �G   n h shouldn't fail, but -stringFromNumber:'s return type isn't declared as non-nullable so check to be sure    � �   s h o u l d n ' t   f a i l ,   b u t   - s t r i n g F r o m N u m b e r : ' s   r e t u r n   t y p e   i s n ' t   d e c l a r e d   a s   n o n - n u l l a b l e   s o   c h e c k   t o   b e   s u r e �> L   � � c   � � o   � ��=�= 0 
asocstring 
asocString m   � ��<
�< 
ctxt�>  � R      �;
�; .ascrerr ****      � **** o      �:�: 0 etext eText �9
�9 
errn o      �8�8 0 enumber eNumber �7
�7 
erob o      �6�6 0 efrom eFrom �5�4
�5 
errt o      �3�3 
0 eto eTo�4  � I   � ��2�1�2 
0 _error    !  m   � �"" �##  f o r m a t   n u m b e r! $%$ o   � ��0�0 0 etext eText% &'& o   � ��/�/ 0 enumber eNumber' ()( o   � ��.�. 0 efrom eFrom) *�-* o   � ��,�, 
0 eto eTo�-  �1  } +,+ l     �+�*�)�+  �*  �)  , -.- l     �(�'�&�(  �'  �&  . /0/ i  < ?121 I     �%34
�% .Mth:PNumnull���     ctxt3 o      �$�$ 0 thetext theText4 �#56
�# 
Usin5 |�"�!7� 8�"  �!  7 o      �� 0 formatstyle formatStyle�   8 l     9��9 m      �
� MthZMth0�  �  6 �:�
� 
Loca: |��;�<�  �  ; o      �� 0 
localecode 
localeCode�  < l     =��= m      >> �??  n o n e�  �  �  2 Q     �@AB@ k    �CC DED l   "FGHF Z   "IJ��I =    KLK l   M��M I   �NO
� .corecnte****       ****N J    PP Q�Q o    �� 0 thetext theText�  O �R�
� 
koclR m    �

�
 
ctxt�  �  �  L m    �	�	  J n   STS I    �U�� 60 throwinvalidparametertype throwInvalidParameterTypeU VWV o    �� 0 thetext theTextW XYX m    ZZ �[[  Y \]\ m    �
� 
ctxt] ^�^ m    __ �``  t e x t�  �  T o    �� 0 _support  �  �  G 1 + only accept text, for same reason as above   H �aa V   o n l y   a c c e p t   t e x t ,   f o r   s a m e   r e a s o n   a s   a b o v eE bcb Z   # cde�fd F   # .ghg =  # &iji o   # $�� 0 formatstyle formatStylej m   $ %� 
�  MthZMth0h =  ) ,klk o   ) *���� 0 
localecode 
localeCodel m   * +��
�� 
msnge k   1 Vmm non r   1 >pqp n  1 <rsr I   8 <�������� 0 init  ��  ��  s n  1 8tut I   4 8�������� 	0 alloc  ��  ��  u n  1 4vwv o   2 4���� &0 nsnumberformatter NSNumberFormatterw m   1 2��
�� misccuraq o      ���� 0 asocformatter asocFormattero xyx n  ? Kz{z I   @ K��|���� 0 
setlocale_ 
setLocale_| }��} l  @ G~����~ n  @ G� I   C G�������� 0 systemlocale systemLocale��  ��  � n  @ C��� o   A C���� 0 nslocale NSLocale� m   @ A��
�� misccura��  ��  ��  ��  { o   ? @���� 0 asocformatter asocFormattery ���� n  L V��� I   M V������� "0 setnumberstyle_ setNumberStyle_� ���� l  M R������ n  M R��� o   N R���� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m   M N��
�� misccura��  ��  ��  ��  � o   L M���� 0 asocformatter asocFormatter��  �  f r   Y c��� I   Y a������� ,0 _makenumberformatter _makeNumberFormatter� ��� o   Z [���� 0 formatstyle formatStyle� ��� o   [ \���� 0 
localecode 
localeCode� ���� m   \ ]��
�� boovfals��  ��  � o      ���� 0 asocformatter asocFormatterc ��� r   d l��� n  d j��� I   e j������� &0 numberfromstring_ numberFromString_� ���� o   e f���� 0 thetext theText��  ��  � o   d e���� 0 asocformatter asocFormatter� o      ���� 0 
asocnumber 
asocNumber� ��� Z   m �������� =  m p��� o   m n���� 0 
asocnumber 
asocNumber� m   n o��
�� 
msng� k   s ��� ��� r   s ���� c   s ~��� n  s |��� I   x |�������� $0 localeidentifier localeIdentifier��  ��  � n  s x��� I   t x�������� 
0 locale  ��  ��  � o   s t���� 0 asocformatter asocFormatter� m   | }��
�� 
ctxt� o      ���� $0 localeidentifier localeIdentifier� ��� Z   � ������� =   � ���� n  � ���� 1   � ���
�� 
leng� o   � ����� $0 localeidentifier localeIdentifier� m   � �����  � l  � ����� r   � ���� m   � ��� ���  n o� o      ���� $0 localeidentifier localeIdentifier� #  empty string = system locale   � ��� :   e m p t y   s t r i n g   =   s y s t e m   l o c a l e��  � r   � ���� b   � ���� b   � ���� m   � ��� ��� 
 t h e   � o   � ����� $0 localeidentifier localeIdentifier� m   � ��� ���  � o      ���� $0 localeidentifier localeIdentifier� ���� R   � �����
�� .ascrerr ****      � ****� l  � ������� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ��� R I n v a l i d   t e x t   ( e x p e c t e d   n u m e r i c a l   t e x t   i n  � I   � ��������  0 _nameforformat _nameForFormat� ���� o   � ����� 0 formatstyle formatStyle��  ��  � m   � ��� ���    f o r m a t   f o r  � o   � ����� $0 localeidentifier localeIdentifier� m   � ��� ���    l o c a l e ) .��  ��  � ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 thetext theText��  ��  ��  ��  � ���� L   � ��� c   � ���� o   � ����� 0 
asocnumber 
asocNumber� m   � ���
�� 
****��  A R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  B I   � �������� 
0 _error  � ��� m   � ��� ���  p a r s e   n u m b e r� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  0 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �� ��    $  Hexadecimal number conversion    � <   H e x a d e c i m a l   n u m b e r   c o n v e r s i o n�  l     ��������  ��  ��    i  @ C I     ��	

�� .Mth:NuHenull���     ****	 o      ���� 0 	thenumber 	theNumber
 ��
�� 
Plac |��������  ��   o      ���� 0 	chunksize 	chunkSize��   l     ���� m      ����  ��  ��   ����
�� 
Pref |��������  ��   o      ���� 0 	hasprefix 	hasPrefix��   l     ���� m      ��
�� boovfals��  ��  ��   Q    � k   �  r     n    I    ����� (0 asintegerparameter asIntegerParameter   o    	�~�~ 0 	chunksize 	chunkSize  !�}! m   	 
"" �## 
 w i d t h�}  �   o    �|�| 0 _support   o      �{�{ 0 	chunksize 	chunkSize $%$ l   &'(& r    )*) n   +,+ I    �z-�y�z (0 asbooleanparameter asBooleanParameter- ./. o    �x�x 0 	hasprefix 	hasPrefix/ 0�w0 m    11 �22  p r e f i x�w  �y  , o    �v�v 0 _support  * o      �u�u 0 	hasprefix 	hasPrefix' � � (users shouldn't concatenate their own prefix as that would result in negative numbers appearing as "0x-N�" instead of "-0xN�")   ( �33    ( u s e r s   s h o u l d n ' t   c o n c a t e n a t e   t h e i r   o w n   p r e f i x   a s   t h a t   w o u l d   r e s u l t   i n   n e g a t i v e   n u m b e r s   a p p e a r i n g   a s   " 0 x - N & "   i n s t e a d   o f   " - 0 x N & " )% 4�t4 Z   �56�s75 =    *898 l   (:�r�q: I   (�p;<
�p .corecnte****       ****; J    "== >�o> o     �n�n 0 	thenumber 	theNumber�o  < �m?�l
�m 
kocl? m   # $�k
�k 
list�l  �r  �q  9 m   ( )�j�j  6 l  -E@AB@ k   -ECC DED l  - :FGHF r   - :IJI n  - 8KLK I   2 8�iM�h�i 00 aswholenumberparameter asWholeNumberParameterM NON o   2 3�g�g 0 	thenumber 	theNumberO P�fP m   3 4QQ �RR  �f  �h  L o   - 2�e�e 0 _support  J o      �d�d 0 	thenumber 	theNumberG ^ X numbers greater than 2^30 (max integer size) are okay as long as they're non-fractional   H �SS �   n u m b e r s   g r e a t e r   t h a n   2 ^ 3 0   ( m a x   i n t e g e r   s i z e )   a r e   o k a y   a s   l o n g   a s   t h e y ' r e   n o n - f r a c t i o n a lE TUT l  ; ;�cVW�c  V � � note that the 1024 max chunk size is somewhat arbitrary (the largest representable number requires ~309 chars; anything more will always be left-hand padding), but prevents completely silly values   W �XX�   n o t e   t h a t   t h e   1 0 2 4   m a x   c h u n k   s i z e   i s   s o m e w h a t   a r b i t r a r y   ( t h e   l a r g e s t   r e p r e s e n t a b l e   n u m b e r   r e q u i r e s   ~ 3 0 9   c h a r s ;   a n y t h i n g   m o r e   w i l l   a l w a y s   b e   l e f t - h a n d   p a d d i n g ) ,   b u t   p r e v e n t s   c o m p l e t e l y   s i l l y   v a l u e sU YZY Z  ; Z[\�b�a[ G   ; F]^] A   ; >_`_ o   ; <�`�` 0 	chunksize 	chunkSize` m   < =�_�_  ^ ?   A Daba o   A B�^�^ 0 	chunksize 	chunkSizeb m   B C�]�] \ n  I Vcdc I   N V�\e�[�\ .0 throwinvalidparameter throwInvalidParametere fgf o   N O�Z�Z 0 	chunksize 	chunkSizeg hih m   O Pjj �kk 
 w i d t hi lml m   P Q�Y
�Y 
longm n�Xn m   Q Roo �pp  m u s t   b e   0  1 0 2 4�X  �[  d o   I N�W�W 0 _support  �b  �a  Z qrq r   [ `sts m   [ ^uu �vv  t o      �V�V 0 hextext hexTextr wxw Z   a �yz�U{y A   a d|}| o   a b�T�T 0 	thenumber 	theNumber} m   b c�S�S  z k   g �~~ � Z  g ����R�Q� F   g v��� ?   g j��� o   g h�P�P 0 	chunksize 	chunkSize� m   h i�O�O  � l  m t��N�M� A   m t��� o   m n�L�L 0 	thenumber 	theNumber� a   n s��� m   n q�K�K��� o   q r�J�J 0 	chunksize 	chunkSize�N  �M  � n  y ���� I   ~ ��I��H�I .0 throwinvalidparameter throwInvalidParameter� ��� o   ~ �G�G 0 	thenumber 	theNumber� ��� m    ��� ���  � ��� m   � ��F
�F 
long� ��E� b   � ���� b   � ���� b   � ���� m   � ��� ��� X s p e c i f i e d   w i d t h   o n l y   a l l o w s   n u m b e r s   b e t w e e n  � l  � ���D�C� a   � ���� m   � ��B�B��� o   � ��A�A 0 	chunksize 	chunkSize�D  �C  � m   � ��� ��� 
   a n d  � l  � ���@�?� \   � ���� a   � ���� m   � ��>�> � o   � ��=�= 0 	chunksize 	chunkSize� m   � ��<�< �@  �?  �E  �H  � o   y ~�;�; 0 _support  �R  �Q  � ��� r   � ���� m   � ��� ���  -� o      �:�: 0 	hexprefix 	hexPrefix� ��9� r   � ���� d   � ��� o   � ��8�8 0 	thenumber 	theNumber� o      �7�7 0 	thenumber 	theNumber�9  �U  { k   � ��� ��� r   � ���� m   � ��� ���  � o      �6�6 0 	hexprefix 	hexPrefix� ��5� Z  � ����4�3� F   � ���� ?   � ���� o   � ��2�2 0 	chunksize 	chunkSize� m   � ��1�1  � l  � ���0�/� ?   � ���� o   � ��.�. 0 	thenumber 	theNumber� \   � ���� a   � ���� m   � ��-�- � o   � ��,�, 0 	chunksize 	chunkSize� m   � ��+�+ �0  �/  � n  � ���� I   � ��*��)�* .0 throwinvalidparameter throwInvalidParameter� ��� o   � ��(�( 0 	thenumber 	theNumber� ��� m   � ��� ���  � ��� m   � ��'
�' 
long� ��&� b   � ���� b   � ���� b   � ���� m   � ��� ��� X s p e c i f i e d   w i d t h   o n l y   a l l o w s   n u m b e r s   b e t w e e n  � l  � ���%�$� a   � ���� m   � ��#�#��� o   � ��"�" 0 	chunksize 	chunkSize�%  �$  � m   � ��� ��� 
   a n d  � l  � ���!� � \   � ���� a   � ���� m   � ��� � o   � ��� 0 	chunksize 	chunkSize� m   � ��� �!  �   �&  �)  � o   � ��� 0 _support  �4  �3  �5  x ��� Z  � ������ o   � ��� 0 	hasprefix 	hasPrefix� r   � ���� b   � ���� o   � ��� 0 	hexprefix 	hexPrefix� m   � ��� ���  0 x� o      �� 0 	hexprefix 	hexPrefix�  �  � ��� V   '��� k  "�� ��� r  ��� b  ��� l ���� n  ��� 4  ��
� 
cobj� l  ��  [   `   o  �� 0 	thenumber 	theNumber m  ��  m  �� �  �  � m   �   0 1 2 3 4 5 6 7 8 9 A B C D E F�  �  � o  �� 0 hextext hexText� o      �� 0 hextext hexText� � r  "	 _   

 o  �� 0 	thenumber 	theNumber m  �
�
 	 o      �	�	 0 	thenumber 	theNumber�  � ?   o  �� 0 	thenumber 	theNumber m  ��  �  V  (@ r  4; b  49 m  47 �  0 o  78�� 0 hextext hexText o      �� 0 hextext hexText A  ,3 n  ,1 1  -1�
� 
leng o  ,-�� 0 hextext hexText o  12�� 0 	chunksize 	chunkSize � L  AE b  AD o  AB� �  0 	hexprefix 	hexPrefix o  BC���� 0 hextext hexText�  A   format single number   B �   *   f o r m a t   s i n g l e   n u m b e r�s  7 l H�!"#! k  H�$$ %&% l Hk'()' Z Hk*+����* G  HS,-, A  HK./. o  HI���� 0 	chunksize 	chunkSize/ m  IJ���� - ?  NQ010 o  NO���� 0 	chunksize 	chunkSize1 m  OP���� + n Vg232 I  [g��4���� .0 throwinvalidparameter throwInvalidParameter4 565 o  [\���� 0 	chunksize 	chunkSize6 787 m  \_99 �:: 
 w i d t h8 ;<; m  _`��
�� 
long< =��= m  `c>> �??  m u s t   b e   1  1 0 2 4��  ��  3 o  V[���� 0 _support  ��  ��  (   chunksize must be given   ) �@@ 0   c h u n k s i z e   m u s t   b e   g i v e n& ABA r  l�CDC J  lxEE FGF m  loHH �II  G J��J \  ovKLK a  otMNM m  or���� N o  rs���� 0 	chunksize 	chunkSizeL m  tu���� ��  D J      OO PQP o      ���� 0 padtext padTextQ R��R o      ���� 0 maxsize maxSize��  B STS U  ��UVU r  ��WXW b  ��YZY o  ������ 0 padtext padTextZ m  ��[[ �\\  0X o      ���� 0 padtext padTextV o  ������ 0 	chunksize 	chunkSizeT ]^] h  ����_�� 0 
resultlist 
resultList_ j     	��`�� 
0 _list_  ` n    aba 2   ��
�� 
cobjb o     ���� 0 	thenumber 	theNumber^ cdc X  ��e��fe k  �{gg hih Q  �6jklj k  ��mm non r  ��pqp c  ��rsr n ��tut 1  ����
�� 
pcntu o  ������ 0 aref aRefs m  ����
�� 
longq o      ���� 0 	thenumber 	theNumbero v��v Z ��wx����w G  ��yzy G  ��{|{ >  ��}~} o  ������ 0 	thenumber 	theNumber~ c  ��� n ����� 1  ����
�� 
pcnt� o  ������ 0 aref aRef� m  ����
�� 
doub| A  ����� o  ������ 0 	thenumber 	theNumber� m  ������  z ?  ����� o  ������ 0 	thenumber 	theNumber� o  ������ 0 maxsize maxSizex R  �������
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  �������\��  ��  ��  ��  k R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  l Z  6������ ?  ��� o  ���� 0 	thenumber 	theNumber� o  ���� 0 maxsize maxSize� n 	"��� I  "������� .0 throwinvalidparameter throwInvalidParameter� ��� o  ���� 0 	thenumber 	theNumber� ��� m  �� ���  � ��� m  ��
�� 
long� ���� b  ��� m  �� ��� h s p e c i f i e d   w i d t h   o n l y   a l l o w s   n u m b e r s   b e t w e e n   0 . 0   a n d  � l ������ \  ��� a  ��� m  ���� � o  ���� 0 	chunksize 	chunkSize� m  ���� ��  ��  ��  ��  � o  	���� 0 _support  ��  � n %6��� I  *6������� .0 throwinvalidparameter throwInvalidParameter� ��� o  *+���� 0 aref aRef� ��� m  +.�� ���  � ��� m  ./��
�� 
long� ���� m  /2�� ��� V e x p e c t e d   n o n - n e g a t i v e   n o n - f r a c t i o n a l   n u m b e r��  ��  � o  %*���� 0 _support  i ��� r  7<��� m  7:�� ���  � o      ���� 0 hextext hexText� ��� V  =d��� k  E_�� ��� r  EW��� b  EU��� l ES������ n  ES��� 4  HS���
�� 
cobj� l KR������ [  KR��� `  KP��� o  KL���� 0 	thenumber 	theNumber� m  LO���� � m  PQ���� ��  ��  � m  EH�� ���   0 1 2 3 4 5 6 7 8 9 A B C D E F��  ��  � o  ST���� 0 hextext hexText� o      ���� 0 hextext hexText� ���� r  X_��� _  X]��� o  XY���� 0 	thenumber 	theNumber� m  Y\���� � o      ���� 0 	thenumber 	theNumber��  � ?  AD��� o  AB���� 0 	thenumber 	theNumber� m  BC����  � ���� r  e{��� n eu��� 7 hu����
�� 
ctxt� d  nq�� o  op���� 0 	chunksize 	chunkSize� m  rt������� l eh������ b  eh��� o  ef���� 0 padtext padText� o  fg���� 0 hextext hexText��  ��  � n     ��� 1  vz��
�� 
pcnt� o  uv���� 0 aref aRef��  �� 0 aref aReff n ����� o  ������ 
0 _list_  � o  ������ 0 
resultlist 
resultListd ��� r  ����� n ����� 1  ����
�� 
txdl� 1  ����
�� 
ascr� o      ���� 0 oldtids oldTIDs� ��� r  ����� m  ���� ���  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ��� Z  �������� o  ������ 0 	hasprefix 	hasPrefix� r  ����� b  ����� m  ���� ���  0 x� n ��� � o  ������ 
0 _list_    o  ������ 0 
resultlist 
resultList� o      ���� 0 hextext hexText��  � r  �� c  �� n �� o  ������ 
0 _list_   o  ������ 0 
resultlist 
resultList m  ����
�� 
ctxt o      ���� 0 hextext hexText�  r  ��	
	 o  ������ 0 oldtids oldTIDs
 n      1  ����
�� 
txdl 1  ����
�� 
ascr �� L  �� o  ������ 0 hextext hexText��  "   format list of number   # � ,   f o r m a t   l i s t   o f   n u m b e r�t   R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ���
�� 
errt o      �~�~ 
0 eto eTo�   I  ���}�|�} 
0 _error    m  �� �  f o r m a t   h e x  o  ���{�{ 0 etext eText  o  ���z�z 0 enumber eNumber  !  o  ���y�y 0 efrom eFrom! "�x" o  ���w�w 
0 eto eTo�x  �|   #$# l     �v�u�t�v  �u  �t  $ %&% l     �s�r�q�s  �r  �q  & '(' i  D G)*) I     �p+,
�p .Mth:HeNunull���     ctxt+ o      �o�o 0 hextext hexText, �n-.
�n 
Plac- |�m�l/�k0�m  �l  / o      �j�j 0 	chunksize 	chunkSize�k  0 l     1�i�h1 m      �g�g  �i  �h  . �f2�e
�f 
Prec2 |�d�c3�b4�d  �c  3 o      �a�a 0 	isprecise 	isPrecise�b  4 l     5�`�_5 m      �^
�^ boovtrue�`  �_  �e  * Q    b6786 P   L9:;9 k   K<< =>= r    ?@? n   ABA I    �]C�\�] "0 astextparameter asTextParameterC DED o    �[�[ 0 hextext hexTextE F�ZF m    GG �HH  �Z  �\  B o    �Y�Y 0 _support  @ o      �X�X 0 hextext hexText> IJI r    #KLK n   !MNM I    !�WO�V�W (0 asintegerparameter asIntegerParameterO PQP o    �U�U 0 	chunksize 	chunkSizeQ R�TR m    SS �TT 
 w i d t h�T  �V  N o    �S�S 0 _support  L o      �R�R 0 	chunksize 	chunkSizeJ UVU Z  $ CWX�Q�PW G   $ /YZY A   $ '[\[ o   $ %�O�O 0 	chunksize 	chunkSize\ m   % &�N�N  Z ?   * -]^] o   * +�M�M 0 	chunksize 	chunkSize^ m   + ,�L�L X n  2 ?_`_ I   7 ?�Ka�J�K .0 throwinvalidparameter throwInvalidParametera bcb o   7 8�I�I 0 	chunksize 	chunkSizec ded m   8 9ff �gg 
 w i d t he hih m   9 :�H
�H 
longi j�Gj m   : ;kk �ll  m u s t   b e   0  1 0 2 4�G  �J  ` o   2 7�F�F 0 _support  �Q  �P  V mnm r   D Ropo H   D Pqq n  D Orsr I   I O�Et�D�E (0 asbooleanparameter asBooleanParametert uvu o   I J�C�C 0 	isprecise 	isPrecisev w�Bw m   J Kxx �yy  p r e c i s i o n   l o s s�B  �D  s o   D I�A�A 0 _support  p o      �@�@ 0 	isprecise 	isPrecisen z�?z Z   SK{|�>}{ =   S V~~ o   S T�=�= 0 	chunksize 	chunkSize m   T U�<�<  | l  Y;���� k   Y;�� ��� Q   Y���� k   \ ��� ��� r   \ _��� m   \ ]�;�;  � o      �:�: 0 	thenumber 	theNumber� ��� r   ` e��� C   ` c��� o   ` a�9�9 0 hextext hexText� m   a b�� ���  -� o      �8�8 0 
isnegative 
isNegative� ��� Z  f }���7�6� o   f g�5�5 0 
isnegative 
isNegative� r   j y��� n   j w��� 7  k w�4��
�4 
ctxt� m   q s�3�3 � m   t v�2�2��� o   j k�1�1 0 hextext hexText� o      �0�0 0 hextext hexText�7  �6  � ��� Z  ~ ����/�.� C   ~ ���� o   ~ �-�- 0 hextext hexText� m    ��� ���  0 x� r   � ���� n   � ���� 7  � ��,��
�, 
ctxt� m   � ��+�+ � m   � ��*�*��� o   � ��)�) 0 hextext hexText� o      �(�( 0 hextext hexText�/  �.  � ��'� X   � ���&�� k   � ��� ��� r   � ���� ]   � ���� o   � ��%�% 0 	thenumber 	theNumber� m   � ��$�$ � o      �#�# 0 	thenumber 	theNumber� ��� r   � ���� I  � ���"�� z�!� 
�! .sysooffslong    ��� null
�  misccura�"  � ���
� 
psof� o   � ��� 0 charref charRef� ���
� 
psin� m   � ��� ���   0 1 2 3 4 5 6 7 8 9 A B C D E F�  � o      �� 0 i  � ��� Z  � ������ =   � ���� o   � ��� 0 i  � m   � ���  � R   � ����
� .ascrerr ****      � ****�  � ���
� 
errn� m   � ����@�  �  �  � ��� r   � ���� \   � ���� [   � ���� o   � ��� 0 	thenumber 	theNumber� o   � ��� 0 i  � m   � ��� � o      �� 0 	thenumber 	theNumber�  �& 0 charref charRef� o   � ��� 0 hextext hexText�'  � R      ��
�
� .ascrerr ****      � ****�
  � �	��
�	 
errn� d      �� m      ����  � l  ����� R   ����
� .ascrerr ****      � ****� m  �� ��� > N o t   a   v a l i d   h e x a d e c i m a l   n u m b e r .� ���
� 
errn� m   � ����Y� ���
� 
erob� o  �� 0 hextext hexText�  � E ? catch errors if hexText is too short or contains non-hex chars   � ��� ~   c a t c h   e r r o r s   i f   h e x T e x t   i s   t o o   s h o r t   o r   c o n t a i n s   n o n - h e x   c h a r s� ��� Z 	+��� ��� F  	��� o  	
���� 0 	isprecise 	isPrecise� l ������ =  ��� o  ���� 0 	thenumber 	theNumber� [  ��� o  ���� 0 	thenumber 	theNumber� m  ���� ��  ��  � R  '����
�� .ascrerr ****      � ****� m  #&�� ��� � H e x a d e c i m a l   t e x t   i s   t o o   l a r g e   t o   c o n v e r t   t o   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n .� ����
�� 
errn� m  �����Y� �����
�� 
erob� o  !"���� 0 hextext hexText��  �   ��  � ��� Z ,8������� o  ,-���� 0 
isnegative 
isNegative� r  04��� d  02�� o  01���� 0 	thenumber 	theNumber� o      ���� 0 	thenumber 	theNumber��  ��  � ���� L  9;�� o  9:���� 0 	thenumber 	theNumber��  �   read as single number   � ��� ,   r e a d   a s   s i n g l e   n u m b e r�>  } l >K���� k  >K��    Z >d���� >  >G `  >E l >C���� n >C	
	 1  ?C��
�� 
leng
 o  >?���� 0 hextext hexText��  ��   o  CD���� 0 	chunksize 	chunkSize m  EF����   R  J`��
�� .ascrerr ****      � **** b  V_ b  V[ m  VY � T C a n ' t   s p l i t   h e x a d e c i m a l   t e x t   e x a c t l y   i n t o   o  YZ���� 0 	chunksize 	chunkSize m  [^ �  - d i g i t   c h u n k s . ��
�� 
errn m  NQ�����Y ����
�� 
erob o  TU���� 0 hextext hexText��  ��  ��    h  ep���� 0 
resultlist 
resultList j     ���� 
0 _list_   J     ����    Y  qC�� ! k  �>"" #$# r  ��%&% m  ������  & o      ���� 0 	thenumber 	theNumber$ '(' X  �)��*) k  ��++ ,-, r  ��./. ]  ��010 o  ������ 0 	thenumber 	theNumber1 m  ������ / o      ���� 0 	thenumber 	theNumber- 232 r  ��454 I ��6��76 z����
�� .sysooffslong    ��� null
�� misccura��  7 ��89
�� 
psof8 o  ������ 0 charref charRef9 ��:��
�� 
psin: m  ��;; �<<   0 1 2 3 4 5 6 7 8 9 A B C D E F��  5 o      ���� 0 i  3 =>= Z ��?@����? =  ��ABA o  ������ 0 i  B m  ������  @ R  ����CD
�� .ascrerr ****      � ****C m  ��EE �FF > N o t   a   v a l i d   h e x a d e c i m a l   n u m b e r .D ��GH
�� 
errnG m  �������YH ��I��
�� 
erobI l ��J����J N  ��KK n  ��LML 7 ����NO
�� 
ctxtN o  ������ 0 i  O l ��P����P \  ��QRQ [  ��STS o  ������ 0 i  T o  ������ 0 	chunksize 	chunkSizeR m  ������ ��  ��  M o  ������ 0 hextext hexText��  ��  ��  ��  ��  > U��U r  ��VWV \  ��XYX [  ��Z[Z o  ������ 0 	thenumber 	theNumber[ o  ������ 0 i  Y m  ������ W o      ���� 0 	thenumber 	theNumber��  �� 0 charref charRef* n ��\]\ 7 ����^_
�� 
ctxt^ o  ������ 0 i  _ l ��`����` \  ��aba [  ��cdc o  ������ 0 i  d o  ������ 0 	chunksize 	chunkSizeb m  ������ ��  ��  ] o  ������ 0 hextext hexText( efe Z 5gh����g F  iji o  ���� 0 	isprecise 	isPrecisej l k����k =  lml o  ���� 0 	thenumber 	theNumberm [  
non o  ���� 0 	thenumber 	theNumbero m  	���� ��  ��  h R  1��pq
�� .ascrerr ****      � ****p m  -0rr �ss � H e x a d e c i m a l   t e x t   i s   t o o   l a r g e   t o   c o n v e r t   t o   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n .q ��tu
�� 
errnt m  �����Yu ��v��
�� 
erobv l ,w����w N  ,xx n  +yzy 7 +��{|
�� 
ctxt{ o  !#���� 0 i  | l $*}����} \  $*~~ [  %(��� o  %&���� 0 i  � o  &'���� 0 	chunksize 	chunkSize m  ()���� ��  ��  z o  ���� 0 hextext hexText��  ��  ��  ��  ��  f ���� r  6>��� o  67���� 0 	thenumber 	theNumber� n      ���  ;  <=� n 7<��� o  8<���� 
0 _list_  � o  78���� 0 
resultlist 
resultList��  �� 0 i   m  tu����   n u{��� 1  vz��
�� 
leng� o  uv���� 0 hextext hexText! o  {|���� 0 	chunksize 	chunkSize ���� L  DK�� n DJ��� o  EI���� 
0 _list_  � o  DE���� 0 
resultlist 
resultList��  �   read as list of numbers   � ��� 0   r e a d   a s   l i s t   o f   n u m b e r s�?  : ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  ; ���
�� conscase� ����
�� consnume��  7 R      ����
�� .ascrerr ****      � ****� o      �� 0 etext eText� �~��
�~ 
errn� o      �}�} 0 enumber eNumber� �|��
�| 
erob� o      �{�{ 0 efrom eFrom� �z��y
�z 
errt� o      �x�x 
0 eto eTo�y  8 I  Tb�w��v�w 
0 _error  � ��� m  UX�� ���  p a r s e   h e x� ��� o  XY�u�u 0 etext eText� ��� o  YZ�t�t 0 enumber eNumber� ��� o  Z[�s�s 0 efrom eFrom� ��r� o  [\�q�q 
0 eto eTo�r  �v  ( ��� l     �p�o�n�p  �o  �n  � ��� l     �m�l�k�m  �l  �k  � ��� l     �j���j  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �i���i  � !  General numeric operations   � ��� 6   G e n e r a l   n u m e r i c   o p e r a t i o n s� ��� l     �h�g�f�h  �g  �f  � ��� i  H K��� I     �e��d
�e .Mth:DeRanull���     doub� o      �c�c 0 x  �d  � Q     ���� L    �� ]    
��� l   ��b�a� c    ��� o    �`�` 0 x  � m    �_
�_ 
doub�b  �a  � l   	��^�]� ^    	��� 1    �\
�\ 
pi  � m    �[�[ ��^  �]  � R      �Z��
�Z .ascrerr ****      � ****� o      �Y�Y 0 etext eText� �X��
�X 
errn� o      �W�W 0 enumber eNumber� �V��
�V 
erob� o      �U�U 0 efrom eFrom� �T��S
�T 
errt� o      �R�R 
0 eto eTo�S  � I    �Q��P�Q 
0 _error  � ��� m    �� ���  r a d i a n s� ��� o    �O�O 0 etext eText� ��� o    �N�N 0 enumber eNumber� ��� o    �M�M 0 efrom eFrom� ��L� o    �K�K 
0 eto eTo�L  �P  � ��� l     �J�I�H�J  �I  �H  � ��� l     �G�F�E�G  �F  �E  � ��� i  L O��� I     �D��C
�D .Mth:RaDenull���     doub� o      �B�B 0 x  �C  � Q     ���� L    �� ^    
��� l   ��A�@� c    ��� o    �?�? 0 x  � m    �>
�> 
doub�A  �@  � l   	��=�<� ^    	��� 1    �;
�; 
pi  � m    �:�: ��=  �<  � R      �9��
�9 .ascrerr ****      � ****� o      �8�8 0 etext eText� �7��
�7 
errn� o      �6�6 0 enumber eNumber� �5��
�5 
erob� o      �4�4 0 efrom eFrom� �3��2
�3 
errt� o      �1�1 
0 eto eTo�2  � I    �0��/�0 
0 _error  � ��� m    �� ���  d e g r e e s� ��� o    �.�. 0 etext eText� ��� o    �-�- 0 enumber eNumber� 	 		  o    �,�, 0 efrom eFrom	 	�+	 o    �*�* 
0 eto eTo�+  �/  � 			 l     �)�(�'�)  �(  �'  	 			 l     �&�%�$�&  �%  �$  	 			 l     �#�"�!�#  �"  �!  	 			
		 i  P S			 I     � 	�
�  .Mth:Abs_null���     nmbr	 o      �� 0 x  �  	 Q     )				 k    		 			 r    			 c    			 o    �� 0 x  	 m    �
� 
nmbr	 o      �� 0 x  	 	�	 Z   	 		�		 A   	 			 o   	 
�� 0 x  	 m   
 ��  	 L    		 d    		 o    �� 0 x  �  	 L    	 	  o    �� 0 x  �  	 R      �	!	"
� .ascrerr ****      � ****	! o      �� 0 etext eText	" �	#	$
� 
errn	# o      �� 0 enumber eNumber	$ �	%	&
� 
erob	% o      �� 0 efrom eFrom	& �	'�
� 
errt	' o      �� 
0 eto eTo�  	 I    )�	(�
� 
0 _error  	( 	)	*	) m     !	+	+ �	,	,  a b s	* 	-	.	- o   ! "�	�	 0 etext eText	. 	/	0	/ o   " #�� 0 enumber eNumber	0 	1	2	1 o   # $�� 0 efrom eFrom	2 	3�	3 o   $ %�� 
0 eto eTo�  �
  	
 	4	5	4 l     ����  �  �  	5 	6	7	6 l     �� ���  �   ��  	7 	8	9	8 i  T W	:	;	: I     ��	<��
�� .Mth:CmpNnull���     ****	< J      	=	= 	>	?	> o      ���� 0 n1  	? 	@��	@ o      ���� 0 n2  ��  ��  	; Q     �	A	B	C	A k    �	D	D 	E	F	E Z    �	G	H��	I	G =    	J	K	J l   	L����	L I   ��	M	N
�� .corecnte****       ****	M J    	O	O 	P	Q	P o    ���� 0 n1  	Q 	R��	R o    ���� 0 n2  ��  	N ��	S��
�� 
kocl	S m    	��
�� 
long��  ��  ��  	K m    ���� 	H Z   	T	U����	T =    	V	W	V o    ���� 0 n1  	W o    ���� 0 n2  	U L    	X	X m    ����  ��  ��  ��  	I k   ! �	Y	Y 	Z	[	Z r   ! 8	\	]	\ J   ! )	^	^ 	_	`	_ c   ! $	a	b	a o   ! "���� 0 n1  	b m   " #��
�� 
doub	` 	c��	c c   $ '	d	e	d o   $ %���� 0 n2  	e m   % &��
�� 
doub��  	] J      	f	f 	g	h	g o      ���� 0 n1  	h 	i��	i o      ���� 0 n2  ��  	[ 	j	k	j Z   9 T	l	m��	n	l =   9 <	o	p	o o   9 :���� 0 n1  	p m   : ;����  	m r   ? H	q	r	q ]   ? F	s	t	s o   ? D���� 0 _isequaldelta _isEqualDelta	t o   D E���� 0 n2  	r o      ���� 0 dn  ��  	n r   K T	u	v	u ]   K R	w	x	w o   K P���� 0 _isequaldelta _isEqualDelta	x o   P Q���� 0 n1  	v o      ���� 0 dn  	k 	y	z	y r   U Y	{	|	{ d   U W	}	} o   U V���� 0 dn  	| o      ���� 0 dm  	z 	~		~ Z  Z w	�	�����	� ?   Z ]	�	�	� o   Z [���� 0 dm  	� o   [ \���� 0 dn  	� r   ` s	�	�	� J   ` d	�	� 	�	�	� o   ` a���� 0 dm  	� 	���	� o   a b���� 0 dn  ��  	� J      	�	� 	�	�	� o      ���� 0 dn  	� 	���	� o      ���� 0 dm  ��  ��  ��  	 	�	�	� r   x }	�	�	� \   x {	�	�	� o   x y���� 0 n2  	� o   y z���� 0 n1  	� o      ���� 0 d  	� 	���	� Z  ~ �	�	�����	� F   ~ �	�	�	� ?   ~ �	�	�	� o   ~ ���� 0 d  	� o    ����� 0 dm  	� A   � �	�	�	� o   � ����� 0 d  	� o   � ����� 0 dn  	� L   � �	�	� m   � �����  ��  ��  ��  	F 	���	� Z   � �	�	���	�	� A   � �	�	�	� o   � ����� 0 n1  	� o   � ����� 0 n2  	� L   � �	�	� m   � ���������  	� L   � �	�	� m   � ����� ��  	B R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  	C I   � ���	����� 
0 _error  	� 	�	�	� m   � �	�	� �	�	�  c m p	� 	�	�	� o   � ����� 0 etext eText	� 	�	�	� o   � ����� 0 enumber eNumber	� 	�	�	� o   � ����� 0 efrom eFrom	� 	���	� o   � ����� 
0 eto eTo��  ��  	9 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  X [	�	�	� I     ��	���
�� .Mth:MinNnull���     ****	� o      ���� 0 thelist theList��  	� Q     W	�	�	�	� k    E	�	� 	�	�	� h    
��	��� 0 
listobject 
listObject	� j     ��	��� 
0 _list_  	� n    	�	�	� I    ��	����� "0 aslistparameter asListParameter	� 	���	� o    
���� 0 thelist theList��  ��  	� o     ���� 0 _support  	� 	�	�	� r    	�	�	� c    	�	�	� l   	�����	� n    	�	�	� 4   ��	�
�� 
cobj	� m    ���� 	� n   	�	�	� o    ���� 
0 _list_  	� o    ���� 0 
listobject 
listObject��  ��  	� m    ��
�� 
nmbr	� o      ���� 0 	theresult 	theResult	� 	�	�	� X    B	���	�	� k   ( =	�	� 	�	�	� r   ( /	�	�	� c   ( -	�	�	� n  ( +	�	�	� 1   ) +��
�� 
pcnt	� o   ( )���� 0 aref aRef	� m   + ,��
�� 
nmbr	� o      ���� 0 x  	� 	���	� Z  0 =	�	�����	� A   0 3	�	�	� o   0 1���� 0 x  	� o   1 2���� 0 	theresult 	theResult	� r   6 9	�	�	� o   6 7���� 0 x  	� o      ���� 0 	theresult 	theResult��  ��  ��  �� 0 aref aRef	� n   	�	�	� o    ���� 
0 _list_  	� o    ���� 0 
listobject 
listObject	� 	���	� L   C E	�	� o   C D���� 0 	theresult 	theResult��  	� R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� �	�	�
� 
erob	� o      �~�~ 0 efrom eFrom	� �}	��|
�} 
errt	� o      �{�{ 
0 eto eTo�|  	� I   M W�z	��y�z 
0 _error  	� 	�	�	� m   N O	�	� �	�	�  m i n	� 	�	�	� o   O P�x�x 0 etext eText	� 
 

  o   P Q�w�w 0 enumber eNumber
 


 o   Q R�v�v 0 efrom eFrom
 
�u
 o   R S�t�t 
0 eto eTo�u  �y  	� 


 l     �s�r�q�s  �r  �q  
 


 l     �p�o�n�p  �o  �n  
 
	


	 i  \ _


 I     �m
�l
�m .Mth:MaxNnull���     ****
 o      �k�k 0 thelist theList�l  
 Q     W



 k    E

 


 h    
�j
�j 0 
listobject 
listObject
 j     �i
�i 
0 _list_  
 n    


 I    �h
�g�h "0 aslistparameter asListParameter
 
�f
 o    
�e�e 0 thelist theList�f  �g  
 o     �d�d 0 _support  
 


 r    


 c    


 l   
 �c�b
  n    
!
"
! 4   �a
#
�a 
cobj
# m    �`�` 
" n   
$
%
$ o    �_�_ 
0 _list_  
% o    �^�^ 0 
listobject 
listObject�c  �b  
 m    �]
�] 
nmbr
 o      �\�\ 0 	theresult 	theResult
 
&
'
& X    B
(�[
)
( k   ( =
*
* 
+
,
+ r   ( /
-
.
- c   ( -
/
0
/ n  ( +
1
2
1 1   ) +�Z
�Z 
pcnt
2 o   ( )�Y�Y 0 aref aRef
0 m   + ,�X
�X 
nmbr
. o      �W�W 0 x  
, 
3�V
3 Z  0 =
4
5�U�T
4 ?   0 3
6
7
6 o   0 1�S�S 0 x  
7 o   1 2�R�R 0 	theresult 	theResult
5 r   6 9
8
9
8 o   6 7�Q�Q 0 x  
9 o      �P�P 0 	theresult 	theResult�U  �T  �V  �[ 0 aref aRef
) n   
:
;
: o    �O�O 
0 _list_  
; o    �N�N 0 
listobject 
listObject
' 
<�M
< L   C E
=
= o   C D�L�L 0 	theresult 	theResult�M  
 R      �K
>
?
�K .ascrerr ****      � ****
> o      �J�J 0 etext eText
? �I
@
A
�I 
errn
@ o      �H�H 0 enumber eNumber
A �G
B
C
�G 
erob
B o      �F�F 0 efrom eFrom
C �E
D�D
�E 
errt
D o      �C�C 
0 eto eTo�D  
 I   M W�B
E�A�B 
0 _error  
E 
F
G
F m   N O
H
H �
I
I  m a x
G 
J
K
J o   O P�@�@ 0 etext eText
K 
L
M
L o   P Q�?�? 0 enumber eNumber
M 
N
O
N o   Q R�>�> 0 efrom eFrom
O 
P�=
P o   R S�<�< 
0 eto eTo�=  �A  

 
Q
R
Q l     �;�:�9�;  �:  �9  
R 
S
T
S l     �8�7�6�8  �7  �6  
T 
U
V
U i  ` c
W
X
W I     �5
Y
Z
�5 .Mth:RouNnull���     nmbr
Y o      �4�4 0 num  
Z �3
[
\
�3 
Plac
[ |�2�1
]�0
^�2  �1  
] o      �/�/ 0 decimalplaces decimalPlaces�0  
^ l     
_�.�-
_ m      �,�,  �.  �-  
\ �+
`�*
�+ 
Dire
` |�)�(
a�'
b�)  �(  
a o      �&�& &0 roundingdirection roundingDirection�'  
b l     
c�%�$
c m      �#
�# MRndRNhE�%  �$  �*  
X Q    �
d
e
f
d k   �
g
g 
h
i
h r    
j
k
j n   
l
m
l I    �"
n�!�" "0 asrealparameter asRealParameter
n 
o
p
o o    	� �  0 num  
p 
q�
q m   	 

r
r �
s
s  �  �!  
m o    �� 0 _support  
k o      �� 0 num  
i 
t
u
t r    
v
w
v n   
x
y
x I    �
z�� (0 asintegerparameter asIntegerParameter
z 
{
|
{ o    �� 0 decimalplaces decimalPlaces
| 
}�
} m    
~
~ �

  t o   p l a c e s�  �  
y o    �� 0 _support  
w o      �� 0 decimalplaces decimalPlaces
u 
�
�
� Z    8
�
���
� >    "
�
�
� o     �� 0 decimalplaces decimalPlaces
� m     !��  
� k   % 4
�
� 
�
�
� r   % *
�
�
� a   % (
�
�
� m   % &�� 

� o   & '�� 0 decimalplaces decimalPlaces
� o      �� 0 themultiplier theMultiplier
� 
��
� l  + 4
�
�
�
� r   + 4
�
�
� ^   + 2
�
�
� ]   + 0
�
�
� ]   + .
�
�
� o   + ,�� 0 num  
� m   , -�� 

� o   . /�� 0 themultiplier theMultiplier
� m   0 1�� 

� o      �
�
 0 num  
��� multiplying and dividing by 10 before and after applying the multiplier helps avoid poor rounding results for some numbers due to inevitable loss of precision in floating-point math (e.g. `324.21 * 100 div 1 / 100` returns 324.2 but needs to be 324.21), though this hasn't been tested on all possible values for obvious reasons -- TO DO: shouldn't /10 be done after rounding is applied (in which case following calculations should use mod 10, etc)?   
� �
�
��   m u l t i p l y i n g   a n d   d i v i d i n g   b y   1 0   b e f o r e   a n d   a f t e r   a p p l y i n g   t h e   m u l t i p l i e r   h e l p s   a v o i d   p o o r   r o u n d i n g   r e s u l t s   f o r   s o m e   n u m b e r s   d u e   t o   i n e v i t a b l e   l o s s   o f   p r e c i s i o n   i n   f l o a t i n g - p o i n t   m a t h   ( e . g .   ` 3 2 4 . 2 1   *   1 0 0   d i v   1   /   1 0 0 `   r e t u r n s   3 2 4 . 2   b u t   n e e d s   t o   b e   3 2 4 . 2 1 ) ,   t h o u g h   t h i s   h a s n ' t   b e e n   t e s t e d   o n   a l l   p o s s i b l e   v a l u e s   f o r   o b v i o u s   r e a s o n s   - -   T O   D O :   s h o u l d n ' t   / 1 0   b e   d o n e   a f t e r   r o u n d i n g   i s   a p p l i e d   ( i n   w h i c h   c a s e   f o l l o w i n g   c a l c u l a t i o n s   s h o u l d   u s e   m o d   1 0 ,   e t c ) ?�  �  �  
� 
�
�
� Z   9�
�
�
�
�
� =  9 <
�
�
� o   9 :�	�	 &0 roundingdirection roundingDirection
� l  : ;
���
� m   : ;�
� MRndRNhE�  �  
� Z   ? m
�
�
�
�
� E  ? K
�
�
� J   ? C
�
� 
�
�
� m   ? @
�
� ��      
� 
��
� m   @ A
�
� ?�      �  
� J   C J
�
� 
��
� `   C H
�
�
� l  C F
���
� ^   C F
�
�
� o   C D�� 0 num  
� m   D E� �  �  �  
� m   F G���� �  
� l  N S
�
�
�
� r   N S
�
�
� _   N Q
�
�
� o   N O���� 0 num  
� m   O P���� 
� o      ���� 0 num  
� T N if num ends in .5 and its div is even then round toward zero so it stays even   
� �
�
� �   i f   n u m   e n d s   i n   . 5   a n d   i t s   d i v   i s   e v e n   t h e n   r o u n d   t o w a r d   z e r o   s o   i t   s t a y s   e v e n
� 
�
�
� ?   V Y
�
�
� o   V W���� 0 num  
� m   W X����  
� 
���
� l  \ c
�
�
�
� r   \ c
�
�
� _   \ a
�
�
� l  \ _
�����
� [   \ _
�
�
� o   \ ]���� 0 num  
� m   ] ^
�
� ?�      ��  ��  
� m   _ `���� 
� o      ���� 0 num  
� H B else round to nearest whole digit (.5 will round up if positive�)   
� �
�
� �   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t   ( . 5   w i l l   r o u n d   u p   i f   p o s i t i v e & )��  
� l  f m
�
�
�
� r   f m
�
�
� _   f k
�
�
� l  f i
�����
� \   f i
�
�
� o   f g���� 0 num  
� m   g h
�
� ?�      ��  ��  
� m   i j���� 
� o      ���� 0 num  
� 4 . (�or down if negative to give an even result)   
� �
�
� \   ( & o r   d o w n   i f   n e g a t i v e   t o   g i v e   a n   e v e n   r e s u l t )
� 
�
�
� =  p s
�
�
� o   p q���� &0 roundingdirection roundingDirection
� l  q r
�����
� m   q r��
�� MRndRNhT��  ��  
� 
�
�
� Z   v �
�
�
�
�
� E  v �
�
�
� J   v z
�
� 
�
�
� m   v w
�
� ��      
� 
���
� m   w x
�
� ?�      ��  
� J   z 
�
� 
���
� `   z }
�
�
� o   z {���� 0 num  
� m   { |���� ��  
� l  � �
�
�
�
� r   � �
�
�
� _   � �
�
�
� o   � ����� 0 num  
� m   � ����� 
� o      ���� 0 num  
� 0 * if num ends in .5 then round towards zero   
� �
�
� T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r o
� 
�
�
� ?   � �
�
�
� o   � ����� 0 num  
� m   � �����  
� 
���
� l  � �
� 
� r   � � _   � � l  � ����� [   � � o   � ����� 0 num   m   � �		 ?�      ��  ��   m   � �����  o      ���� 0 num    ( " else round to nearest whole digit    �

 D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t��  
� r   � � _   � � l  � ����� \   � � o   � ����� 0 num   m   � � ?�      ��  ��   m   � �����  o      ���� 0 num  
�  =  � � o   � ����� &0 roundingdirection roundingDirection l  � ����� m   � ���
�� MRndRNhF��  ��    Z   � � E  � � J   � �   !"! m   � �## ��      " $��$ m   � �%% ?�      ��   J   � �&& '��' `   � �()( o   � ����� 0 num  ) m   � ����� ��   l  � �*+,* Z   � �-.��/- ?   � �010 o   � ����� 0 num  1 m   � �����  . r   � �232 [   � �454 _   � �676 o   � ����� 0 num  7 m   � ����� 5 m   � ����� 3 o      ���� 0 num  ��  / r   � �898 \   � �:;: _   � �<=< o   � ����� 0 num  = m   � ����� ; m   � ����� 9 o      ���� 0 num  + 0 * if num ends in .5 then round towards zero   , �>> T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r o ?@? ?   � �ABA o   � ����� 0 num  B m   � �����  @ C��C l  � �DEFD r   � �GHG _   � �IJI l  � �K����K [   � �LML o   � ����� 0 num  M m   � �NN ?�      ��  ��  J m   � ����� H o      ���� 0 num  E ( " else round to nearest whole digit   F �OO D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t��   r   � �PQP _   � �RSR l  � �T����T \   � �UVU o   � ����� 0 num  V m   � �WW ?�      ��  ��  S m   � ����� Q o      ���� 0 num   XYX =  � �Z[Z o   � ����� &0 roundingdirection roundingDirection[ l  � �\����\ m   � ���
�� MRndRN_T��  ��  Y ]^] r   � �_`_ _   � �aba o   � ����� 0 num  b m   � ����� ` o      ���� 0 num  ^ cdc =  � �efe o   � ����� &0 roundingdirection roundingDirectionf l  � �g����g m   � ���
�� MRndRN_F��  ��  d hih Z   'jklmj =   non `   pqp o   ���� 0 num  q m  ���� o m  ����  k r  rsr _  tut o  	���� 0 num  u m  	
���� s o      ���� 0 num  l vwv ?  xyx o  ���� 0 num  y m  ����  w z��z r  {|{ [  }~} _  � o  ���� 0 num  � m  ���� ~ m  ���� | o      ���� 0 num  ��  m r   '��� \   %��� _   #��� o   !���� 0 num  � m  !"���� � m  #$���� � o      ���� 0 num  i ��� = *-��� o  *+���� &0 roundingdirection roundingDirection� l +,������ m  +,��
�� MRndRN_U��  ��  � ��� l 0O���� Z  0O������ G  0=��� A  03��� o  01���� 0 num  � m  12����  � =  6;��� `  69��� o  67���� 0 num  � m  78���� � m  9:����  � r  @E��� _  @C��� o  @A���� 0 num  � m  AB���� � o      ���� 0 num  ��  � r  HO��� [  HM��� _  HK��� o  HI���� 0 num  � m  IJ���� � m  KL���� � o      ���� 0 num  �   ceil()   � ���    c e i l ( )� ��� = RW��� o  RS���� &0 roundingdirection roundingDirection� l SV������ m  SV��
�� MRndRN_D��  ��  � ���� l Zy���� Z  Zy������ G  Zg��� ?  Z]��� o  Z[���� 0 num  � m  [\����  � =  `e��� `  `c��� o  `a���� 0 num  � m  ab���� � m  cd��  � r  jo��� _  jm��� o  jk�~�~ 0 num  � m  kl�}�} � o      �|�| 0 num  ��  � r  ry��� \  rw��� _  ru��� o  rs�{�{ 0 num  � m  st�z�z � m  uv�y�y � o      �x�x 0 num  �   floor()   � ���    f l o o r ( )��  
� n |���� I  ���w��v�w >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o  ���u�u &0 roundingdirection roundingDirection� ��t� m  ���� ���  b y�t  �v  � o  |��s�s 0 _support  
� ��r� Z  ������� =  ����� o  ���q�q 0 decimalplaces decimalPlaces� m  ���p�p  � L  ���� _  ����� o  ���o�o 0 num  � m  ���n�n � ��� A  ����� o  ���m�m 0 decimalplaces decimalPlaces� m  ���l�l  � ��k� L  ���� _  ����� o  ���j�j 0 num  � o  ���i�i 0 themultiplier theMultiplier�k  � L  ���� ^  ����� o  ���h�h 0 num  � o  ���g�g 0 themultiplier theMultiplier�r  
e R      �f��
�f .ascrerr ****      � ****� o      �e�e 0 etext eText� �d��
�d 
errn� o      �c�c 0 enumber eNumber� �b��
�b 
erob� o      �a�a 0 efrom eFrom� �`��_
�` 
errt� o      �^�^ 
0 eto eTo�_  
f I  ���]��\�] 
0 _error  � ��� m  ���� ���  r o u n d   n u m b e r� ��� o  ���[�[ 0 etext eText� ��� o  ���Z�Z 0 enumber eNumber� ��� o  ���Y�Y 0 efrom eFrom� ��X� o  ���W�W 
0 eto eTo�X  �\  
V ��� l     �V�U�T�V  �U  �T  � ��� l     �S�R�Q�S  �R  �Q  � ��� l     �P���P  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� � � l     �O�O     Trigonometry    �    T r i g o n o m e t r y   l     �N�M�L�N  �M  �L    i  d g	 I      �K
�J�K 0 _sin  
 �I o      �H�H 0 x  �I  �J  	 k     �  l    	 r     	 ]      l    �G�F `      o     �E�E 0 x   m    �D�Dh�G  �F   l   �C�B ^     1    �A
�A 
pi   m    �@�@ ��C  �B   o      �?�? 0 x   &   convert from degrees to radians    � @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n s  r   
   A   
 !"! o   
 �>�> 0 x  " m    �=�=    o      �<�< 0 isneg isNeg #$# Z   %&�;�:% o    �9�9 0 isneg isNeg& r    '(' d    )) o    �8�8 0 x  ( o      �7�7 0 x  �;  �:  $ *+* r    &,-, _    $./. l   "0�6�50 ]    "121 o    �4�4 0 x  2 l   !3�3�23 ^    !454 m    �1�1 5 1     �0
�0 
pi  �3  �2  �6  �5  / m   " #�/�/ - o      �.�. 0 y  + 676 r   ' 2898 \   ' 0:;: o   ' (�-�- 0 y  ; ]   ( /<=< l  ( ->�,�+> _   ( -?@? ]   ( +ABA o   ( )�*�* 0 y  B m   ) *CC ?�      @ m   + ,�)�) �,  �+  = m   - .�(�( 9 o      �'�' 0 z  7 DED Z   3 JFG�&�%F =  3 8HIH `   3 6JKJ o   3 4�$�$ 0 z  K m   4 5�#�# I m   6 7�"�" G k   ; FLL MNM r   ; @OPO [   ; >QRQ o   ; <�!�! 0 z  R m   < =� �  P o      �� 0 z  N S�S r   A FTUT [   A DVWV o   A B�� 0 y  W m   B C�� U o      �� 0 y  �  �&  �%  E XYX r   K PZ[Z `   K N\]\ o   K L�� 0 z  ] m   L M�� [ o      �� 0 z  Y ^_^ Z   Q e`a��` ?   Q Tbcb o   Q R�� 0 z  c m   R S�� a k   W add efe r   W [ghg H   W Yii o   W X�� 0 isneg isNegh o      �� 0 isneg isNegf j�j r   \ aklk \   \ _mnm o   \ ]�� 0 z  n m   ] ^�� l o      �� 0 z  �  �  �  _ opo r   f uqrq \   f ssts l  f ou��u \   f ovwv l  f kx��
x \   f kyzy o   f g�	�	 0 x  z ]   g j{|{ o   g h�� 0 y  | m   h i}} ?�!�?��v�  �
  w ]   k n~~ o   k l�� 0 y   m   l m�� >dD,���J�  �  t ]   o r��� o   o p�� 0 y  � m   p q�� <�F���P�r o      �� 0 z2  p ��� r   v {��� ]   v y��� o   v w�� 0 z2  � o   w x�� 0 z2  � o      �� 0 zz  � ��� Z   | ������ G   | ���� =  | ��� o   | }� �  0 z  � m   } ~���� � =  � ���� o   � ����� 0 z  � m   � ����� � r   � ���� [   � ���� \   � ���� m   � ��� ?�      � ^   � ���� o   � ����� 0 zz  � m   � ����� � ]   � ���� ]   � ���� o   � ����� 0 zz  � o   � ����� 0 zz  � l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� m   � ��� ���I���� o   � ����� 0 zz  � m   � ��� >!�{N>���  ��  � o   � ����� 0 zz  � m   � ��� >�~O~�K���  ��  � o   � ����� 0 zz  � m   � ��� >���D���  ��  � o   � ����� 0 zz  � m   � ��� ?V�l�=���  ��  � o   � ����� 0 zz  � m   � ��� ?�UUUV���  ��  � o      ���� 0 y  �  � r   � ���� [   � ���� o   � ����� 0 z2  � ]   � ���� ]   � ���� o   � ����� 0 z2  � o   � ����� 0 zz  � l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� m   � ��� =���ќ�� o   � ����� 0 zz  � m   � ��� >Z��)[��  ��  � o   � ����� 0 zz  � m   � ��� >��V}H���  ��  � o   � ����� 0 zz  � m   � ��� ?*������  ��  � o   � ����� 0 zz  � m   � ��� ?�"w��  ��  � o   � ����� 0 zz  � m   � ��� ?�UUUU�?��  ��  � o      ���� 0 y  � ��� Z  � �������� o   � ����� 0 isneg isNeg� r   � ���� d   � ��� o   � ����� 0 y  � o      ���� 0 y  ��  ��  � ���� L   � ��� o   � ����� 0 y  ��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  h k��� I     �����
�� .Mth:Sin_null���     doub� o      ���� 0 x  ��  � Q     ���� L    �� I    �� ���� 0 _sin    �� c     o    ���� 0 x   m    ��
�� 
nmbr��  ��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��	
�� 
erob o      ���� 0 efrom eFrom	 ��
��
�� 
errt
 o      ���� 
0 eto eTo��  � I    ������ 
0 _error    m     �  s i n  o    ���� 0 etext eText  o    ���� 0 enumber eNumber  o    ���� 0 efrom eFrom �� o    ���� 
0 eto eTo��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    i  l o I     ����
�� .Mth:Cos_null���     doub o      ���� 0 x  ��   Q       !"  L    ## I    ��$���� 0 _sin  $ %��% [    	&'& l   (����( c    )*) o    ���� 0 x  * m    ��
�� 
nmbr��  ��  ' m    ���� Z��  ��  ! R      ��+,
�� .ascrerr ****      � ****+ o      ���� 0 etext eText, ��-.
�� 
errn- o      ���� 0 enumber eNumber. ��/0
�� 
erob/ o      ���� 0 efrom eFrom0 ��1��
�� 
errt1 o      ���� 
0 eto eTo��  " I     ��2���� 
0 _error  2 343 m    55 �66  c o s4 787 o    ���� 0 etext eText8 9:9 o    ���� 0 enumber eNumber: ;<; o    ���� 0 efrom eFrom< =��= o    ���� 
0 eto eTo��  ��   >?> l     ��������  ��  ��  ? @A@ l     ��������  ��  ��  A BCB i  p sDED I     ��F��
�� .Mth:Tan_null���     doubF o      ���� 0 x  ��  E k    GG HIH l     ��JK��  J a [ note: this starts to lose accuracy between 89.9999999 and 90�, but should be 'good enough'   K �LL �   n o t e :   t h i s   s t a r t s   t o   l o s e   a c c u r a c y   b e t w e e n   8 9 . 9 9 9 9 9 9 9   a n d   9 0 � ,   b u t   s h o u l d   b e   ' g o o d   e n o u g h 'I M��M Q    NOPN k    �QQ RSR r    TUT c    VWV o    ���� 0 x  W m    ��
�� 
nmbrU o      �� 0 x  S XYX l  	 #Z[\Z Z  	 #]^�~�}] G   	 _`_ =  	 aba o   	 
�|�| 0 x  b m   
 �{�{ Z` =   cdc o    �z�z 0 x  d m    �y�y^ R    �xef
�x .ascrerr ****      � ****e m    gg �hh F I n v a l i d   n u m b e r   ( r e s u l t   w o u l d   b e  " ) .f �wij
�w 
errni m    �v�v�sj �uk�t
�u 
erobk o    �s�s 0 x  �t  �~  �}  [ 4 . -2701 normally indicates divide-by-zero error   \ �ll \   - 2 7 0 1   n o r m a l l y   i n d i c a t e s   d i v i d e - b y - z e r o   e r r o rY mnm l  $ -opqo r   $ -rsr ]   $ +tut l  $ 'v�r�qv `   $ 'wxw o   $ %�p�p 0 x  x m   % &�o�oh�r  �q  u l  ' *y�n�my ^   ' *z{z 1   ' (�l
�l 
pi  { m   ( )�k�k ��n  �m  s o      �j�j 0 x  p &   convert from degrees to radians   q �|| @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n sn }~} r   . 3� A   . 1��� o   . /�i�i 0 x  � m   / 0�h�h  � o      �g�g 0 isneg isNeg~ ��� Z  4 @���f�e� o   4 5�d�d 0 isneg isNeg� r   8 <��� d   8 :�� o   8 9�c�c 0 x  � o      �b�b 0 x  �f  �e  � ��� r   A J��� _   A H��� l  A F��a�`� ^   A F��� o   A B�_�_ 0 x  � l  B E��^�]� ^   B E��� 1   B C�\
�\ 
pi  � m   C D�[�[ �^  �]  �a  �`  � m   F G�Z�Z � o      �Y�Y 0 y  � ��� r   K V��� \   K T��� o   K L�X�X 0 y  � ]   L S��� l  L Q��W�V� _   L Q��� ]   L O��� o   L M�U�U 0 y  � m   M N�� ?�      � m   O P�T�T �W  �V  � m   Q R�S�S � o      �R�R 0 z  � ��� Z   W n���Q�P� =  W \��� `   W Z��� o   W X�O�O 0 z  � m   X Y�N�N � m   Z [�M�M � k   _ j�� ��� r   _ d��� [   _ b��� o   _ `�L�L 0 z  � m   ` a�K�K � o      �J�J 0 z  � ��I� r   e j��� [   e h��� o   e f�H�H 0 y  � m   f g�G�G � o      �F�F 0 y  �I  �Q  �P  � ��� r   o ���� \   o ~��� l  o x��E�D� \   o x��� l  o t��C�B� \   o t��� o   o p�A�A 0 x  � ]   p s��� o   p q�@�@ 0 y  � m   q r�� ?�!�P M�C  �B  � ]   t w��� o   t u�?�? 0 y  � m   u v�� >A�`  �E  �D  � ]   x }��� o   x y�>�> 0 y  � m   y |�� <��&3\� o      �=�= 0 z2  � ��� r   � ���� ]   � ���� o   � ��<�< 0 z2  � o   � ��;�; 0 z2  � o      �:�: 0 zz  � ��� Z   � ����9�� ?   � ���� o   � ��8�8 0 zz  � m   � ��� =����+�� r   � ���� [   � ���� o   � ��7�7 0 z2  � ^   � ���� ]   � ���� ]   � ���� o   � ��6�6 0 z2  � o   � ��5�5 0 zz  � l  � ���4�3� \   � ���� ]   � ���� l  � ���2�1� [   � ���� ]   � ���� m   � ��� �ɒ��O?D� o   � ��0�0 0 zz  � m   � ��� A1������2  �1  � o   � ��/�/ 0 zz  � m   � ��� Aq��)�y�4  �3  � l  � ���.�-� \   � ���� ]   � ���� l  � ���,�+� [   � ���� ]   � ���� l  � ���*�)� \   � ���� ]   � �� � l  � ��(�' [   � � o   � ��&�& 0 zz   m   � � @ʸ��et�(  �'    o   � ��%�% 0 zz  � m   � � A4'�X*���*  �)  � o   � ��$�$ 0 zz  � m   � � Awُ�����,  �+  � o   � ��#�# 0 zz  � m   � � A���<�Z6�.  �-  � o      �"�" 0 y  �9  � r   � �	 o   � ��!�! 0 z2  	 o      � �  0 y  � 

 Z  � ��� G   � � =  � � o   � ��� 0 z   m   � ���  =  � � o   � ��� 0 z   m   � ���  r   � � ^   � � m   � ����� o   � ��� 0 y   o      �� 0 y  �  �    Z  � ��� o   � ��� 0 isneg isNeg r   � � d   � � o   � ��� 0 y   o      �� 0 y  �  �   � L   � �   o   � ��� 0 y  �  O R      �!"
� .ascrerr ****      � ****! o      �� 0 etext eText" �#$
� 
errn# o      �� 0 enumber eNumber$ �%&
� 
erob% o      �
�
 0 efrom eFrom& �	'�
�	 
errt' o      �� 
0 eto eTo�  P I   ��(�� 
0 _error  ( )*) m   � �++ �,,  t a n* -.- o   � ��� 0 etext eText. /0/ o   � ��� 0 enumber eNumber0 121 o   � ��� 0 efrom eFrom2 3�3 o   � �� �  
0 eto eTo�  �  ��  C 454 l     ��������  ��  ��  5 676 l     ��������  ��  ��  7 898 l     ��:;��  :  -----   ; �<< 
 - - - - -9 =>= l     ��?@��  ?   inverse   @ �AA    i n v e r s e> BCB l     ��������  ��  ��  C DED i  t wFGF I      ��H���� 	0 _asin  H I��I o      ���� 0 x  ��  ��  G k     �JJ KLK r     MNM A     OPO o     ���� 0 x  P m    ����  N o      ���� 0 isneg isNegL QRQ Z   ST����S o    ���� 0 isneg isNegT r   
 UVU d   
 WW o   
 ���� 0 x  V o      ���� 0 x  ��  ��  R XYX Z   %Z[����Z ?    \]\ o    ���� 0 x  ] m    ���� [ R    !��^_
�� .ascrerr ****      � ****^ m     `` �aa T I n v a l i d   n u m b e r   ( n o t   b e t w e e n   - 1 . 0   a n d   1 . 0 ) ._ ��bc
�� 
errnb m    �����Yc ��d��
�� 
erobd o    ���� 0 x  ��  ��  ��  Y efe Z   & �ghijg ?   & )klk o   & '���� 0 x  l m   ' (mm ?�      h k   , nn opo r   , 1qrq \   , /sts m   , -���� t o   - .���� 0 x  r o      ���� 0 zz  p uvu r   2 Wwxw ^   2 Uyzy ]   2 E{|{ o   2 3���� 0 zz  | l  3 D}����} [   3 D~~ ]   3 B��� l  3 @������ \   3 @��� ]   3 >��� l  3 <������ [   3 <��� ]   3 :��� l  3 8������ \   3 8��� ]   3 6��� m   3 4�� ?hOØ��� o   4 5���� 0 zz  � m   6 7�� ?��Y�,���  ��  � o   8 9���� 0 zz  � m   : ;�� @����?���  ��  � o   < =���� 0 zz  � m   > ?�� @9����"��  ��  � o   @ A���� 0 zz   m   B C�� @<�b@����  ��  z l  E T������ [   E T��� ]   E R��� l  E P������ \   E P��� ]   E N��� l  E L������ [   E L��� ]   E J��� l  E H������ \   E H��� o   E F���� 0 zz  � m   F G�� @5򢶿]R��  ��  � o   H I���� 0 zz  � m   J K�� @bb�j1��  ��  � o   L M���� 0 zz  � m   N O�� @w���c���  ��  � o   P Q���� 0 zz  � m   R S�� @ug	��D���  ��  x o      ���� 0 p  v ��� r   X _��� a   X ]��� l  X [������ [   X [��� o   X Y���� 0 zz  � o   Y Z���� 0 zz  ��  ��  � m   [ \�� ?�      � o      ���� 0 zz  � ��� r   ` i��� \   ` g��� l  ` e������ ^   ` e��� 1   ` c��
�� 
pi  � m   c d���� ��  ��  � o   e f���� 0 zz  � o      ���� 0 z  � ��� r   j s��� \   j q��� ]   j m��� o   j k���� 0 zz  � o   k l���� 0 p  � m   m p�� <��&3\
� o      ���� 0 zz  � ���� r   t ��� [   t }��� \   t w��� o   t u���� 0 z  � o   u v���� 0 zz  � l  w |������ ^   w |��� 1   w z��
�� 
pi  � m   z {���� ��  ��  � o      ���� 0 z  ��  i ��� A   � ���� o   � ����� 0 x  � m   � ��� >Ey��0�:� ���� r   � ���� o   � ����� 0 x  � o      ���� 0 z  ��  j k   � ��� ��� r   � ���� ]   � ���� o   � ����� 0 x  � o   � ����� 0 x  � o      ���� 0 zz  � ���� r   � ���� [   � ���� ]   � ���� ^   � ���� ]   � ���� o   � ����� 0 zz  � l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � � ����  \   � � ]   � � m   � � ?qk��v� o   � ����� 0 zz   m   � � ?�CA3>M���  ��  � o   � ����� 0 zz  � m   � � @�K�/��  ��  � o   � ����� 0 zz  � m   � � @0C1�'����  ��  � o   � ����� 0 zz  � m   � �		 @3��w����  ��  � o   � ����� 0 zz  � m   � �

 @ elΰ8��  ��  � l  � ����� \   � � ]   � � l  � ����� [   � � ]   � � l  � ����� \   � � ]   � � l  � ����� [   � � ]   � � l  � ����� \   � � !  o   � ����� 0 zz  ! m   � �"" @-{Y^���  ��   o   � ����� 0 zz   m   � �## @Q��%��6��  ��   o   � ����� 0 zz   m   � �$$ @be�m5v���  ��   o   � ����� 0 zz   m   � �%% @apV������  ��   o   � ����� 0 zz   m   � �&& @H�"
6���  ��  � o   � ����� 0 x  � o   � ����� 0 x  � o      ���� 0 z  ��  f '(' Z  � �)*���) o   � ��~�~ 0 isneg isNeg* r   � �+,+ d   � �-- o   � ��}�} 0 z  , o      �|�| 0 z  ��  �  ( .�{. L   � �// ^   � �010 o   � ��z�z 0 z  1 l  � �2�y�x2 ^   � �343 1   � ��w
�w 
pi  4 m   � ��v�v ��y  �x  �{  E 565 l     �u�t�s�u  �t  �s  6 787 l     �r�q�p�r  �q  �p  8 9:9 l     �o�n�m�o  �n  �m  : ;<; i  x {=>= I     �l?�k
�l .Mth:Sinanull���     doub? o      �j�j 0 x  �k  > Q     @AB@ L    CC I    �iD�h�i 	0 _asin  D E�gE c    FGF o    �f�f 0 x  G m    �e
�e 
nmbr�g  �h  A R      �dHI
�d .ascrerr ****      � ****H o      �c�c 0 etext eTextI �bJK
�b 
errnJ o      �a�a 0 enumber eNumberK �`LM
�` 
erobL o      �_�_ 0 efrom eFromM �^N�]
�^ 
errtN o      �\�\ 
0 eto eTo�]  B I    �[O�Z�[ 
0 _error  O PQP m    RR �SS  a s i nQ TUT o    �Y�Y 0 etext eTextU VWV o    �X�X 0 enumber eNumberW XYX o    �W�W 0 efrom eFromY Z�VZ o    �U�U 
0 eto eTo�V  �Z  < [\[ l     �T�S�R�T  �S  �R  \ ]^] l     �Q�P�O�Q  �P  �O  ^ _`_ i  | aba I     �Nc�M
�N .Mth:Cosanull���     doubc o      �L�L 0 x  �M  b Q      defd L    gg \    hih m    �K�K Zi l   j�J�Ij I    �Hk�G�H 	0 _asin  k l�Fl c    mnm o    �E�E 0 x  n m    �D
�D 
nmbr�F  �G  �J  �I  e R      �Cop
�C .ascrerr ****      � ****o o      �B�B 0 etext eTextp �Aqr
�A 
errnq o      �@�@ 0 enumber eNumberr �?st
�? 
erobs o      �>�> 0 efrom eFromt �=u�<
�= 
errtu o      �;�; 
0 eto eTo�<  f I     �:v�9�: 
0 _error  v wxw m    yy �zz  a c o sx {|{ o    �8�8 0 etext eText| }~} o    �7�7 0 enumber eNumber~ � o    �6�6 0 efrom eFrom� ��5� o    �4�4 
0 eto eTo�5  �9  ` ��� l     �3�2�1�3  �2  �1  � ��� l     �0�/�.�0  �/  �.  � ��� i  � ���� I     �-��,
�- .Mth:Tananull���     doub� o      �+�+ 0 x  �,  � Q     *���� k    �� ��� r    ��� c    ��� o    �*�* 0 x  � m    �)
�) 
nmbr� o      �(�( 0 x  � ��'� L   	 �� I   	 �&��%�& 	0 _asin  � ��$� ^   
 ��� o   
 �#�# 0 x  � l   ��"�!� a    ��� l   �� �� [    ��� ]    ��� o    �� 0 x  � o    �� 0 x  � m    �� �   �  � m    �� ?�      �"  �!  �$  �%  �'  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � I     *���� 
0 _error  � ��� m   ! "�� ���  a t a n� ��� o   " #�� 0 etext eText� ��� o   # $�� 0 enumber eNumber� ��� o   $ %�� 0 efrom eFrom� ��� o   % &�� 
0 eto eTo�  �  � ��� l     ��
�	�  �
  �	  � ��� l     ����  �  �  � ��� l     ����  �  -----   � ��� 
 - - - - -� ��� l     ����  �   hyperbolic   � ���    h y p e r b o l i c� ��� l     ����  �  �  � ��� i  � ���� I     � ���
�  .Mth:Sinhnull���     doub� o      ���� 0 x  ��  � Q     .���� k    �� ��� r    ��� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr� o      ���� 0 x  � ���� L   	 �� ]   	 ��� m   	 
�� ?�      � l  
 ������ \   
 ��� a   
 ��� o   
 ���� 	0 __e__  � o    ���� 0 x  � a    ��� o    ���� 	0 __e__  � d    �� o    ���� 0 x  ��  ��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   $ .������� 
0 _error  � ��� m   % &�� ��� 
 a s i n h� ��� o   & '���� 0 etext eText� ��� o   ' (���� 0 enumber eNumber� ��� o   ( )���� 0 efrom eFrom� ���� o   ) *���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Coshnull���     doub� o      ���� 0 x  ��  � Q     .� � k      r     c     o    ���� 0 x   m    ��
�� 
nmbr o      ���� 0 x   	��	 L   	 

 ]   	  m   	 
 ?�       l  
 ���� [   
  a   
  o   
 ���� 	0 __e__   o    ���� 0 x   a     o    ���� 	0 __e__   d     o    ���� 0 x  ��  ��  ��    R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   I   $ .������ 
0 _error    m   % &   �!! 
 a c o s h "#" o   & '���� 0 etext eText# $%$ o   ' (���� 0 enumber eNumber% &'& o   ( )���� 0 efrom eFrom' (��( o   ) *���� 
0 eto eTo��  ��  � )*) l     ��������  ��  ��  * +,+ l     ��������  ��  ��  , -.- i  � �/0/ I     ��1��
�� .Mth:Tanhnull���     doub1 o      ���� 0 x  ��  0 Q     =2342 k    +55 676 r    898 c    :;: o    ���� 0 x  ; m    ��
�� 
nmbr9 o      ���� 0 x  7 <��< L   	 +== ^   	 *>?> l  	 @����@ \   	 ABA a   	 CDC o   	 ���� 	0 __e__  D o    ���� 0 x  B a    EFE o    ���� 	0 __e__  F d    GG o    ���� 0 x  ��  ��  ? l   )H����H [    )IJI a     KLK o    ���� 	0 __e__  L o    ���� 0 x  J a     (MNM o     %���� 	0 __e__  N d   % 'OO o   % &���� 0 x  ��  ��  ��  3 R      ��PQ
�� .ascrerr ****      � ****P o      ���� 0 etext eTextQ ��RS
�� 
errnR o      ���� 0 enumber eNumberS ��TU
�� 
erobT o      ���� 0 efrom eFromU ��V��
�� 
errtV o      ���� 
0 eto eTo��  4 I   3 =��W���� 
0 _error  W XYX m   4 5ZZ �[[ 
 a t a n hY \]\ o   5 6���� 0 etext eText] ^_^ o   6 7���� 0 enumber eNumber_ `a` o   7 8���� 0 efrom eFroma b��b o   8 9���� 
0 eto eTo��  ��  . cdc l     ��������  ��  ��  d efe l     ��������  ��  ��  f ghg l     ��ij��  i J D--------------------------------------------------------------------   j �kk � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -h lml l     ��no��  n   Logarithms   o �pp    L o g a r i t h m sm qrq l     ��������  ��  ��  r sts i  � �uvu I      ��w���� 
0 _frexp  w x��x o      ���� 0 m  ��  ��  v k     nyy z{z Z    |}����| =    ~~ o     ���� 0 m   m    ����  } L    �� J    
�� ��� m    ��         � ���� m    ����  ��  ��  ��  { ��� r    ��� A    ��� o    ���� 0 m  � m    ����  � o      ���� 0 isneg isNeg� ��� Z   "����~� o    �}�} 0 isneg isNeg� r    ��� d    �� o    �|�| 0 m  � o      �{�{ 0 m  �  �~  � ��� r   # &��� m   # $�z�z  � o      �y�y 0 e  � ��� W   ' [��� Z   7 V���x�� @   7 :��� o   7 8�w�w 0 m  � m   8 9�v�v � k   = H�� ��� r   = B��� ^   = @��� o   = >�u�u 0 m  � m   > ?�t�t � o      �s�s 0 m  � ��r� r   C H��� [   C F��� o   C D�q�q 0 e  � m   D E�p�p � o      �o�o 0 e  �r  �x  � k   K V�� ��� r   K P��� ]   K N��� o   K L�n�n 0 m  � m   L M�m�m � o      �l�l 0 m  � ��k� r   Q V��� \   Q T��� o   Q R�j�j 0 e  � m   R S�i�i � o      �h�h 0 e  �k  � F   + 6��� @   + .��� o   + ,�g�g 0 m  � m   , -�� ?�      � A   1 4��� o   1 2�f�f 0 m  � m   2 3�e�e � ��� Z  \ h���d�c� o   \ ]�b�b 0 isneg isNeg� r   ` d��� d   ` b�� o   ` a�a�a 0 m  � o      �`�` 0 m  �d  �c  � ��_� L   i n�� J   i m�� ��� o   i j�^�^ 0 m  � ��]� o   j k�\�\ 0 e  �]  �_  t ��� l     �[�Z�Y�[  �Z  �Y  � ��� l     �X�W�V�X  �W  �V  � ��� i  � ���� I      �U��T�U 	0 _logn  � ��S� o      �R�R 0 x  �S  �T  � k    ;�� ��� Z    ���Q�P� B     ��� o     �O�O 0 x  � m    �N�N  � R    �M��
�M .ascrerr ****      � ****� m   
 �� ��� 8 I n v a l i d   n u m b e r   ( m u s t   b e   > 0 ) .� �L��K
�L 
errn� m    	�J�J�Y�K  �Q  �P  � ��� r    &��� I      �I��H�I 
0 _frexp  � ��G� o    �F�F 0 x  �G  �H  � J      �� ��� o      �E�E 0 x  � ��D� o      �C�C 0 e  �D  � ��� Z   '8���B�� G   ' 2��� A   ' *��� o   ' (�A�A 0 e  � m   ( )�@�@��� ?   - 0��� o   - .�?�? 0 e  � m   . /�>�> � k   5 ��� ��� Z   5 ^���=�� A   5 8��� o   5 6�<�< 0 x  � m   6 7�� ?栞fK�� l  ; N   k   ; N  r   ; @ \   ; >	 o   ; <�;�; 0 e  	 m   < =�:�:  o      �9�9 0 e   

 r   A F \   A D o   A B�8�8 0 x   m   B C ?�       o      �7�7 0 z   �6 r   G N [   G L ]   G J m   G H ?�       o   H I�5�5 0 z   m   J K ?�       o      �4�4 0 y  �6     (2 ^ 0.5) / 2    �    ( 2   ^   0 . 5 )   /   2�=  � k   Q ^  r   Q V \   Q T !  o   Q R�3�3 0 x  ! m   R S�2�2  o      �1�1 0 z   "�0" r   W ^#$# [   W \%&% ]   W Z'(' m   W X)) ?�      ( o   X Y�/�/ 0 x  & m   Z [** ?�      $ o      �.�. 0 y  �0  � +,+ r   _ d-.- ^   _ b/0/ o   _ `�-�- 0 z  0 o   ` a�,�, 0 y  . o      �+�+ 0 x  , 121 r   e j343 ]   e h565 o   e f�*�* 0 x  6 o   f g�)�) 0 x  4 o      �(�( 0 z  2 787 r   k �9:9 ^   k �;<; ]   k x=>= ]   k n?@? o   k l�'�' 0 x  @ o   l m�&�& 0 z  > l  n wA�%�$A \   n wBCB ]   n uDED l  n sF�#�"F [   n sGHG ]   n qIJI m   n oKK ��D=�l�J o   o p�!�! 0 z  H m   q rLL @0b�s{��#  �"  E o   s t� �  0 z  C m   u vMM @P	"*?�%  �$  < l  x �N��N \   x �OPO ]   x �QRQ l  x S��S [   x TUT ]   x }VWV l  x {X��X \   x {YZY o   x y�� 0 z  Z m   y z[[ @A�C�l��  �  W o   { |�� 0 z  U m   } ~\\ @s��*�
�  �  R o    ��� 0 z  P m   � �]] @���?;�  �  : o      �� 0 z  8 ^_^ r   � �`a` o   � ��� 0 e  a o      �� 0 y  _ b�b r   � �cdc [   � �efe [   � �ghg \   � �iji o   � ��� 0 z  j ]   � �klk o   � ��� 0 y  l m   � �mm ?+�\a�h o   � ��� 0 x  f ]   � �non o   � ��� 0 e  o m   � �pp ?�0     d o      �� 0 z  �  �B  � k   �8qq rsr Z   � �tu�vt A   � �wxw o   � ��� 0 x  x m   � �yy ?栞fK�u l  � �z{|z k   � �}} ~~ r   � ���� \   � ���� o   � ��� 0 e  � m   � ��
�
 � o      �	�	 0 e   ��� r   � ���� \   � ���� ]   � ���� m   � ��� � o   � ��� 0 x  � m   � ��� � o      �� 0 x  �  {   (2 ^ 0.5) / 2   | ���    ( 2   ^   0 . 5 )   /   2�  v r   � ���� \   � ���� o   � ��� 0 x  � m   � ��� � o      �� 0 x  s ��� r   � ���� ]   � ���� o   � �� �  0 x  � o   � ����� 0 x  � o      ���� 0 z  � ��� r   ���� ^   ���� ]   � ���� ]   � ���� o   � ����� 0 x  � o   � ����� 0 z  � l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� m   � ��� ?���� o   � ����� 0 x  � m   � ��� ?���?Vd���  ��  � o   � ����� 0 x  � m   � ��� @Һ�i���  ��  � o   � ����� 0 x  � m   � ��� @,�r�>����  ��  � o   � ����� 0 x  � m   � ��� @1�֒K�R��  ��  � o   � ����� 0 x  � m   � ��� @�c}~ݝ��  ��  � l  ������� [   ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� o   � ����� 0 x  � m   � ��� @&� �����  ��  � o   � ����� 0 x  � m   � ��� @F�,N���  ��  � o   � ����� 0 x  � m   � ��� @T�3�&����  ��  � o   � ����� 0 x  � m   � ��� @Q���^���  ��  � o   � ����� 0 x  � m   � �� @7 
�&5��  ��  � o      ���� 0 y  � ��� Z  ������� >  ��� o  ���� 0 e  � m  ����  � r  ��� \  ��� o  ���� 0 y  � ]  ��� o  ���� 0 e  � m  �� ?+�\a�� o      ���� 0 y  ��  ��  � ��� r  ��� \  ��� o  ���� 0 y  � l ������ ^  ��� o  ���� 0 z  � m  ���� ��  ��  � o      ���� 0 y  � ��� r  $��� [  "��� o   ���� 0 x  � o   !���� 0 y  � o      ���� 0 z  � ���� Z %8������� >  %(��� o  %&���� 0 e  � m  &'����  � r  +4��� [  +2��� o  +,���� 0 z  � ]  ,1   o  ,-���� 0 e   m  -0 ?�0     � o      ���� 0 z  ��  ��  ��  � �� L  9; o  9:���� 0 z  ��  �  l     ��������  ��  ��    l     ��������  ��  ��   	
	 l     ��������  ��  ��  
  i  � � I     ����
�� .Mth:Lognnull���     doub o      ���� 0 x  ��   Q      L     I    ������ 	0 _logn   �� c     o    ���� 0 x   m    ��
�� 
nmbr��  ��   R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   I    ������ 
0 _error    !  m    "" �##  l o g n! $%$ o    ���� 0 etext eText% &'& o    ���� 0 enumber eNumber' ()( o    ���� 0 efrom eFrom) *��* o    ���� 
0 eto eTo��  ��   +,+ l     ��������  ��  ��  , -.- l     ��������  ��  ��  . /0/ i  � �121 I     ��3��
�� .Mth:Lo10null���     doub3 o      ���� 0 x  ��  2 Q     $4564 l   7897 L    :: ^    ;<; ]    =>= l   ?����? ^    @A@ I    ��B���� 	0 _logn  B C��C c    DED o    ���� 0 x  E m    ��
�� 
nmbr��  ��  A m    FF @k���T���  ��  > m    GG @r�     < m    HH @r�    j8   correct for minor drift   9 �II 0   c o r r e c t   f o r   m i n o r   d r i f t5 R      ��JK
�� .ascrerr ****      � ****J o      ���� 0 etext eTextK �LM
� 
errnL o      �� 0 enumber eNumberM �NO
� 
erobN o      �� 0 efrom eFromO �P�
� 
errtP o      �� 
0 eto eTo�  6 I    $�Q�� 
0 _error  Q RSR m    TT �UU 
 l o g 1 0S VWV o    �� 0 etext eTextW XYX o    �� 0 enumber eNumberY Z[Z o    �� 0 efrom eFrom[ \�\ o     �� 
0 eto eTo�  �  0 ]^] l     ����  �  �  ^ _`_ l     �~�}�|�~  �}  �|  ` aba i  � �cdc I     �{ef
�{ .Mth:Logbnull���     doube o      �z�z 0 x  f �yg�x
�y 
Baseg o      �w�w 0 b  �x  d Q     'hijh L    kk ^    lml I    �vn�u�v 	0 _logn  n o�to c    pqp o    �s�s 0 x  q m    �r
�r 
nmbr�t  �u  m l   r�q�pr I    �os�n�o 	0 _logn  s t�mt c    uvu o    �l�l 0 b  v m    �k
�k 
nmbr�m  �n  �q  �p  i R      �jwx
�j .ascrerr ****      � ****w o      �i�i 0 etext eTextx �hyz
�h 
errny o      �g�g 0 enumber eNumberz �f{|
�f 
erob{ o      �e�e 0 efrom eFrom| �d}�c
�d 
errt} o      �b�b 
0 eto eTo�c  j I    '�a~�`�a 
0 _error  ~ � m    �� ���  l o g b� ��� o     �_�_ 0 etext eText� ��� o     !�^�^ 0 enumber eNumber� ��� o   ! "�]�] 0 efrom eFrom� ��\� o   " #�[�[ 
0 eto eTo�\  �`  b ��� l     �Z�Y�X�Z  �Y  �X  � ��W� l     �V�U�T�V  �U  �T  �W       &�S���� h r��������������������������������S  � $�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/
�R 
pimr�Q 0 _support  �P 
0 _error  �O 	0 __e__  �N 0 _isequaldelta _isEqualDelta�M (0 _asintegerproperty _asIntegerProperty�L ,0 _makenumberformatter _makeNumberFormatter�K "0 _setbasicformat _setBasicFormat�J  0 _nameforformat _nameForFormat
�I .Mth:FNumnull���     nmbr
�H .Mth:PNumnull���     ctxt
�G .Mth:NuHenull���     ****
�F .Mth:HeNunull���     ctxt
�E .Mth:DeRanull���     doub
�D .Mth:RaDenull���     doub
�C .Mth:Abs_null���     nmbr
�B .Mth:CmpNnull���     ****
�A .Mth:MinNnull���     ****
�@ .Mth:MaxNnull���     ****
�? .Mth:RouNnull���     nmbr�> 0 _sin  
�= .Mth:Sin_null���     doub
�< .Mth:Cos_null���     doub
�; .Mth:Tan_null���     doub�: 	0 _asin  
�9 .Mth:Sinanull���     doub
�8 .Mth:Cosanull���     doub
�7 .Mth:Tananull���     doub
�6 .Mth:Sinhnull���     doub
�5 .Mth:Coshnull���     doub
�4 .Mth:Tanhnull���     doub�3 
0 _frexp  �2 	0 _logn  
�1 .Mth:Lognnull���     doub
�0 .Mth:Lo10null���     doub
�/ .Mth:Logbnull���     doub� �.��. �  ��� �-��,
�- 
cobj� ��   �+ 
�+ 
frmk�,  � �*��)
�* 
cobj� ��   �(
�( 
osax�)  � ��   �' /
�' 
scpt� �& 7�%�$���#�& 
0 _error  �% �"��" �  �!� ����! 0 handlername handlerName�  0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�$  � ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  G��� � &0 throwcommanderror throwCommandError�# b  ࠡ����+ � � ������� (0 _asintegerproperty _asIntegerProperty� ��� �  ���� 0 thevalue theValue� 0 propertyname propertyName� 0 minvalue minValue�  � ����
� 0 thevalue theValue� 0 propertyname propertyName� 0 minvalue minValue�
 0 n  � 	�	������ � �
�	 
long
� 
doub
� 
bool
� 
errn��Y�  � ���
� 
errn��Y�  � 9 (��&E�O���&
 ���& )��lhY hO�W X  )��l�%�%� �  ����������  ,0 _makenumberformatter _makeNumberFormatter�� ����� �  �������� 0 formatstyle formatStyle�� 0 
localecode 
localeCode�� 0 defaultstyle defaultStyle��  � ���������������� 0 formatstyle formatStyle�� 0 
localecode 
localeCode�� 0 defaultstyle defaultStyle�� 0 asocformatter asocFormatter�� 0 formatrecord formatRecord�� 0 s  �� 0 etext eText� F��������������������������������������������+����A��Z����x��������������������������������������������������W�g�t������
�� misccura�� &0 nsnumberformatter NSNumberFormatter�� 	0 alloc  �� 0 init  
�� 
kocl
�� 
reco
�� .corecnte****       ****
�� 
pcls
�� 
MthR
�� 
MthA�� 0 requiredvalue RequiredValue
�� 
MthB
�� 
msng
�� 
MthC
�� 
MthD
�� 
MthE
�� 
MthF
�� 
MthG
�� 
MthH�� �� 60 asoptionalrecordparameter asOptionalRecordParameter�� "0 _setbasicformat _setBasicFormat�� (0 _asintegerproperty _asIntegerProperty�� 60 setminimumfractiondigits_ setMinimumFractionDigits_�� 60 setmaximumfractiondigits_ setMaximumFractionDigits_�� <0 setminimumsignificantdigits_ setMinimumSignificantDigits_�� 60 setusessignificantdigits_ setUsesSignificantDigits_�� <0 setmaximumsignificantdigits_ setMaximumSignificantDigits_
�� 
ctxt
�� 
leng
�� 
errn���Y�� ,0 setdecimalseparator_ setDecimalSeparator_��  � ���
� 
errn��\�  �� 60 setusesgroupingseparator_ setUsesGroupingSeparator_�� .0 setgroupingseparator_ setGroupingSeparator_
�� MRndRNhE�� @0 nsnumberformatterroundhalfeven NSNumberFormatterRoundHalfEven�� $0 setroundingmode_ setRoundingMode_
�� MRndRNhT�� @0 nsnumberformatterroundhalfdown NSNumberFormatterRoundHalfDown
�� MRndRNhF�� <0 nsnumberformatterroundhalfup NSNumberFormatterRoundHalfUp
�� MRndRN_T�� 80 nsnumberformatterrounddown NSNumberFormatterRoundDown
�� MRndRN_F�� 40 nsnumberformatterroundup NSNumberFormatterRoundUp
�� MRndRN_U�� >0 nsnumberformatterroundceiling NSNumberFormatterRoundCeiling
�� MRndRN_D� :0 nsnumberformatterroundfloor NSNumberFormatterRoundFloor� ���
� 
errn��Y�  � 0 etext eText
� 
enum� � .0 throwinvalidparameter throwInvalidParameter� *0 asnslocaleparameter asNSLocaleParameter� 0 
setlocale_ 
setLocale_�����,j+ j+ E�O^�kv��l k 4b  ����b  �,��������a �a �a �a a m+ E�O*���,�m+ O��,� �*��,a jm+ k+ Y hO��,� �*��,a jm+ k+ Y hO��,� �*��,a jm+ k+ O�ek+ Y hO��,� �*��,a jm+ k+  O�ek+ Y hO�a ,� G 0�a ,a !&E�O�a ",j  )a #a $lhY hO��k+ %W X & ')a #a $la (Y hO�a ,� H 1�a ,a !&E�O�a ",j  �fk+ )Y �ek+ )O��k+ *W X & ')a #a $la +Y hO�a ,� ��a ,a ,  ��a -,k+ .Y ��a ,a /  ��a 0,k+ .Y ��a ,a 1  ��a 2,k+ .Y r�a ,a 3  ��a 4,k+ .Y Y�a ,a 5  ��a 6,k+ .Y @�a ,a 7  ��a 8,k+ .Y '�a ,a 9  ��a :,k+ .Y )a #a $la ;Y hY  *���m+ W X & <)ja =W X > <b  �a ?�a @lv�a A+ BO�b  �a Cl+ Dk+ EO�� �������� "0 _setbasicformat _setBasicFormat� ��� �  ���� 0 asocformatter asocFormatter� 0 
formatname 
formatName� 0 defaultstyle defaultStyle�  � ���� 0 asocformatter asocFormatter� 0 
formatname 
formatName� 0 defaultstyle defaultStyle� �������������������������
� MthZMth0� "0 setnumberstyle_ setNumberStyle_
� MthZMth3
� misccura� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle
� MthZMth1� 40 nsnumberformatternostyle NSNumberFormatterNoStyle
� MthZMth2� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle
� MthZMth5� @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle
� MthZMth4� >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle
� MthZMth6� @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle
� 
kocl
� 
ctxt
� .corecnte****       ****� 0 
setformat_ 
setFormat_
� 
errn��Y
� 
erob
� 
errt
� 
enum� � ���  ��k+ Y ���  ���,k+ Y ���  ���,k+ Y w��  ���,k+ Y f��  ���,k+ Y U��  ���,k+ Y D��  ���,k+ Y 3�kv�a l j ��k+ Y )a a a �a a a a � �,������  0 _nameforformat _nameForFormat� ��� �  �� 0 formatstyle formatStyle�  � �� 0 formatstyle formatStyle� �9�B�K�T�]�eln
� MthZMth1
� MthZMth2
� MthZMth5
� MthZMth4
� MthZMth3
� MthZMth6� I��  �Y ?��  �Y 4��  �Y )��  �Y ��  �Y ��  �Y �%�%� ������~
� .Mth:FNumnull���     nmbr� 0 	thenumber 	theNumber� �}��
�} 
Usin� {�|�{�z�| 0 formatstyle formatStyle�{  
�z MthZMth0� �y��x
�y 
Loca� {�w�v��w 0 
localecode 
localeCode�v  �x  � �u�t�s�r�q�p�o�n�m�l�k�u 0 	thenumber 	theNumber�t 0 formatstyle formatStyle�s 0 
localecode 
localeCode�r 0 asocformatter asocFormatter�q 0 defaultstyle defaultStyle�p 0 defaultformat defaultFormat�o 0 
asocstring 
asocString�n 0 etext eText�m 0 enumber eNumber�l 0 efrom eFrom�k 
0 eto eTo� "�j�i�h���g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�"�O�N
�j 
kocl
�i 
nmbr
�h .corecnte****       ****�g �f 60 throwinvalidparametertype throwInvalidParameterType
�e MthZMth0
�d 
msng
�c 
bool
�b misccura�a &0 nsnumberformatter NSNumberFormatter�` 	0 alloc  �_ 0 init  �^ 0 nslocale NSLocale�] 0 systemlocale systemLocale�\ 0 
setlocale_ 
setLocale_
�[ 
pcls
�Z 
long�Y 40 nsnumberformatternostyle NSNumberFormatterNoStyle�X "0 setnumberstyle_ setNumberStyle_�W D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle�V ,0 _makenumberformatter _makeNumberFormatter�U &0 stringfromnumber_ stringFromNumber_
�T 
errn�S�Y
�R 
erob
�Q 
ctxt�P 0 etext eText� �M�L�
�M 
errn�L 0 enumber eNumber� �K�J�
�K 
erob�J 0 efrom eFrom� �I�H�G
�I 
errt�H 
0 eto eTo�G  �O �N 
0 _error  �~ � ��kv��l j  b  �����+ Y hO�� 	 �� �& C��,j+ j+ E�O���,j+ k+ O�a ,a   ��a ,k+ Y ��a ,k+ Y �a ,E�O*���m+ E�O��k+ E�O��  )a a a ��a Y hO�a &W X  *a ����a  + !� �F2�E�D���C
�F .Mth:PNumnull���     ctxt�E 0 thetext theText�D �B��
�B 
Usin� {�A�@�?�A 0 formatstyle formatStyle�@  
�? MthZMth0� �>��=
�> 
Loca� {�<�;>�< 0 
localecode 
localeCode�;  �=  � 
�:�9�8�7�6�5�4�3�2�1�: 0 thetext theText�9 0 formatstyle formatStyle�8 0 
localecode 
localeCode�7 0 asocformatter asocFormatter�6 0 
asocnumber 
asocNumber�5 $0 localeidentifier localeIdentifier�4 0 etext eText�3 0 enumber eNumber�2 0 efrom eFrom�1 
0 eto eTo� (�0�/�.Z_�-�,�+�*�)�(�'�&�%�$�#�"�!� ���������������������
�0 
kocl
�/ 
ctxt
�. .corecnte****       ****�- �, 60 throwinvalidparametertype throwInvalidParameterType
�+ MthZMth0
�* 
msng
�) 
bool
�( misccura�' &0 nsnumberformatter NSNumberFormatter�& 	0 alloc  �% 0 init  �$ 0 nslocale NSLocale�# 0 systemlocale systemLocale�" 0 
setlocale_ 
setLocale_�! D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle�  "0 setnumberstyle_ setNumberStyle_� ,0 _makenumberformatter _makeNumberFormatter� &0 numberfromstring_ numberFromString_� 
0 locale  � $0 localeidentifier localeIdentifier
� 
leng
� 
errn��Y
� 
erob�  0 _nameforformat _nameForFormat
� 
****� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �C � ͠kv��l j  b  �����+ Y hO�� 	 �� �& *��,j+ j+ E�O���,j+ k+ O��a ,k+ Y *��fm+ E�O��k+ E�O��  R�j+ j+ �&E�O�a ,j  
a E�Y a �%a %E�O)a a a ��a *�k+ %a  %�%a !%Y hO�a "&W X # $*a %����a &+ '� ��
�	���
� .Mth:NuHenull���     ****�
 0 	thenumber 	theNumber�	 ���
� 
Plac� {���� 0 	chunksize 	chunkSize�  �  � ���
� 
Pref� {�� ��� 0 	hasprefix 	hasPrefix�   
�� boovfals�  � ������������������������������ 0 	thenumber 	theNumber�� 0 	chunksize 	chunkSize�� 0 	hasprefix 	hasPrefix�� 0 hextext hexText�� 0 	hexprefix 	hexPrefix�� 0 padtext padText�� 0 maxsize maxSize�� 0 
resultlist 
resultList�� 0 aref aRef�� 0 oldtids oldTIDs�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� >"��1��������Q������j��o����u�����������������9>H[��_������������������������������������� (0 asintegerparameter asIntegerParameter�� (0 asbooleanparameter asBooleanParameter
�� 
kocl
�� 
list
�� .corecnte****       ****�� 00 aswholenumberparameter asWholeNumberParameter�� 
�� 
bool
�� 
long�� �� .0 throwinvalidparameter throwInvalidParameter������ 
�� 
cobj
�� 
leng�� 0 
resultlist 
resultList� �����������
�� .ascrinit****      � ****� k     	�� _����  ��  ��  � ���� 
0 _list_  � ����
�� 
cobj�� 
0 _list_  �� 
b   �-E��� 
0 _list_  
�� 
pcnt
�� 
doub
�� 
errn���\��  � ������
�� 
errn���\��  
�� 
ctxt
�� 
ascr
�� 
txdl�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ���b  ��l+ E�Ob  ��l+ E�O�kv��l j b  ��l+ E�O�j
 ���& b  �����+ Y hOa E�O�j I�j	 �a �$�& (b  �a �a a �$%a %a �$k%�+ Y hOa E�O�'E�Y Ca E�O�j	 �a �$k�& (b  �a �a a �$%a %a �$k%�+ Y hO� �a %E�Y hO &h�ja a �a #k/�%E�O�a "E�[OY��O h�a ,�a �%E�[OY��O��%Y{�k
 ���& b  �a  �a !�+ Y hOa "a �$klvE[a k/E�Z[a l/E�ZO �kh�a #%E�[OY��Oa $a %K &S�O ӧa ',[�a l kh  ;�a (,�&E�O��a (,a )&
 �j�&
 ���& )a *a +lhY hW :X , -�� b  �a .�a /a �$k%�+ Y b  �a 0�a 1�+ Oa 2E�O &h�ja 3a �a #k/�%E�O�a "E�[OY��O��%[a 4\[Z�'\Zi2�a (,F[OY�AO_ 5a 6,E�Oa 7_ 5a 6,FO� a 8�a ',%E�Y �a ',a 4&E�O�_ 5a 6,FO�W X 9 :*a ;����a <+ =� ��*�������
�� .Mth:HeNunull���     ctxt�� 0 hextext hexText�� ���
� 
Plac� {���� 0 	chunksize 	chunkSize�  �  � ���
� 
Prec� {���� 0 	isprecise 	isPrecise�  
� boovtrue�  � ������������� 0 hextext hexText� 0 	chunksize 	chunkSize� 0 	isprecise 	isPrecise� 0 	thenumber 	theNumber� 0 
isnegative 
isNegative� 0 charref charRef� 0 i  � 0 
resultlist 
resultList� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 2:;G�S���f�k��x������������������������;Er������� "0 astextparameter asTextParameter� (0 asintegerparameter asIntegerParameter� 
� 
bool
� 
long� � .0 throwinvalidparameter throwInvalidParameter� (0 asbooleanparameter asBooleanParameter
� 
ctxt
� 
kocl
� 
cobj
� .corecnte****       ****� 
� misccura
� 
psof
� 
psin
� .sysooffslong    ��� null
� 
errn��@�  � ���
� 
errn��@�  ��Y
� 
erob
� 
leng� 0 
resultlist 
resultList� �������
� .ascrinit****      � ****� k     �� ��  �  �  � �� 
0 _list_  � �� 
0 _list_  � jv�� 
0 _list_  � 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ��~�}
� 
errt�~ 
0 eto eTo�}  � � 
0 _error  �cN��Fb  ��l+ E�Ob  ��l+ E�O�j
 ���& b  �����+ Y hOb  ��l+ E�O�j  � �jE�O��E�O� �[a \[Zl\Zi2E�Y hO�a  �[a \[Zm\Zi2E�Y hO U�[a a l kh �a  E�Oa  *a �a a � UE�O�j  )a a lhY hO��kE�[OY��W X  )a a a  ��a !O�	 	��k �& )a a a  ��a "Y hO� 	�'E�Y hO�Y�a #,�#j )a a a  ��a $�%a %%Y hOa &a 'K (S�O �k�a #,E�h jE�O |�[a \[Z�\Z��k2[a a l kh �a  E�Oa  *a �a a )� UE�O�j  &)a a a  �[a \[Z�\Z��k2�a *Y hO��kE�[OY��O�	 	��k �& &)a a a  �[a \[Z�\Z��k2�a +Y hO��a ,,6F[OY�<O�a ,,EVW X - .*a /����a 0+ 1� �|��{�z���y
�| .Mth:DeRanull���     doub�{ 0 x  �z  � �x�w�v�u�t�x 0 x  �w 0 etext eText�v 0 enumber eNumber�u 0 efrom eFrom�t 
0 eto eTo� �s�r�q�p���o�n
�s 
doub
�r 
pi  �q ��p 0 etext eText� �m�l�
�m 
errn�l 0 enumber eNumber� �k�j�
�k 
erob�j 0 efrom eFrom� �i�h�g
�i 
errt�h 
0 eto eTo�g  �o �n 
0 _error  �y  ��&��! W X  *塢���+ � �f��e�d���c
�f .Mth:RaDenull���     doub�e 0 x  �d  � �b�a�`�_�^�b 0 x  �a 0 etext eText�` 0 enumber eNumber�_ 0 efrom eFrom�^ 
0 eto eTo� �]�\�[�Z���Y�X
�] 
doub
�\ 
pi  �[ ��Z 0 etext eText� �W�V�
�W 
errn�V 0 enumber eNumber� �U�T�
�U 
erob�T 0 efrom eFrom� �S�R�Q
�S 
errt�R 
0 eto eTo�Q  �Y �X 
0 _error  �c  ��&��!!W X  *塢���+ � �P	�O�N �M
�P .Mth:Abs_null���     nmbr�O 0 x  �N    �L�K�J�I�H�L 0 x  �K 0 etext eText�J 0 enumber eNumber�I 0 efrom eFrom�H 
0 eto eTo �G�F	+�E�D
�G 
nmbr�F 0 etext eText �C�B
�C 
errn�B 0 enumber eNumber �A�@
�A 
erob�@ 0 efrom eFrom �?�>�=
�? 
errt�> 
0 eto eTo�=  �E �D 
0 _error  �M * ��&E�O�j �'Y �W X  *㡢���+ � �<	;�;�:�9
�< .Mth:CmpNnull���     ****�; �8�8   �7�6�7 0 n1  �6 0 n2  �:   	�5�4�3�2�1�0�/�.�-�5 0 n1  �4 0 n2  �3 0 dn  �2 0 dm  �1 0 d  �0 0 etext eText�/ 0 enumber eNumber�. 0 efrom eFrom�- 
0 eto eTo �,�+�*�)�(�'�&	��%�$
�, 
kocl
�+ 
long
�* .corecnte****       ****
�) 
doub
�( 
cobj
�' 
bool�& 0 etext eText �#�"	
�# 
errn�" 0 enumber eNumber	 �!� 

�! 
erob�  0 efrom eFrom
 ���
� 
errt� 
0 eto eTo�  �% �$ 
0 _error  �9 � ���lv��l l  ��  jY hY s��&��&lvE[�k/E�Z[�l/E�ZO�j  b  � E�Y b  � E�O�'E�O�� ��lvE[�k/E�Z[�l/E�ZY hO��E�O��	 ���& jY hO�� iY kW X  *襦���+ 
� �	����
� .Mth:MinNnull���     ****� 0 thelist theList�   	���������� 0 thelist theList� 0 
listobject 
listObject� 0 	theresult 	theResult� 0 aref aRef� 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo �	������
�	�	���� 0 
listobject 
listObject ����
� .ascrinit****      � **** k      	���  �  �   � �  
0 _list_   ������ "0 aslistparameter asListParameter�� 
0 _list_  � b  b   k+  �� 
0 _list_  
� 
cobj
� 
nmbr
� 
kocl
�
 .corecnte****       ****
�	 
pcnt� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  � X G��K S�O��,�k/�&E�O +��,[��l kh ��,�&E�O�� �E�Y h[OY��O�W X 	 
*륦���+ � ��
������
�� .Mth:MaxNnull���     ****�� 0 thelist theList��   	�������������������� 0 thelist theList�� 0 
listobject 
listObject�� 0 	theresult 	theResult�� 0 aref aRef�� 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo ��
��������������
H������ 0 
listobject 
listObject ��������
�� .ascrinit****      � **** k      
����  ��  ��   ���� 
0 _list_   ������ "0 aslistparameter asListParameter�� 
0 _list_  �� b  b   k+  ��� 
0 _list_  
�� 
cobj
�� 
nmbr
�� 
kocl
�� .corecnte****       ****
�� 
pcnt�� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� X G��K S�O��,�k/�&E�O +��,[��l kh ��,�&E�O�� �E�Y h[OY��O�W X 	 
*륦���+ � ��
X���� ��
�� .Mth:RouNnull���     nmbr�� 0 num  �� ��!"
�� 
Plac! {�������� 0 decimalplaces decimalPlaces��  ��  " ��#��
�� 
Dire# {�������� &0 roundingdirection roundingDirection��  
�� MRndRNhE��   �������������� 0 num  �� 0 decimalplaces decimalPlaces�� &0 roundingdirection roundingDirection�� 0 themultiplier theMultiplier� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo  
r�
~���
�
�
��
����������$���� "0 asrealparameter asRealParameter� (0 asintegerparameter asIntegerParameter� 

� MRndRNhE
� MRndRNhT
� MRndRNhF
� MRndRN_T
� MRndRN_F
� MRndRN_U
� 
bool
� MRndRN_D� >0 throwinvalidconstantparameter throwInvalidConstantParameter� 0 etext eText$ ��%
� 
errn� 0 enumber eNumber% ��&
� 
erob� 0 efrom eFrom& ���
� 
errt� 
0 eto eTo�  � � 
0 _error  ����b  ��l+ E�Ob  ��l+ E�O�j �$E�O�� � �!E�Y hO��  3��lv�l!k#kv 
�k"E�Y �j ��k"E�Y 	��k"E�Y��  1��lv�k#kv 
�k"E�Y �j ��k"E�Y 	��k"E�Y ��  C��lv�k#kv �j �k"kE�Y 	�k"kE�Y �j ��k"E�Y 	��k"E�Y ���  
�k"E�Y ���  ,�k#j  
�k"E�Y �j �k"kE�Y 	�k"kE�Y a��  $�j
 	�k#j �& 
�k"E�Y 	�k"kE�Y 9�a   $�j
 	�k#j �& 
�k"E�Y 	�k"kE�Y b  �a l+ O�j  	�k"Y �j 	��"Y ��!W X  *a ����a + � �	��'(�� 0 _sin  � �)� )  �� 0 x  �  ' ������� 0 x  � 0 isneg isNeg� 0 y  � 0 z  � 0 z2  � 0 zz  ( ����C��}�����������������h
� 
pi  � �� � � 
� 
bool� ��#��! E�O�jE�O� 	�'E�Y hO���! k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��#E�O�m �E�O��E�Y hO��� �� �� E�O�� E�O�k 
 �l �& *�l!�� � �� �� �� a � a  E�Y +��� a � a � a � a � a � a  E�O� 	�'E�Y hO�� ����*+�
� .Mth:Sin_null���     doub� 0 x  �  * ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo+ ���,��
� 
nmbr� 0 _sin  � 0 etext eText, ��-
� 
errn� 0 enumber eNumber- ��.
� 
erob� 0 efrom eFrom. ���~
� 
errt� 
0 eto eTo�~  � � 
0 _error  �  *��&k+ W X  *䡢���+ � �}�|�{/0�z
�} .Mth:Cos_null���     doub�| 0 x  �{  / �y�x�w�v�u�y 0 x  �x 0 etext eText�w 0 enumber eNumber�v 0 efrom eFrom�u 
0 eto eTo0 �t�s�r�q15�p�o
�t 
nmbr�s Z�r 0 _sin  �q 0 etext eText1 �n�m2
�n 
errn�m 0 enumber eNumber2 �l�k3
�l 
erob�k 0 efrom eFrom3 �j�i�h
�j 
errt�i 
0 eto eTo�h  �p �o 
0 _error  �z ! *��&�k+ W X  *塢���+ � �gE�f�e45�d
�g .Mth:Tan_null���     doub�f 0 x  �e  4 
�c�b�a�`�_�^�]�\�[�Z�c 0 x  �b 0 isneg isNeg�a 0 y  �` 0 z  �_ 0 z2  �^ 0 zz  �] 0 etext eText�\ 0 enumber eNumber�[ 0 efrom eFrom�Z 
0 eto eTo5 �Y�X�W�V�U�T�S�Rg�Q�P�O��N��������M�L6+�K�J
�Y 
nmbr�X Z�W
�V 
bool
�U 
errn�T�s
�S 
erob�R �Qh
�P 
pi  �O ��N �M �L 0 etext eText6 �I�H7
�I 
errn�H 0 enumber eNumber7 �G�F8
�G 
erob�F 0 efrom eFrom8 �E�D�C
�E 
errt�D 
0 eto eTo�C  �K �J 
0 _error  �d ��&E�O�� 
 �� �& )�����Y hO��#��! E�O�jE�O� 	�'E�Y hO���!!k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��� �� �a  E�O�� E�O�a  4��� a � a � a  �a � a � a � a !E�Y �E�O�l 
 	�a  �& 
i�!E�Y hO� 	�'E�Y hO�W X  *a ����a + � �BG�A�@9:�?�B 	0 _asin  �A �>;�> ;  �=�= 0 x  �@  9 �<�;�:�9�8�< 0 x  �; 0 isneg isNeg�: 0 zz  �9 0 p  �8 0 z  : �7�6�5�4`m�����������3��	
"#$%&�2
�7 
errn�6�Y
�5 
erob�4 
�3 
pi  �2 ��? ��jE�O� 	�'E�Y hO�k )�����Y hO�� Xk�E�O�� �� �� �� � ��� �� �� �!E�O���$E�O_ �!�E�O�� a E�O��_ �!E�Y ]�a  �E�Y O�� E�O�a � a � a � a � a � a  �a � a � a � a � a !� �E�O� 	�'E�Y hO�_ a !!� �1>�0�/<=�.
�1 .Mth:Sinanull���     doub�0 0 x  �/  < �-�,�+�*�)�- 0 x  �, 0 etext eText�+ 0 enumber eNumber�* 0 efrom eFrom�) 
0 eto eTo= �(�'�&>R�%�$
�( 
nmbr�' 	0 _asin  �& 0 etext eText> �#�"?
�# 
errn�" 0 enumber eNumber? �!� @
�! 
erob�  0 efrom eFrom@ ���
� 
errt� 
0 eto eTo�  �% �$ 
0 _error  �.  *��&k+ W X  *䡢���+ � �b��AB�
� .Mth:Cosanull���     doub� 0 x  �  A ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToB ����Cy��� Z
� 
nmbr� 	0 _asin  � 0 etext eTextC ��D
� 
errn� 0 enumber eNumberD ��
E
� 
erob�
 0 efrom eFromE �	��
�	 
errt� 
0 eto eTo�  � � 
0 _error  � ! �*��&k+ W X  *塢���+ � ����FG�
� .Mth:Tananull���     doub� 0 x  �  F ��� ����� 0 x  � 0 etext eText�  0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToG �������H�����
�� 
nmbr�� 	0 _asin  �� 0 etext eTextH ����I
�� 
errn�� 0 enumber eNumberI ����J
�� 
erob�� 0 efrom eFromJ ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � + ��&E�O*��� k�$!k+ W X  *塢���+ � �������KL��
�� .Mth:Sinhnull���     doub�� 0 x  ��  K ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToL �����M�����
�� 
nmbr�� 0 etext eTextM ����N
�� 
errn�� 0 enumber eNumberN ����O
�� 
erob�� 0 efrom eFromO ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� / ��&E�O�b  �$b  �'$ W X  *䡢���+ � �������PQ��
�� .Mth:Coshnull���     doub�� 0 x  ��  P ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToQ ����R ����
�� 
nmbr�� 0 etext eTextR ����S
�� 
errn�� 0 enumber eNumberS ����T
�� 
erob�� 0 efrom eFromT ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� / ��&E�O�b  �$b  �'$ W X  *䡢���+ � ��0����UV��
�� .Mth:Tanhnull���     doub�� 0 x  ��  U ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToV ���WZ��
�� 
nmbr� 0 etext eTextW ��X
� 
errn� 0 enumber eNumberX ��Y
� 
erob� 0 efrom eFromY ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� > -��&E�Ob  �$b  �'$b  �$b  �'$!W X  *㡢���+ � �v��Z[�� 
0 _frexp  � �\� \  �� 0 m  �  Z ���� 0 m  � 0 isneg isNeg� 0 e  [ ���
� 
bool� o�j  
�jlvY hO�jE�O� 	�'E�Y hOjE�O 3h��	 �k�&�k �l!E�O�kE�Y �l E�O�kE�[OY��O� 	�'E�Y hO��lv� ����]^�� 	0 _logn  � �_� _  �� 0 x  �  ] ����� 0 x  � 0 e  � 0 z  � 0 y  ^ ��������KLM[\]mp�����������
� 
errn��Y� 
0 _frexp  
� 
cobj���
� 
bool�<�j )��l�Y hO*�k+ E[�k/E�Z[�l/E�ZO��
 �l�& j�� �kE�O��E�O� �E�Y �kE�O� �E�O��!E�O�� E�O�� � �� � ��� �� �!E�O�E�O��� ��a  E�Y ��� �kE�Ol� kE�Y �kE�O�� E�O�� a � a � a � a � a � a  �a � a � a � a � a !E�O�j ��� E�Y hO��l!E�O��E�O�j ��a  E�Y hO�� ���`a�
� .Mth:Lognnull���     doub� 0 x  �  ` ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToa ���b"����
� 
nmbr� 	0 _logn  � 0 etext eTextb ����c
�� 
errn�� 0 enumber eNumberc ����d
�� 
erob�� 0 efrom eFromd ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �  *��&k+ W X  *䡢���+ � ��2����ef��
�� .Mth:Lo10null���     doub�� 0 x  ��  e ��������~�� 0 x  �� 0 etext eText�� 0 enumber eNumber� 0 efrom eFrom�~ 
0 eto eTof 
�}�|FGH�{gT�z�y
�} 
nmbr�| 	0 _logn  �{ 0 etext eTextg �x�wh
�x 
errn�w 0 enumber eNumberh �v�ui
�v 
erob�u 0 efrom eFromi �t�s�r
�t 
errt�s 
0 eto eTo�r  �z �y 
0 _error  �� % *��&k+ �!� �!W X  *硢���+ 	� �qd�p�ojk�n
�q .Mth:Logbnull���     doub�p 0 x  �o �m�l�k
�m 
Base�l 0 b  �k  j �j�i�h�g�f�e�j 0 x  �i 0 b  �h 0 etext eText�g 0 enumber eNumber�f 0 efrom eFrom�e 
0 eto eTok �d�c�bl��a�`
�d 
nmbr�c 	0 _logn  �b 0 etext eTextl �_�^m
�_ 
errn�^ 0 enumber eNumberm �]�\n
�] 
erob�\ 0 efrom eFromn �[�Z�Y
�[ 
errt�Z 
0 eto eTo�Y  �a �` 
0 _error  �n ( *��&k+ *��&k+ !W X  *䢣���+  ascr  ��ޭ