FasdUAS 1.101.10   ��   ��    k             l      ��  ��    V P TestSupport -- handlers and constants used by TestLib's unit testing framework
     � 	 	 �   T e s t S u p p o r t   - -   h a n d l e r s   a n d   c o n s t a n t s   u s e d   b y   T e s t L i b ' s   u n i t   t e s t i n g   f r a m e w o r k 
   
  
 l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��     
 constants     �      c o n s t a n t s      l     ��������  ��  ��        h     �� �� 0 novalue NoValue  l     ��  ��   HB used as unique placeholder to indicate an omitted value; since it's a script object, AS will compare for identity (i.e. is it the same object instance), not merely logical equality, so it can never be confused for a user-supplied value, though with the caveat that it can't go outside the current AS instance or be passed through a `copy` command as then it will be copied and thus no longer match -- TO DO: would it be safe enough just to use `�class ���!�` (no value placeholder)? (note: omitted parameters must use `�class ���!� as default parameter values must be literals)     �  �   u s e d   a s   u n i q u e   p l a c e h o l d e r   t o   i n d i c a t e   a n   o m i t t e d   v a l u e ;   s i n c e   i t ' s   a   s c r i p t   o b j e c t ,   A S   w i l l   c o m p a r e   f o r   i d e n t i t y   ( i . e .   i s   i t   t h e   s a m e   o b j e c t   i n s t a n c e ) ,   n o t   m e r e l y   l o g i c a l   e q u a l i t y ,   s o   i t   c a n   n e v e r   b e   c o n f u s e d   f o r   a   u s e r - s u p p l i e d   v a l u e ,   t h o u g h   w i t h   t h e   c a v e a t   t h a t   i t   c a n ' t   g o   o u t s i d e   t h e   c u r r e n t   A S   i n s t a n c e   o r   b e   p a s s e d   t h r o u g h   a   ` c o p y `   c o m m a n d   a s   t h e n   i t   w i l l   b e   c o p i e d   a n d   t h u s   n o   l o n g e r   m a t c h   - -   T O   D O :   w o u l d   i t   b e   s a f e   e n o u g h   j u s t   t o   u s e   ` � c l a s s   � � � ! � `   ( n o   v a l u e   p l a c e h o l d e r ) ?   ( n o t e :   o m i t t e d   p a r a m e t e r s   m u s t   u s e   ` � c l a s s   � � � ! �   a s   d e f a u l t   p a r a m e t e r   v a l u e s   m u s t   b e   l i t e r a l s )      l     ��������  ��  ��       !   j    
�� "�� 0 _success _SUCCESS " m    	����  !  # $ # j    �� %�� 0 _failure _FAILURE % m    ����  $  & ' & j    �� (�� 0 _broken _BROKEN ( m    ����  '  ) * ) j    �� +�� 0 _skipped _SKIPPED + m    ����  *  , - , l     ��������  ��  ��   -  . / . l     �� 0 1��   0 J D--------------------------------------------------------------------    1 � 2 2 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - /  3 4 3 l     �� 5 6��   5 t n expected/unexpected errors are trapped and their parameters stored in a 'caught error' record for portability    6 � 7 7 �   e x p e c t e d / u n e x p e c t e d   e r r o r s   a r e   t r a p p e d   a n d   t h e i r   p a r a m e t e r s   s t o r e d   i n   a   ' c a u g h t   e r r o r '   r e c o r d   f o r   p o r t a b i l i t y 4  8 9 8 l     ��������  ��  ��   9  : ; : l      < = > < j    �� ?�� $0 _caughterrortype _CaughtErrorType ? m    ��
�� 
���� =2, the `class` property of error records passed to TestReport by `assert�` handlers; TestReport checks this record property to determine how to convert test data to its literal representation (unlike other records, which are converted wholesale, error info record properties are individually converted)    > � @ @X   t h e   ` c l a s s `   p r o p e r t y   o f   e r r o r   r e c o r d s   p a s s e d   t o   T e s t R e p o r t   b y   ` a s s e r t & `   h a n d l e r s ;   T e s t R e p o r t   c h e c k s   t h i s   r e c o r d   p r o p e r t y   t o   d e t e r m i n e   h o w   t o   c o n v e r t   t e s t   d a t a   t o   i t s   l i t e r a l   r e p r e s e n t a t i o n   ( u n l i k e   o t h e r   r e c o r d s ,   w h i c h   a r e   c o n v e r t e d   w h o l e s a l e ,   e r r o r   i n f o   r e c o r d   p r o p e r t i e s   a r e   i n d i v i d u a l l y   c o n v e r t e d ) ;  A B A l     ��������  ��  ��   B  C D C l     ��������  ��  ��   D  E F E i    G H G I      �� I���� .0 makecaughterrorrecord makeCaughtErrorRecord I  J K J o      ���� 0 etext eText K  L M L o      ���� 0 enumber eNumber M  N O N o      ���� 0 efrom eFrom O  P Q P o      ���� 
0 eto eTo Q  R�� R o      ���� 0 epartial ePartial��  ��   H L      S S K      T T �� U V
�� 
pcls U o    ���� $0 _caughterrortype _CaughtErrorType V �� W X�� 0 	errortext 	errorText W o    ���� 0 etext eText X �� Y Z�� 0 errornumber errorNumber Y o   	 
���� 0 enumber eNumber Z �� [ \�� 0 
errorvalue 
errorValue [ o    ���� 0 efrom eFrom \ �� ] ^�� 0 expectedtype expectedType ] o    ���� 
0 eto eTo ^ �� _���� 0 partialresult partialResult _ o    ���� 0 epartial ePartial��   F  ` a ` l     ��������  ��  ��   a  b c b l     ��������  ��  ��   c  d e d j    &�� f�� *0 _defaulterrorrecord _defaultErrorRecord f I    %�� g���� .0 makecaughterrorrecord makeCaughtErrorRecord g  h i h o    ���� 0 novalue NoValue i  j k j o    ���� 0 novalue NoValue k  l m l o    ���� 0 novalue NoValue m  n o n o     ���� 0 novalue NoValue o  p�� p o     !���� 0 novalue NoValue��  ��   e  q r q l     ��������  ��  ��   r  s t s l     ��������  ��  ��   t  u v u i  ' * w x w I      �� y���� <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord y  z�� z o      ���� 0 errorrecord errorRecord��  ��   x l    @ { | } { k     @ ~ ~   �  l     �� � ���   � � � make sure errorRecord contains at least one valid property and no invalid ones (note: this uses NoValue placeholders so isn't suitable for sending out of current AS instance)    � � � �^   m a k e   s u r e   e r r o r R e c o r d   c o n t a i n s   a t   l e a s t   o n e   v a l i d   p r o p e r t y   a n d   n o   i n v a l i d   o n e s   ( n o t e :   t h i s   u s e s   N o V a l u e   p l a c e h o l d e r s   s o   i s n ' t   s u i t a b l e   f o r   s e n d i n g   o u t   o f   c u r r e n t   A S   i n s t a n c e ) �  � � � Z     � ����� � =      � � � n     � � � 1    ��
�� 
leng � o     ���� 0 errorrecord errorRecord � m    ����   � R    �� � �
�� .ascrerr ****      � **** � m     � � � � � | I n v a l i d    i s    p a r a m e t e r   ( e r r o r   r e c o r d   c o n t a i n e d   n o   p r o p e r t i e s ) . � �� � �
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
leng � o   ! "���� $0 normalizedrecord normalizedRecord � n  $ + � � � 1   ) +��
�� 
leng � o   $ )���� *0 _defaulterrorrecord _defaultErrorRecord � R   / 9�� � �
�� .ascrerr ****      � **** � m   7 8 � � � � � � I n v a l i d    i s    p a r a m e t e r   ( e r r o r   r e c o r d   c o n t a i n e d   u n r e c o g n i z e d   p r o p e r t i e s ) . � �� � �
�� 
errn � m   1 2�����Y � �� � �
�� 
erob � o   3 4���� 0 errorrecord errorRecord � �� ���
�� 
errt � m   5 6��
�� 
reco��  ��  ��   �  ��� � L   > @ � � o   > ?���� $0 normalizedrecord normalizedRecord��   | i c ensure error info record has all the correct properties and that at least one of them is populated    } � � � �   e n s u r e   e r r o r   i n f o   r e c o r d   h a s   a l l   t h e   c o r r e c t   p r o p e r t i e s   a n d   t h a t   a t   l e a s t   o n e   o f   t h e m   i s   p o p u l a t e d v  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  + . � � � I      �� ����� 20 formatcaughterrorrecord formatCaughtErrorRecord �  � � � o      ���� 0 errorrecord errorRecord �  ��� � o      �� 0 
lineindent 
lineIndent��  ��   � k     � � �  � � � r      � � � m      � � � � �   � o      �~�~ 0 	errortext 	errorText �  � � � l   �} � ��}   �jd TO DO: while fine for user-supplied 'expected error' records this is not ideal for formatting 'unexpected/incorrect' errors trapped by `on error...` clauses as AS populates unused error params with its own default values; thus all of the following will be included regardless; need to think about how to deal with that (not that there's an ideal solution)    � � � ��   T O   D O :   w h i l e   f i n e   f o r   u s e r - s u p p l i e d   ' e x p e c t e d   e r r o r '   r e c o r d s   t h i s   i s   n o t   i d e a l   f o r   f o r m a t t i n g   ' u n e x p e c t e d / i n c o r r e c t '   e r r o r s   t r a p p e d   b y   ` o n   e r r o r . . . `   c l a u s e s   a s   A S   p o p u l a t e s   u n u s e d   e r r o r   p a r a m s   w i t h   i t s   o w n   d e f a u l t   v a l u e s ;   t h u s   a l l   o f   t h e   f o l l o w i n g   w i l l   b e   i n c l u d e d   r e g a r d l e s s ;   n e e d   t o   t h i n k   a b o u t   h o w   t o   d e a l   w i t h   t h a t   ( n o t   t h a t   t h e r e ' s   a n   i d e a l   s o l u t i o n ) �  � � � Z    � ��|�{ � >    � � � n    � � � o    �z�z 0 errornumber errorNumber � o    �y�y 0 errorrecord errorRecord � o    �x�x 0 novalue NoValue � r     � � � b     � � � b     � � � b     � � � o    �w�w 0 	errortext 	errorText � m     � � � � �  ( � n    � � � o    �v�v 0 errornumber errorNumber � o    �u�u 0 errorrecord errorRecord � m     � � � � �  )   � o      �t�t 0 	errortext 	errorText�|  �{   �  � � � Z    7 � ��s�r � >    ) � � � n    # � � � o   ! #�q�q 0 	errortext 	errorText � o     !�p�p 0 errorrecord errorRecord � o   # (�o�o 0 novalue NoValue � r   , 3 � � � b   , 1 � � � o   , -�n�n 0 	errortext 	errorText � n  - 0 � � � o   . 0�m�m 0 	errortext 	errorText � o   - .�l�l 0 errorrecord errorRecord � o      �k�k 0 	errortext 	errorText�s  �r   �  � � � Z  8 U � ��j�i � >  8 A � � � n  8 ; � � � o   9 ;�h�h 0 
errorvalue 
errorValue � o   8 9�g�g 0 errorrecord errorRecord � o   ; @�f�f 0 novalue NoValue � r   D Q � � � b   D O � � � b   D K � � � b   D I � � � b   D G � � � o   D E�e�e 0 	errortext 	errorText � 1   E F�d
�d 
lnfd � o   G H�c�c 0 
lineindent 
lineIndent � m   I J � � �                         f r o m :   � n  K N o   L N�b�b 0 
errorvalue 
errorValue o   K L�a�a 0 errorrecord errorRecord � o      �`�` 0 	errortext 	errorText�j  �i   �  Z  V s�_�^ >  V _ n  V Y	
	 o   W Y�]�] 0 expectedtype expectedType
 o   V W�\�\ 0 errorrecord errorRecord o   Y ^�[�[ 0 novalue NoValue r   b o b   b m b   b i b   b g b   b e o   b c�Z�Z 0 	errortext 	errorText 1   c d�Y
�Y 
lnfd o   e f�X�X 0 
lineindent 
lineIndent m   g h �                           t o :   n  i l o   j l�W�W 0 expectedtype expectedType o   i j�V�V 0 errorrecord errorRecord o      �U�U 0 	errortext 	errorText�_  �^    Z  t ��T�S >  t } n  t w  o   u w�R�R 0 partialresult partialResult  o   t u�Q�Q 0 errorrecord errorRecord o   w |�P�P 0 novalue NoValue r   � �!"! b   � �#$# b   � �%&% b   � �'(' b   � �)*) o   � ��O�O 0 	errortext 	errorText* 1   � ��N
�N 
lnfd( o   � ��M�M 0 
lineindent 
lineIndent& m   � �++ �,,   p a r t i a l   r e s u l t :  $ n  � �-.- o   � ��L�L 0 partialresult partialResult. o   � ��K�K 0 errorrecord errorRecord" o      �J�J 0 	errortext 	errorText�T  �S   /�I/ L   � �00 o   � ��H�H 0 	errortext 	errorText�I   � 121 l     �G�F�E�G  �F  �E  2 343 l     �D�C�B�D  �C  �B  4 565 i  / 2787 I      �A9�@�A 0 istype isType9 :;: o      �?�? 0 thevalue theValue; <�>< o      �=�= 0 typename typeName�>  �@  8 L     == >     >?> l    	@�<�;@ I    	�:AB
�: .corecnte****       ****A J     CC D�9D o     �8�8 0 thevalue theValue�9  B �7E�6
�7 
koclE o    �5�5 0 typename typeName�6  �<  �;  ? m   	 
�4�4  6 FGF l     �3�2�1�3  �2  �1  G HIH l     �0�/�.�0  �/  �.  I JKJ l     �-LM�-  L J D--------------------------------------------------------------------   M �NN � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -K OPO l     �,QR�,  Q "  `assert test error` support   R �SS 8   ` a s s e r t   t e s t   e r r o r `   s u p p o r tP TUT l     �+�*�)�+  �*  �)  U VWV i  3 6XYX I      �(Z�'�( (0 sanitizeidentifier sanitizeIdentifierZ [�&[ o      �%�% 0 aname aName�&  �'  Y P     s\]^\ k    r__ `a` Z   bc�$�#b =   ded o    �"�" 0 aname aNamee m    ff �gg  c L    hh m    ii �jj  | |�$  �#  a klk r    mnm m    oo �pp  n o      �!�! 0 res  l qrq r    sts m    uu �vv 6 a b c d e f g h i j k l m n o p q r s t u v w x y z _t o      � �  0 
legalchars 
legalCharsr wxw r    yzy m    �
� boovfalsz o      �� 0 usepipes usePipesx {|{ X    _}�~} k   . Z ��� Z   . P����� H   . 4�� E  . 3��� o   . /�� 0 
legalchars 
legalChars� n  / 2��� 1   0 2�
� 
pcnt� o   / 0�� 0 charref charRef� k   7 L�� ��� r   7 :��� m   7 8�
� boovtrue� o      �� 0 usepipes usePipes� ��� Z  ; L����� E  ; @��� m   ; <�� ���  \ |� n  < ?��� 1   = ?�
� 
pcnt� o   < =�� 0 charref charRef� r   C H��� b   C F��� m   C D�� ���  \� o   D E�� 0 charref charRef� o      �� 0 charref charRef�  �  �  �  �  � ��� r   Q V��� b   Q T��� o   Q R�� 0 res  � o   R S�� 0 charref charRef� o      �� 0 res  � ��� r   W Z��� m   W X�� ��� J a b c d e f g h i j k l m n o p q r s t u v w x y z _ 1 2 3 4 5 6 7 8 9 0� o      �
�
 0 
legalchars 
legalChars�  � 0 charref charRef~ o   ! "�	�	 0 aname aName| ��� Z  ` o����� o   ` a�� 0 usepipes usePipes� r   d k��� b   d i��� b   d g��� m   d e�� ���  |� o   e f�� 0 res  � m   g h�� ���  |� o      �� 0 res  �  �  � ��� L   p r�� o   p q�� 0 res  �  ] ��
� consdiac� � �
�  conshyph� ���
�� conspunc� ����
�� conswhit��  ^ ���
�� conscase� ����
�� consnume��  W ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  7 :��� I      �������  0 makecallobject makeCallObject� ��� o      ���� 0 handlername handlerName� ���� o      ����  0 parametercount parameterCount��  ��  � k     ]�� ��� r     ��� m     �� ���  � o      ���� 0 args  � ��� Z    >������ =    ��� o    ����  0 parametercount parameterCount� m    ���� � r   
 ��� m   
 �� ���  p a r a m e t e r O b j e c t� o      ���� 0 args  � ��� ?    ��� o    ����  0 parametercount parameterCount� m    ���� � ���� k    :�� ��� Y    ,�������� r     '��� b     %��� b     #��� o     !���� 0 args  � m   ! "�� ��� 2 ,   p a r a m e t e r O b j e c t ' s   i t e m  � o   # $���� 0 i  � o      ���� 0 args  �� 0 i  � m    ���� � o    ����  0 parametercount parameterCount��  � ���� r   - :��� n   - 8��� 7  . 8����
�� 
ctxt� m   2 4���� � m   5 7������� o   - .���� 0 args  � o      ���� 0 args  ��  ��  ��  � ���� L   ? ]�� I  ? \�����
�� .sysodsct****        scpt� b   ? X��� b   ? V��� b   ? T��� b   ? R��� b   ? K� � b   ? I m   ? @ � 0 o n   r u n 
 	 	 	 	 	 	 	 	 	 	 s c r i p t   I   @ H������ (0 sanitizeidentifier sanitizeIdentifier �� b   A D m   A B		 �

  C a l l O b j e c t _ o   B C���� 0 handlername handlerName��  ��    m   I J � � 
 	 	 	 	 	 	 	 	 	 	 	 o n   d o T e s t ( s u i t e O b j e c t ,   p a r a m e t e r O b j e c t ) 
 	 	 	 	 	 	 	 	 	 	 	 	 r e t u r n   s u i t e O b j e c t ' s  � I   K Q������ (0 sanitizeidentifier sanitizeIdentifier �� o   L M���� 0 handlername handlerName��  ��  � m   R S �  (� o   T U���� 0 args  � m   V W � t ) 
 	 	 	 	 	 	 	 	 	 	 	 e n d   r u n 
 	 	 	 	 	 	 	 	 	 	 e n d   s c r i p t 
 	 	 	 	 	 	 	 	 	 e n d   r u n��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    l     ����   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����     report generation    �   $   r e p o r t   g e n e r a t i o n !"! l     ��������  ��  ��  " #$# i  ; >%&% I      ��'���� 0 replacetext replaceText' ()( o      ���� 0 thetext theText) *+* o      ���� 0 findtext findText+ ,��, o      ���� 0 replacetext replaceText��  ��  & k     -- ./. r     010 o     ���� 0 findtext findText1 n     232 1    ��
�� 
txdl3 1    ��
�� 
ascr/ 454 r    676 n    	898 2   	��
�� 
citm9 o    ���� 0 thetext theText7 o      ���� 0 	textitems 	textItems5 :;: r    <=< o    ���� 0 replacetext replaceText= n     >?> 1    ��
�� 
txdl? 1    ��
�� 
ascr; @��@ L    AA c    BCB o    ���� 0 thetext theTextC m    ��
�� 
ctxt��  $ DED l     ��������  ��  ��  E FGF l     ��������  ��  ��  G HIH i  ? BJKJ I      ��L���� $0 formatinvisibles formatInvisiblesL MNM o      ���� 0 thetext theTextN O��O o      ���� 0 linewrap lineWrap��  ��  K l    PQRP k     SS TUT l     ��VW��  V1+ TO DO: what about other invisibles? (problem: AS syntax doesn't provide escape sequences for control chars and other invisibles, so would need to use fake escapes, e.g. `\(0x00)`, `\(CODEPOINT)`; one possibility would be to extend `format text` to take `$(CODEPOINT)` escapes, then use that syntax)   W �XXV   T O   D O :   w h a t   a b o u t   o t h e r   i n v i s i b l e s ?   ( p r o b l e m :   A S   s y n t a x   d o e s n ' t   p r o v i d e   e s c a p e   s e q u e n c e s   f o r   c o n t r o l   c h a r s   a n d   o t h e r   i n v i s i b l e s ,   s o   w o u l d   n e e d   t o   u s e   f a k e   e s c a p e s ,   e . g .   ` \ ( 0 x 0 0 ) ` ,   ` \ ( C O D E P O I N T ) ` ;   o n e   p o s s i b i l i t y   w o u l d   b e   t o   e x t e n d   ` f o r m a t   t e x t `   t o   t a k e   ` $ ( C O D E P O I N T ) `   e s c a p e s ,   t h e n   u s e   t h a t   s y n t a x )U Y��Y L     ZZ I     ��[���� 0 replacetext replaceText[ \]\ I    ��^���� 0 replacetext replaceText^ _`_ I    
��a���� 0 replacetext replaceTexta bcb o    ���� 0 thetext theTextc ded 1    ��
�� 
tab e f��f m    gg �hh  \ t��  ��  ` iji 1   
 ��
�� 
lnfdj k��k b    lml m    nn �oo  \ nm o    ���� 0 linewrap lineWrap��  ��  ] pqp o    ��
�� 
ret q r��r b    sts m    uu �vv  \ rt o    ���� 0 linewrap lineWrap��  ��  ��  Q %  linewrap = linefeed + N spaces   R �ww >   l i n e w r a p   =   l i n e f e e d   +   N   s p a c e sI xyx l     ��������  ��  ��  y z{z l     ��������  ��  ��  { |}| i  C F~~ I      ������� 0 linewrap lineWrap� ��� o      ���� 0 thetext theText� ���� o      ���� 0 towidth toWidth��  ��   l    ���� L     �� o     ���� 0 thetext theText� � � TO DO: implement; this should wrap on whole words, where practical (to keep it simple, theText should avoid using VT100 sequences, otherwise those will have to be detected and ignored when counting number of characters in line)   � ����   T O   D O :   i m p l e m e n t ;   t h i s   s h o u l d   w r a p   o n   w h o l e   w o r d s ,   w h e r e   p r a c t i c a l   ( t o   k e e p   i t   s i m p l e ,   t h e T e x t   s h o u l d   a v o i d   u s i n g   V T 1 0 0   s e q u e n c e s ,   o t h e r w i s e   t h o s e   w i l l   h a v e   t o   b e   d e t e c t e d   a n d   i g n o r e d   w h e n   c o u n t i n g   n u m b e r   o f   c h a r a c t e r s   i n   l i n e )} ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  G J��� I      ������� 0 vt100 VT100� ���� o      �� 0 
formatcode 
formatCode��  ��  � k     �� ��� l      �~���~  �F@ Returns a magic character sequence that will apply the specified formatting or other control operation in Terminal.app and other VT100 terminal emulators. Multiple codes may be given as semicolon-separated numeric text, e.g. "1;7". Commonly used style codes are:
	
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
	   � ����   R e t u r n s   a   m a g i c   c h a r a c t e r   s e q u e n c e   t h a t   w i l l   a p p l y   t h e   s p e c i f i e d   f o r m a t t i n g   o r   o t h e r   c o n t r o l   o p e r a t i o n   i n   T e r m i n a l . a p p   a n d   o t h e r   V T 1 0 0   t e r m i n a l   e m u l a t o r s .   M u l t i p l e   c o d e s   m a y   b e   g i v e n   a s   s e m i c o l o n - s e p a r a t e d   n u m e r i c   t e x t ,   e . g .   " 1 ; 7 " .   C o m m o n l y   u s e d   s t y l e   c o d e s   a r e : 
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
 	� ��}� L     �� b     ��� b     	��� b     ��� l    ��|�{� 5     �z��y
�z 
cha � m    �x�x 
�y kfrmID  �|  �{  � m    �� ���  [� o    �w�w 0 
formatcode 
formatCode� m   	 
�� ���  m�}  � ��� l     �v�u�t�v  �u  �t  � ��� l     �s�r�q�s  �r  �q  � ��� l     �p���p  �  -----   � ��� 
 - - - - -� ��� l     �o�n�m�o  �n  �m  � ��� i  K N��� I      �l��k�l  0 maketestreport makeTestReport� ��� o      �j�j 0 testsuitename testSuiteName� ��� o      �i�i "0 testhandlername testHandlerName� ��h� o      �g�g 0 terminalwidth terminalWidth�h  �k  � k     w�� ��� l    ���� r     ��� J     �� ��� m     �� ���         � ��f� m    �� ���             �f  � J      �� ��� o      �e�e 0 indent1  � ��d� o      �c�c 0 indent2  �d  � l f indent to bullet, indent to wrapped bulleted lines; TO DO: ideally pass initial indent from `osatest`   � ��� �   i n d e n t   t o   b u l l e t ,   i n d e n t   t o   w r a p p e d   b u l l e t e d   l i n e s ;   T O   D O :   i d e a l l y   p a s s   i n i t i a l   i n d e n t   f r o m   ` o s a t e s t `� ��� Z    k���b�� =    ��� o    �a�a 0 terminalwidth terminalWidth� m    �`�`��� k    .�� ��� r    *��� K    (�� �_���_ 0 n  � m    �� ���  � �^���^ 0 b  � m    �� ���  � �]���] 0 u  � m     �� ���  � �\���\ 0 r  � m   ! "�� ���  � �[���[ 0 g  � m   # $�� ���  � �Z��Y�Z 0 e  � m   % &�� ���  �Y  � o      �X�X 0 vtstyle vtStyle� ��W� r   + .��� m   + ,�V
�V boovfals� o      �U�U 0 uselinewrap useLineWrap�W  �b  � k   1 k�� ��� r   1 g��� K   1 e�� �T���T 0 n  � I   2 8�S �R�S 0 vt100 VT100  �Q m   3 4�P�P  �Q  �R  � �O�O 0 b   I   9 ?�N�M�N 0 vt100 VT100 �L m   : ;�K�K �L  �M   �J�J 0 u   I   @ H�I�H�I 0 vt100 VT100 	�G	 m   A D�F�F �G  �H   �E
�E 0 r  
 I   I Q�D�C�D 0 vt100 VT100 �B m   J M �  1 ; 3 1�B  �C   �A�A 0 g   I   R Z�@�?�@ 0 vt100 VT100 �> m   S V �  1 ; 3 2�>  �?   �=�<�= 0 e   I   [ c�;�:�; 0 vt100 VT100 �9 m   \ _ �  1 ; 3 4�9  �:  �<  � o      �8�8 0 vtstyle vtStyle� �7 r   h k m   h i�6
�6 boovtrue o      �5�5 0 uselinewrap useLineWrap�7  � �4 h   l w�3�3 0 
testreport 
TestReport k         !"! l     �2�1�0�2  �1  �0  " #$# l     %&'% j     �/(�/ 0 _testresults _testResults( J     �.�.  & c ] a single test_NAME handler may perform multiple asserts, the result of each is recorded here   ' �)) �   a   s i n g l e   t e s t _ N A M E   h a n d l e r   m a y   p e r f o r m   m u l t i p l e   a s s e r t s ,   t h e   r e s u l t   o f   e a c h   i s   r e c o r d e d   h e r e$ *+* l     �-�,�+�-  �,  �+  + ,-, i   ./. I      �*0�)�* 0 
_addreport 
_addReport0 121 o      �(�( 0 outcometype outcomeType2 343 o      �'�' 0 fromhandler fromHandler4 565 o      �&�&  0 problemsummary problemSummary6 787 o      �%�% 0 usernote userNote8 9�$9 o      �#�# 0 testdata testData�$  �)  / l    :;<: k     == >?> l     �"@A�"  @ ] W outcomeType indicates if test_NAME succeeded, failed, or aborted due to defective test   A �BB �   o u t c o m e T y p e   i n d i c a t e s   i f   t e s t _ N A M E   s u c c e e d e d ,   f a i l e d ,   o r   a b o r t e d   d u e   t o   d e f e c t i v e   t e s t? CDC l     �!EF�!  E W Q userNote is any additional info passed by `assert�` for inclusion in test report   F �GG �   u s e r N o t e   i s   a n y   a d d i t i o n a l   i n f o   p a s s e d   b y   ` a s s e r t & `   f o r   i n c l u s i o n   i n   t e s t   r e p o r tD HIH l     � JK�   J � � testData is record of form {expectedResult:�, expectedError:�, actualResult:�, actualError:�}, unused properties should be omitted -- TO DO: make this a key-value list (easier to read, reformat, and render)   K �LL�   t e s t D a t a   i s   r e c o r d   o f   f o r m   { e x p e c t e d R e s u l t : & ,   e x p e c t e d E r r o r : & ,   a c t u a l R e s u l t : & ,   a c t u a l E r r o r : & } ,   u n u s e d   p r o p e r t i e s   s h o u l d   b e   o m i t t e d   - -   T O   D O :   m a k e   t h i s   a   k e y - v a l u e   l i s t   ( e a s i e r   t o   r e a d ,   r e f o r m a t ,   a n d   r e n d e r )I MNM r     OPO K     QQ �RS� 0 outcometype outcomeTypeR o    �� 0 outcometype outcomeTypeS �TU� 0 fromhandler fromHandlerT o    �� 0 fromhandler fromHandlerU �VW�  0 problemsummary problemSummaryV o    ��  0 problemsummary problemSummaryW �XY� 0 usernote userNoteX o    �� 0 usernote userNoteY �Z�� 0 testdata testDataZ o   	 
�� 0 testdata testData�  P n      [\[  ;    \ o    �� 0 _testresults _testResultsN ]�] l   �^_�  ^  log result -- DEBUG   _ �`` & l o g   r e s u l t   - -   D E B U G�  ; � � TO DO: include param for indicating cause (`assert test result` received wrong result, `assert test error` received wrong/no error, unexpected error in `test_NAME` handler, etc)   < �aad   T O   D O :   i n c l u d e   p a r a m   f o r   i n d i c a t i n g   c a u s e   ( ` a s s e r t   t e s t   r e s u l t `   r e c e i v e d   w r o n g   r e s u l t ,   ` a s s e r t   t e s t   e r r o r `   r e c e i v e d   w r o n g / n o   e r r o r ,   u n e x p e c t e d   e r r o r   i n   ` t e s t _ N A M E `   h a n d l e r ,   e t c )- bcb l     ����  �  �  c ded l     ����  �  �  e fgf l     ��
�	�  �
  �	  g hih i   jkj I      �l�� 0 
addsuccess 
addSuccessl mnm o      �� 0 fromhandler fromHandlern opo o      �� 0 usernote userNotep q�q o      �� 0 testdata testData�  �  k I     �r�� 0 
_addreport 
_addReportr sts o    � �  0 _success _SUCCESSt uvu o    ���� 0 fromhandler fromHandlerv wxw m    yy �zz  x {|{ o    	���� 0 usernote userNote| }��} o   	 
���� 0 testdata testData��  �  i ~~ l     ��������  ��  ��   ��� i   ��� I      ������� 0 
addfailure 
addFailure� ��� o      ���� 0 fromhandler fromHandler� ��� o      ����  0 problemsummary problemSummary� ��� o      ���� 0 usernote userNote� ���� o      ���� 0 testdata testData��  ��  � I     ������� 0 
_addreport 
_addReport� ��� o    ���� 0 _failure _FAILURE� ��� o    ���� 0 fromhandler fromHandler� ��� o    ����  0 problemsummary problemSummary� ��� o    	���� 0 usernote userNote� ���� o   	 
���� 0 testdata testData��  ��  � ��� l     ��������  ��  ��  � ��� i   ��� I      ������� 0 	addbroken 	addBroken� ��� o      ���� 0 fromhandler fromHandler� ��� o      ����  0 problemsummary problemSummary� ��� o      ���� 0 usernote userNote� ���� o      ���� 0 testdata testData��  ��  � I     ������� 0 
_addreport 
_addReport� ��� o    ���� 0 _broken _BROKEN� ��� o    ���� 0 fromhandler fromHandler� ��� o    ����  0 problemsummary problemSummary� ��� o    	���� 0 usernote userNote� ���� o   	 
���� 0 testdata testData��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  ��� note: Converting AS objects to their literal representations requires some hoop-jumping: it's impractical for `perform unit test` to format test results on the fly as `osatest` doesn't have an event loop so sending itself AEs while the script is executing might be a tad fiddly. Instead, TestReport just captures everything in its _testResults property and is returned by `perform unit test` on completion (ensuring the captured data stays inside an AS context, so that e.g. application references don't lose their target application as happens when they're packed into an AE as a naked typeObjectSpecifier descriptor). `osaglue` must then repeatedly call the nextRawData() iterator via OSAExecuteEvent, which loads the result value directly into a new scriptValueID; that value's literal representation can then be retrieved via OSADisplay and the resulting text passed back to TestReport's updateRawData(), which reinserts it into the original _testResults data. Once the iterator is exhausted, `osatest` can then call TestReport's renderReport() to assemble all that information (which is now all concatenatable text values) into the final report text, which `osatext` can then print to stdout before doing the whole exercise all over again for the next test handler.   � ���	�   n o t e :   C o n v e r t i n g   A S   o b j e c t s   t o   t h e i r   l i t e r a l   r e p r e s e n t a t i o n s   r e q u i r e s   s o m e   h o o p - j u m p i n g :   i t ' s   i m p r a c t i c a l   f o r   ` p e r f o r m   u n i t   t e s t `   t o   f o r m a t   t e s t   r e s u l t s   o n   t h e   f l y   a s   ` o s a t e s t `   d o e s n ' t   h a v e   a n   e v e n t   l o o p   s o   s e n d i n g   i t s e l f   A E s   w h i l e   t h e   s c r i p t   i s   e x e c u t i n g   m i g h t   b e   a   t a d   f i d d l y .   I n s t e a d ,   T e s t R e p o r t   j u s t   c a p t u r e s   e v e r y t h i n g   i n   i t s   _ t e s t R e s u l t s   p r o p e r t y   a n d   i s   r e t u r n e d   b y   ` p e r f o r m   u n i t   t e s t `   o n   c o m p l e t i o n   ( e n s u r i n g   t h e   c a p t u r e d   d a t a   s t a y s   i n s i d e   a n   A S   c o n t e x t ,   s o   t h a t   e . g .   a p p l i c a t i o n   r e f e r e n c e s   d o n ' t   l o s e   t h e i r   t a r g e t   a p p l i c a t i o n   a s   h a p p e n s   w h e n   t h e y ' r e   p a c k e d   i n t o   a n   A E   a s   a   n a k e d   t y p e O b j e c t S p e c i f i e r   d e s c r i p t o r ) .   ` o s a g l u e `   m u s t   t h e n   r e p e a t e d l y   c a l l   t h e   n e x t R a w D a t a ( )   i t e r a t o r   v i a   O S A E x e c u t e E v e n t ,   w h i c h   l o a d s   t h e   r e s u l t   v a l u e   d i r e c t l y   i n t o   a   n e w   s c r i p t V a l u e I D ;   t h a t   v a l u e ' s   l i t e r a l   r e p r e s e n t a t i o n   c a n   t h e n   b e   r e t r i e v e d   v i a   O S A D i s p l a y   a n d   t h e   r e s u l t i n g   t e x t   p a s s e d   b a c k   t o   T e s t R e p o r t ' s   u p d a t e R a w D a t a ( ) ,   w h i c h   r e i n s e r t s   i t   i n t o   t h e   o r i g i n a l   _ t e s t R e s u l t s   d a t a .   O n c e   t h e   i t e r a t o r   i s   e x h a u s t e d ,   ` o s a t e s t `   c a n   t h e n   c a l l   T e s t R e p o r t ' s   r e n d e r R e p o r t ( )   t o   a s s e m b l e   a l l   t h a t   i n f o r m a t i o n   ( w h i c h   i s   n o w   a l l   c o n c a t e n a t a b l e   t e x t   v a l u e s )   i n t o   t h e   f i n a l   r e p o r t   t e x t ,   w h i c h   ` o s a t e x t `   c a n   t h e n   p r i n t   t o   s t d o u t   b e f o r e   d o i n g   t h e   w h o l e   e x e r c i s e   a l l   o v e r   a g a i n   f o r   t h e   n e x t   t e s t   h a n d l e r .� ��� l     ��������  ��  ��  � ��� l     ������  � � {{class:error info record, errorText:eText, errorNumber:eNumber, errorValue:eFrom, expectedType:eTo, partialResult:ePartial}   � ��� � { c l a s s : e r r o r   i n f o   r e c o r d ,   e r r o r T e x t : e T e x t ,   e r r o r N u m b e r : e N u m b e r ,   e r r o r V a l u e : e F r o m ,   e x p e c t e d T y p e : e T o ,   p a r t i a l R e s u l t : e P a r t i a l }� ��� j    ����� $0 _errorrecordrefs _errorRecordRefs� J    ����  � ��� j    ����� 0 
_dataindex 
_dataIndex� m    ���� � ��� j    ����� 0 _datasubindex _dataSubIndex� m    ���� � ��� l     ��������  ��  ��  � ��� i   !��� I      �������� 0 nextrawdata  ��  ��  � l   ���� k    �� ��� l     ������  � g a note: while most of these values can be dealt with natively, for now just toss them to formatter   � ��� �   n o t e :   w h i l e   m o s t   o f   t h e s e   v a l u e s   c a n   b e   d e a l t   w i t h   n a t i v e l y ,   f o r   n o w   j u s t   t o s s   t h e m   t o   f o r m a t t e r� ��� l     ������  � D > TO DO: need to see what happens when ocids/optrs are returned   � ��� |   T O   D O :   n e e d   t o   s e e   w h a t   h a p p e n s   w h e n   o c i d s / o p t r s   a r e   r e t u r n e d� ��� Z    ������� B     ��� o     ���� 0 
_dataindex 
_dataIndex� n   ��� 1   
 ��
�� 
leng� o    
���� 0 _testresults _testResults� k   �� ��� l   ������  � 4 . currently working way through an error record   � ��� \   c u r r e n t l y   w o r k i n g   w a y   t h r o u g h   a n   e r r o r   r e c o r d� ��� Z    n������� >   ��� o    ���� $0 _errorrecordrefs _errorRecordRefs� J    ����  � k    j�� ��� r    '��� n    %��� 1   # %��
�� 
pcnt� n    #��� 4    #���
�� 
cobj� m   ! "���� � o     ���� $0 _errorrecordrefs _errorRecordRefs� o      ���� 0 	erroritem 	errorItem� ��� Z   ( g������� =  ( /   o   ( )���� 0 	erroritem 	errorItem o   ) .���� 0 novalue NoValue� k   2 c  r   2 ? n   2 9 1   7 9��
�� 
rest o   2 7���� $0 _errorrecordrefs _errorRecordRefs o      ���� $0 _errorrecordrefs _errorRecordRefs 	
	 Z  @ \���� =  @ H o   @ E���� $0 _errorrecordrefs _errorRecordRefs J   E G����   r   K X [   K R o   K P���� 0 _datasubindex _dataSubIndex m   P Q����  o      ���� 0 _datasubindex _dataSubIndex��  ��  
 �� L   ] c I   ] b�������� 0 nextrawdata  ��  ��  ��  ��  ��  � �� L   h j o   h i���� 0 	erroritem 	errorItem��  ��  ��  �  r   o  n   o } o   { }���� 0 testdata testData n   o { 4   t {��
�� 
cobj o   u z���� 0 
_dataindex 
_dataIndex o   o t���� 0 _testresults _testResults o      ���� 0 datalist dataList  ��  Z   �!"��#! B   � �$%$ o   � ����� 0 _datasubindex _dataSubIndex% n  � �&'& 1   � ���
�� 
leng' o   � ����� 0 datalist dataList" k   � �(( )*) l  � ���+,��  + 4 .	log {"NEXT:", item _dataSubIndex of dataList}   , �-- \ 	 l o g   { " N E X T : " ,   i t e m   _ d a t a S u b I n d e x   o f   d a t a L i s t }* ./. r   � �010 n   � �232 4   � ���4
�� 
cobj4 m   � ����� 3 n   � �565 4   � ���7
�� 
cobj7 o   � ����� 0 _datasubindex _dataSubIndex6 o   � ����� 0 datalist dataList1 o      ���� 0 thedata theData/ 898 Z   � �:;����: F   � �<=< I   � ���>���� 0 istype isType> ?@? o   � ����� 0 thedata theData@ A��A m   � ���
�� 
reco��  ��  = =  � �BCB n  � �DED m   � ���
�� 
pclsE o   � ����� 0 thedata theDataC o   � ����� $0 _caughterrortype _CaughtErrorType; k   � �FF GHG r   � �IJI J   � �KK LML N   � �NN n   � �OPO o   � ����� 0 	errortext 	errorTextP o   � ����� 0 thedata theDataM QRQ l 	 � �S���S N   � �TT n   � �UVU o   � ��~�~ 0 errornumber errorNumberV o   � ��}�} 0 thedata theData��  �  R WXW N   � �YY n   � �Z[Z o   � ��|�| 0 
errorvalue 
errorValue[ o   � ��{�{ 0 thedata theDataX \]\ l 	 � �^�z�y^ N   � �__ n   � �`a` o   � ��x�x 0 expectedtype expectedTypea o   � ��w�w 0 thedata theData�z  �y  ] b�vb N   � �cc n   � �ded o   � ��u�u 0 partialresult partialResulte o   � ��t�t 0 thedata theData�v  J o      �s�s $0 _errorrecordrefs _errorRecordRefsH f�rf L   � �gg I   � ��q�p�o�q 0 nextrawdata  �p  �o  �r  ��  ��  9 h�nh L   � �ii o   � ��m�m 0 thedata theData�n  ��  # k   �jj klk r   � mnm J   � �oo pqp [   � �rsr o   � ��l�l 0 
_dataindex 
_dataIndexs m   � ��k�k q t�jt m   � ��i�i �j  n J      uu vwv o      �h�h 0 
_dataindex 
_dataIndexw x�gx o      �f�f 0 _datasubindex _dataSubIndex�g  l y�ey L  zz I  �d�c�b�d 0 nextrawdata  �c  �b  �e  ��  ��  ��  � {�a{ l |}~| R  �`�_
�` .ascrerr ****      � ****�_   �^��]
�^ 
errn� m  �\�\f�]  } 1 + `osatest` will check for this error number   ~ ��� V   ` o s a t e s t `   w i l l   c h e c k   f o r   t h i s   e r r o r   n u m b e r�a  � ~ x repeatedly called by `osatest` when converting test data to literal representations; once exhausted, returns error 6502   � ��� �   r e p e a t e d l y   c a l l e d   b y   ` o s a t e s t `   w h e n   c o n v e r t i n g   t e s t   d a t a   t o   l i t e r a l   r e p r e s e n t a t i o n s ;   o n c e   e x h a u s t e d ,   r e t u r n s   e r r o r   6 5 0 2� ��� l     �[�Z�Y�[  �Z  �Y  � ��� i  " %��� I      �X��W�X 0 updaterawdata  � ��V� o      �U�U 0 literaltext literalText�V  �W  � l    p���� k     p�� ��� Z     m���T�� =    ��� o     �S�S $0 _errorrecordrefs _errorRecordRefs� J    �R�R  � k    3�� ��� l   �Q���Q  � # log {"UPDATE:", _testResults}   � ��� : l o g   { " U P D A T E : " ,   _ t e s t R e s u l t s }� ��� r    %��� o    �P�P 0 literaltext literalText� n      ��� 4   ! $�O�
�O 
cobj� m   " #�N�N � n    !��� 4    !�M�
�M 
cobj� o     �L�L 0 _datasubindex _dataSubIndex� n    ��� o    �K�K 0 testdata testData� n    ��� 4    �J�
�J 
cobj� o    �I�I 0 
_dataindex 
_dataIndex� o    �H�H 0 _testresults _testResults� ��G� r   & 3��� [   & -��� o   & +�F�F 0 _datasubindex _dataSubIndex� m   + ,�E�E � o      �D�D 0 _datasubindex _dataSubIndex�G  �T  � k   6 m�� ��� r   6 B��� o   6 7�C�C 0 literaltext literalText� n      ��� 1   ? A�B
�B 
pcnt� n   7 ?��� 4  < ?�A�
�A 
cobj� m   = >�@�@ � o   7 <�?�? $0 _errorrecordrefs _errorRecordRefs� ��� r   C P��� n   C J��� 1   H J�>
�> 
rest� o   C H�=�= $0 _errorrecordrefs _errorRecordRefs� o      �<�< $0 _errorrecordrefs _errorRecordRefs� ��;� Z  Q m���:�9� =  Q Y��� o   Q V�8�8 $0 _errorrecordrefs _errorRecordRefs� J   V X�7�7  � r   \ i��� [   \ c��� o   \ a�6�6 0 _datasubindex _dataSubIndex� m   a b�5�5 � o      �4�4 0 _datasubindex _dataSubIndex�:  �9  �;  � ��3� L   n p�2�2  �3  �a[ called by `osatest` to reinsert the raw data's literal representation; must be called after each nextRawData() (if formatting fails for any reason, use a placeholder, e.g. "�object�") -- TO DO: might be better to pass a boolean parameter along with literalText that indicates if the conversion failed; that way, reporter can decide what to insert   � ����   c a l l e d   b y   ` o s a t e s t `   t o   r e i n s e r t   t h e   r a w   d a t a ' s   l i t e r a l   r e p r e s e n t a t i o n ;   m u s t   b e   c a l l e d   a f t e r   e a c h   n e x t R a w D a t a ( )   ( i f   f o r m a t t i n g   f a i l s   f o r   a n y   r e a s o n ,   u s e   a   p l a c e h o l d e r ,   e . g .   " � o b j e c t � " )   - -   T O   D O :   m i g h t   b e   b e t t e r   t o   p a s s   a   b o o l e a n   p a r a m e t e r   a l o n g   w i t h   l i t e r a l T e x t   t h a t   i n d i c a t e s   i f   t h e   c o n v e r s i o n   f a i l e d ;   t h a t   w a y ,   r e p o r t e r   c a n   d e c i d e   w h a t   t o   i n s e r t� ��� l     �1�0�/�1  �0  �/  � ��� l     �.���.  �  -----   � ��� 
 - - - - -� ��� l     �-���-  � y s once raw test data is converted to literal text, `osatest` calls `renderreport` to turn it all into printable text   � ��� �   o n c e   r a w   t e s t   d a t a   i s   c o n v e r t e d   t o   l i t e r a l   t e x t ,   ` o s a t e s t `   c a l l s   ` r e n d e r r e p o r t `   t o   t u r n   i t   a l l   i n t o   p r i n t a b l e   t e x t� ��� l     �,�+�*�,  �+  �*  � ��� l     �)���)  � } w TO DO: renderreport() needs to return {statusFlag, reportText} so that `osatest` can tally pass/fail/skip/broke totals   � ��� �   T O   D O :   r e n d e r r e p o r t ( )   n e e d s   t o   r e t u r n   { s t a t u s F l a g ,   r e p o r t T e x t }   s o   t h a t   ` o s a t e s t `   c a n   t a l l y   p a s s / f a i l / s k i p / b r o k e   t o t a l s� ��� l     �(�'�&�(  �'  �&  � ��� i  & )��� I      �%�$�#�% 0 renderreport  �$  �#  � l   	���� k    	�� ��� r     ��� J     	�� ��� m     �"�"  � ��� o    �!�! 0 _skipped _SKIPPED� �� � m    �
� 
msng�   � J      �� ��� o      �� 0 assertcount assertCount� ��� o      �� 0 outcometype outcomeType� ��� o      �� 0 errorreport errorReport�  � ��� X     j���� l  4 e���� k   4 e��    l  4 4��   z t report record has form: {outcomeType:FLAG, fromHandler:NAME, problemSummary:TEXT, userNote:USERTEXT, testData:LIST}    � �   r e p o r t   r e c o r d   h a s   f o r m :   { o u t c o m e T y p e : F L A G ,   f r o m H a n d l e r : N A M E ,   p r o b l e m S u m m a r y : T E X T ,   u s e r N o t e : U S E R T E X T ,   t e s t D a t a : L I S T }  Z  4 E�� C   4 9	
	 n  4 7 o   5 7�� 0 fromhandler fromHandler o   4 5�� 0 	reportref 	reportRef
 m   7 8 �  a s s e r t   r   < A [   < ? o   < =�� 0 assertcount assertCount m   = >��  o      �� 0 assertcount assertCount�  �    r   F K n  F I o   G I�� 0 outcometype outcomeType o   F G�� 0 	reportref 	reportRef o      �� 0 outcometype outcomeType � l  L e Z  L e�� H   L ] E  L \ !  J   L X"" #$# o   L Q�� 0 _skipped _SKIPPED$ %�
% o   Q V�	�	 0 _success _SUCCESS�
  ! J   X [&& '�' o   X Y�� 0 outcometype outcomeType�    S   ` a�  �   o i note: can't think of a reason individual asserts should ever skip (it's normally suites/tests that skip)    �(( �   n o t e :   c a n ' t   t h i n k   o f   a   r e a s o n   i n d i v i d u a l   a s s e r t s   s h o u l d   e v e r   s k i p   ( i t ' s   n o r m a l l y   s u i t e s / t e s t s   t h a t   s k i p )�  � � � note: there may be more than one error report (e.g. if assert fails then tearDown fails as well); for now, just format and return the first and ignore any remaining reports   � �))Z   n o t e :   t h e r e   m a y   b e   m o r e   t h a n   o n e   e r r o r   r e p o r t   ( e . g .   i f   a s s e r t   f a i l s   t h e n   t e a r D o w n   f a i l s   a s   w e l l ) ;   f o r   n o w ,   j u s t   f o r m a t   a n d   r e t u r n   t h e   f i r s t   a n d   i g n o r e   a n y   r e m a i n i n g   r e p o r t s� 0 	reportref 	reportRef� o   # (�� 0 _testresults _testResults� *+* Z   k�,-./, =  k r010 o   k l�� 0 outcometype outcomeType1 o   l q�� 0 _success _SUCCESS- r   u �232 b   u �454 b   u �676 b   u �898 b   u �:;: b   u ~<=< n  u |>?> o   z |�� 0 g  ? o   u z�� 0 vtstyle vtStyle= m   | }@@ �AA  O K; n  ~ �BCB o   � ��� 0 n  C o   ~ �� �  0 vtstyle vtStyle9 m   � �DD �EE    ( p e r f o r m e d  7 n   � �FGF 1   � ���
�� 
lengG o   � ����� 0 _testresults _testResults5 m   � �HH �II    a s s e r t i o n s )3 o      ���� 0 
reporttext 
reportText. JKJ =  � �LML o   � ����� 0 outcometype outcomeTypeM o   � ����� 0 _skipped _SKIPPEDK N��N l  � �OPQO r   � �RSR b   � �TUT b   � �VWV b   � �XYX n  � �Z[Z o   � ����� 0 e  [ o   � ����� 0 vtstyle vtStyleY m   � �\\ �]]  S K I PW n  � �^_^ o   � ����� 0 n  _ o   � ����� 0 vtstyle vtStyleU m   � �`` �aa D   ( t e s t   h a n d l e r   m a d e   n o   a s s e r t i o n s )S o      ���� 0 
reporttext 
reportTextP U O no asserts were performed, so test is marked as 'skipped' rather than 'passed'   Q �bb �   n o   a s s e r t s   w e r e   p e r f o r m e d ,   s o   t e s t   i s   m a r k e d   a s   ' s k i p p e d '   r a t h e r   t h a n   ' p a s s e d '��  / k   ��cc ded Z   � �fghif =  � �jkj o   � ����� 0 outcometype outcomeTypek o   � ����� 0 _failure _FAILUREg r   � �lml m   � �nn �oo  F A I Lm o      ���� 0 
statustext 
statusTexth pqp =  � �rsr o   � ����� 0 outcometype outcomeTypes o   � ����� 0 _broken _BROKENq t��t r   � �uvu m   � �ww �xx 
 B R O K Ev o      ���� 0 
statustext 
statusText��  i r   � �yzy m   � �{{ �|| 
 O T H E Rz o      ���� 0 
statustext 
statusTexte }~} r   � �� b   � ���� n  � ���� o   � ����� 0 r  � o   � ����� 0 vtstyle vtStyle� m   � ��� ���  F A I L� o      ���� 0 
reporttext 
reportText~ ��� Z   �
������� C   � ���� n  � ���� o   � ����� 0 fromhandler fromHandler� o   � ����� 0 	reportref 	reportRef� m   � ��� ���  a s s e r t  � r   ���� b   ���� b   ���� o   � ����� 0 
reporttext 
reportText� m   ��� ���    o n   a s s e r t i o n  � o  ���� 0 assertcount assertCount� o      ���� 0 
reporttext 
reportText��  ��  � ��� r  ��� b  ��� b  ��� b  ��� o  ���� 0 
reporttext 
reportText� m  �� ���  .� n ��� o  ���� 0 n  � o  ���� 0 vtstyle vtStyle� 1  ��
�� 
lnfd� o      ���� 0 
reporttext 
reportText� ��� l ������  �   explain the problem:   � ��� *   e x p l a i n   t h e   p r o b l e m :� ��� r  >��� b  <��� b  8��� b  2��� b  .��� b  *��� b  &��� o   ���� 0 
reporttext 
reportText� o   %���� 0 indent1  � m  &)�� ���  � n *-��� o  +-���� 0 fromhandler fromHandler� o  *+���� 0 	reportref 	reportRef� m  .1�� ���    � n 27��� o  37����  0 problemsummary problemSummary� o  23���� 0 	reportref 	reportRef� m  8;�� ���  :� o      ���� 0 
reporttext 
reportText� ��� l ??������  � � � TO DO: would it improve presentation in terminal if padding were added after each label so that listed values all align on left edge?   � ���   T O   D O :   w o u l d   i t   i m p r o v e   p r e s e n t a t i o n   i n   t e r m i n a l   i f   p a d d i n g   w e r e   a d d e d   a f t e r   e a c h   l a b e l   s o   t h a t   l i s t e d   v a l u e s   a l l   a l i g n   o n   l e f t   e d g e ?� ��� X  ?������ k  S��� ��� l Sc���� r  Sc��� o  ST���� 0 aref aRef� J      �� ��� o      ���� 0 k  � ���� o      ���� 0 v  ��  � D > note: v should always be either text or 'caught error' record   � ��� |   n o t e :   v   s h o u l d   a l w a y s   b e   e i t h e r   t e x t   o r   ' c a u g h t   e r r o r '   r e c o r d� ��� Z d�������� = do��� n di��� m  ei��
�� 
pcls� o  de���� 0 v  � o  in���� $0 _caughterrortype _CaughtErrorType� r  r��� I  r}������� 20 formatcaughterrorrecord formatCaughtErrorRecord� ��� o  st���� 0 v  � ���� o  ty���� 0 indent2  ��  ��  � o      ���� 0 v  ��  ��  � ��� Z  �������� o  ������ 0 uselinewrap useLineWrap� r  ����� I  ��������� 0 linewrap lineWrap� ��� o  ������ 0 v  � ��� I  ��������� $0 formatinvisibles formatInvisibles� ��� o  ������ 0 v  � ���� b  ����� 1  ����
�� 
lnfd� o  ������ 0 indent2  ��  ��  � ���� o  ������ 0 terminalwidth terminalWidth��  ��  � o      ���� 0 v  ��  � l ������ r  ��   I  �������� $0 formatinvisibles formatInvisibles  o  ������ 0 v   �� 1  ����
�� 
lnfd��  ��   o      ���� 0 v  � @ : include linebreak after '\n'/'\r' escapes for readability   � � t   i n c l u d e   l i n e b r e a k   a f t e r   ' \ n ' / ' \ r '   e s c a p e s   f o r   r e a d a b i l i t y� �� l ��	
 r  �� b  �� b  �� b  �� b  �� b  �� b  �� o  ������ 0 
reporttext 
reportText 1  ����
�� 
lnfd o  ������ 0 indent1   m  �� �  "   o  ������ 0 k   m  �� �  :   o  ������ 0 v   o      ���� 0 
reporttext 
reportText	�� TO DO: need to replace any TAB, CR, and LF in strings with "\t", "\r", "\n" (specifically applies to AS string literals, though these chars ought not to appear elsewhere in data in which case it's simplest just to apply it to the lot); this should make differences in invisibles somewhat easier to spot in reports and may help avoid some confusion when text gets linewrapped for terminal display   
 �   T O   D O :   n e e d   t o   r e p l a c e   a n y   T A B ,   C R ,   a n d   L F   i n   s t r i n g s   w i t h   " \ t " ,   " \ r " ,   " \ n "   ( s p e c i f i c a l l y   a p p l i e s   t o   A S   s t r i n g   l i t e r a l s ,   t h o u g h   t h e s e   c h a r s   o u g h t   n o t   t o   a p p e a r   e l s e w h e r e   i n   d a t a   i n   w h i c h   c a s e   i t ' s   s i m p l e s t   j u s t   t o   a p p l y   i t   t o   t h e   l o t ) ;   t h i s   s h o u l d   m a k e   d i f f e r e n c e s   i n   i n v i s i b l e s   s o m e w h a t   e a s i e r   t o   s p o t   i n   r e p o r t s   a n d   m a y   h e l p   a v o i d   s o m e   c o n f u s i o n   w h e n   t e x t   g e t s   l i n e w r a p p e d   f o r   t e r m i n a l   d i s p l a y��  �� 0 aref aRef� n BG o  CG���� 0 testdata testData o  BC���� 0 	reportref 	reportRef�  ��  Z ��!"����! > ��#$# n ��%&% o  ������ 0 usernote userNote& o  ������ 0 	reportref 	reportRef$ m  ��'' �((  " r  ��)*) b  ��+,+ b  ��-.- b  ��/0/ b  ��121 o  ������ 0 
reporttext 
reportText2 1  ����
�� 
lnfd0 m  ��33 �44  (. n ��565 o  ������ 0 usernote userNote6 o  ������ 0 	reportref 	reportRef, m  ��77 �88  )* o      ���� 0 
reporttext 
reportText��  ��  ��  + 9��9 L  �	:: K  �;; ��<=
�� 
Stat< o  � ���� 0 outcometype outcomeType= ��>��
�� 
Repo> o  ���� 0 
reporttext 
reportText��  ��  � "  construct final report text   � �?? 8   c o n s t r u c t   f i n a l   r e p o r t   t e x t� @��@ l     ��������  ��  ��  ��  �4  � ABA l     ��������  ��  ��  B C��C l     ��������  ��  ��  ��       ��DE����������FGHIJKLMNOPQ��  D ����������������~�}�|�{�z�y�x�w�v�u�� 0 novalue NoValue�� 0 _success _SUCCESS�� 0 _failure _FAILURE�� 0 _broken _BROKEN�� 0 _skipped _SKIPPED�� $0 _caughterrortype _CaughtErrorType�� .0 makecaughterrorrecord makeCaughtErrorRecord� *0 _defaulterrorrecord _defaultErrorRecord�~ <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord�} 20 formatcaughterrorrecord formatCaughtErrorRecord�| 0 istype isType�{ (0 sanitizeidentifier sanitizeIdentifier�z  0 makecallobject makeCallObject�y 0 replacetext replaceText�x $0 formatinvisibles formatInvisibles�w 0 linewrap lineWrap�v 0 vt100 VT100�u  0 maketestreport makeTestReportE �t   R�t 0 novalue NoValueR  SS  �� �� �� �� 
�� 
����F �s H�r�qTU�p�s .0 makecaughterrorrecord makeCaughtErrorRecord�r �oV�o V  �n�m�l�k�j�n 0 etext eText�m 0 enumber eNumber�l 0 efrom eFrom�k 
0 eto eTo�j 0 epartial ePartial�q  T �i�h�g�f�e�i 0 etext eText�h 0 enumber eNumber�g 0 efrom eFrom�f 
0 eto eTo�e 0 epartial ePartialU �d�c�b�a�`�_�^
�d 
pcls�c 0 	errortext 	errorText�b 0 errornumber errorNumber�a 0 
errorvalue 
errorValue�` 0 expectedtype expectedType�_ 0 partialresult partialResult�^ �p �b  ������G �]�\W
�] 
pcls
�\ 
����W �[EX�[ 0 	errortext 	errorTextX �ZEY�Z 0 errornumber errorNumberY �YEZ�Y 0 
errorvalue 
errorValueZ �XE[�X 0 expectedtype expectedType[ �WE�V�W 0 partialresult partialResult�V  H �U x�T�S\]�R�U <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord�T �Q^�Q ^  �P�P 0 errorrecord errorRecord�S  \ �O�N�O 0 errorrecord errorRecord�N $0 normalizedrecord normalizedRecord] 	�M�L�K�J�I�H�G � �
�M 
leng
�L 
errn�K�Y
�J 
erob
�I 
errt
�H 
reco�G �R A��,j  )�������Y hO�b  %E�O��,b  �, )�������Y hO�I �F ��E�D_`�C�F 20 formatcaughterrorrecord formatCaughtErrorRecord�E �Ba�B a  �A�@�A 0 errorrecord errorRecord�@ 0 
lineindent 
lineIndent�D  _ �?�>�=�? 0 errorrecord errorRecord�> 0 
lineindent 
lineIndent�= 0 	errortext 	errorText`  ��< � ��;�:�9 ��8�7+�< 0 errornumber errorNumber�; 0 	errortext 	errorText�: 0 
errorvalue 
errorValue
�9 
lnfd�8 0 expectedtype expectedType�7 0 partialresult partialResult�C ��E�O��,b    ��%��,%�%E�Y hO��,b    ���,%E�Y hO��,b    ��%�%�%��,%E�Y hO��,b    ��%�%�%��,%E�Y hO��,b    ��%�%�%��,%E�Y hO�J �68�5�4bc�3�6 0 istype isType�5 �2d�2 d  �1�0�1 0 thevalue theValue�0 0 typename typeName�4  b �/�.�/ 0 thevalue theValue�. 0 typename typeNamec �-�,
�- 
kocl
�, .corecnte****       ****�3 �kv�l jK �+Y�*�)ef�(�+ (0 sanitizeidentifier sanitizeIdentifier�* �'g�' g  �&�& 0 aname aName�)  e �%�$�#�"�!�% 0 aname aName�$ 0 res  �# 0 
legalchars 
legalChars�" 0 usepipes usePipes�! 0 charref charReff ]^fiou� ��������
�  
kocl
� 
cobj
� .corecnte****       ****
� 
pcnt�( t�� p��  �Y hO�E�O�E�OfE�O @�[��l kh ���, eE�O��, 
�%E�Y hY hO��%E�O�E�[OY��O� ��%�%E�Y hO�VL ����hi��  0 makecallobject makeCallObject� �j� j  ��� 0 handlername handlerName�  0 parametercount parameterCount�  h ����� 0 handlername handlerName�  0 parametercount parameterCount� 0 args  � 0 i  i ����	��
� 
ctxt� (0 sanitizeidentifier sanitizeIdentifier
� .sysodsct****        scpt� ^�E�O�k  �E�Y 0�k ) k�kh ��%�%E�[OY��O�[�\[Zm\Zi2E�Y hO�*�%k+ %�%*�k+ %�%�%�%j 
M �&��kl�� 0 replacetext replaceText� �
m�
 m  �	���	 0 thetext theText� 0 findtext findText� 0 replacetext replaceText�  k ����� 0 thetext theText� 0 findtext findText� 0 replacetext replaceText� 0 	textitems 	textItemsl ��� ��
� 
ascr
� 
txdl
�  
citm
�� 
ctxt� ���,FO��-E�O���,FO��&N ��K����no���� $0 formatinvisibles formatInvisibles�� ��p�� p  ������ 0 thetext theText�� 0 linewrap lineWrap��  n ������ 0 thetext theText�� 0 linewrap lineWrapo ��g����n��u
�� 
tab �� 0 replacetext replaceText
�� 
lnfd
�� 
ret �� ***���m+ ��%m+ ��%m+ O ������qr���� 0 linewrap lineWrap�� ��s�� s  ������ 0 thetext theText�� 0 towidth toWidth��  q ������ 0 thetext theText�� 0 towidth toWidthr  �� �P �������tu���� 0 vt100 VT100�� ��v�� v  ���� 0 
formatcode 
formatCode��  t ���� 0 
formatcode 
formatCodeu ��������
�� 
cha �� 
�� kfrmID  �� )���0�%�%�%Q �������wx����  0 maketestreport makeTestReport�� ��y�� y  �������� 0 testsuitename testSuiteName�� "0 testhandlername testHandlerName�� 0 terminalwidth terminalWidth��  w ������������������ 0 testsuitename testSuiteName�� "0 testhandlername testHandlerName�� 0 terminalwidth terminalWidth�� 0 indent1  �� 0 indent2  �� 0 vtstyle vtStyle�� 0 uselinewrap useLineWrap�� 0 
testreport 
TestReportx ������������������������������z
�� 
cobj�� 0 n  �� 0 b  �� 0 u  �� 0 r  �� 0 g  �� 0 e  �� �� 0 vt100 VT100�� �� 0 
testreport 
TestReportz ��{����|}��
�� .ascrinit****      � ****{ k     )~~ % ,�� h�� ��� ��� ��� ��� ��� ��� ��� �����  ��  ��  | ������������������������ 0 _testresults _testResults�� 0 
_addreport 
_addReport�� 0 
addsuccess 
addSuccess�� 0 
addfailure 
addFailure�� 0 	addbroken 	addBroken�� $0 _errorrecordrefs _errorRecordRefs�� 0 
_dataindex 
_dataIndex�� 0 _datasubindex _dataSubIndex�� 0 nextrawdata  �� 0 updaterawdata  �� 0 renderreport  } ����������������� 0 _testresults _testResults� ��/���������� 0 
_addreport 
_addReport�� ����� �  ������������ 0 outcometype outcomeType�� 0 fromhandler fromHandler��  0 problemsummary problemSummary�� 0 usernote userNote�� 0 testdata testData��  � ������������ 0 outcometype outcomeType�� 0 fromhandler fromHandler��  0 problemsummary problemSummary�� 0 usernote userNote�� 0 testdata testData� �������������� 0 outcometype outcomeType�� 0 fromhandler fromHandler��  0 problemsummary problemSummary�� 0 usernote userNote�� 0 testdata testData�� 
�� ������b   6FOP� ��k���������� 0 
addsuccess 
addSuccess�� ����� �  �������� 0 fromhandler fromHandler�� 0 usernote userNote�� 0 testdata testData��  � �������� 0 fromhandler fromHandler�� 0 usernote userNote�� 0 testdata testData� y������ �� 0 
_addreport 
_addReport�� *b  �ࡢ�+ � ������������� 0 
addfailure 
addFailure�� ����� �  ���������� 0 fromhandler fromHandler��  0 problemsummary problemSummary�� 0 usernote userNote�� 0 testdata testData��  � ���������� 0 fromhandler fromHandler��  0 problemsummary problemSummary�� 0 usernote userNote�� 0 testdata testData� ����� � 0 
_addreport 
_addReport�� *b  �����+ � �~��}�|���{�~ 0 	addbroken 	addBroken�} �z��z �  �y�x�w�v�y 0 fromhandler fromHandler�x  0 problemsummary problemSummary�w 0 usernote userNote�v 0 testdata testData�|  � �u�t�s�r�u 0 fromhandler fromHandler�t  0 problemsummary problemSummary�s 0 usernote userNote�r 0 testdata testData� �q�p�q �p 0 
_addreport 
_addReport�{ *b  �����+ �� $0 _errorrecordrefs _errorRecordRefs�� 0 
_dataindex 
_dataIndex�� 0 _datasubindex _dataSubIndex� �o��n�m���l�o 0 nextrawdata  �n  �m  � �k�j�i�k 0 	erroritem 	errorItem�j 0 datalist dataList�i 0 thedata theData� �h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W
�h 
leng
�g 
cobj
�f 
pcnt
�e 
rest�d 0 nextrawdata  �c 0 testdata testData
�b 
reco�a 0 istype isType
�` 
pcls
�_ 
bool�^ 0 	errortext 	errorText�] 0 errornumber errorNumber�\ 0 
errorvalue 
errorValue�[ 0 expectedtype expectedType�Z 0 partialresult partialResult�Y 
�X 
errn�Wf�lb  b   �, �b  jv Tb  �k/�,E�O�b     6b  �,Ec  Ob  jv  b  kEc  Y hO*j+ Y hO�Y hOb   �b  /�,E�Ob  ��, U��b  /�l/E�O*��l+ 	 ��,b   �& (��,��,��,��,��,�vEc  O*j+ Y hO�Y *b  kklvE[�k/Ec  Z[�l/Ec  ZO*j+ Y hO)a a lh� �V��U�T���S�V 0 updaterawdata  �U �R��R �  �Q�Q 0 literaltext literalText�T  � �P�P 0 literaltext literalText� �O�N�M�L
�O 
cobj�N 0 testdata testData
�M 
pcnt
�L 
rest�S qb  jv  -�b   �b  /�,�b  /�l/FOb  kEc  Y 9�b  �k/�,FOb  �,Ec  Ob  jv  b  kEc  Y hOh� �K��J�I���H�K 0 renderreport  �J  �I  � 	�G�F�E�D�C�B�A�@�?�G 0 assertcount assertCount�F 0 outcometype outcomeType�E 0 errorreport errorReport�D 0 	reportref 	reportRef�C 0 
reporttext 
reportText�B 0 
statustext 
statusText�A 0 aref aRef�@ 0 k  �? 0 v  � +�>�=�<�;�:�9�8@�7D�6H�5\`nw{�4�����3���2��1�0�/�.�-�,'37�+�*�)
�> 
msng
�= 
cobj
�< 
kocl
�; .corecnte****       ****�: 0 fromhandler fromHandler�9 0 outcometype outcomeType�8 0 g  �7 0 n  
�6 
leng�5 0 e  �4 0 r  
�3 
lnfd�2  0 problemsummary problemSummary�1 0 testdata testData
�0 
pcls�/ 20 formatcaughterrorrecord formatCaughtErrorRecord�. $0 formatinvisibles formatInvisibles�- 0 linewrap lineWrap�, 0 usernote userNote
�+ 
Stat
�* 
Repo�) �H
jb  �mvE[�k/E�Z[�l/E�Z[�m/E�ZO Ib   [��l kh ��,� 
�kE�Y hO��,E�Ob  b  lv�kv Y h[OY��O�b    $b  �,�%b  �,%�%b   �,%�%E�Yf�b    b  �,�%b  �,%�%E�YD�b    
a E�Y �b    
a E�Y a E�Ob  a ,a %E�O��,a  �a %�%E�Y hO�a %b  �,%_ %E�O�b  %a %��,%a %�a ,%a %E�O ��a ,[��l kh �E[�k/E�Z[�l/E�ZO�a ,b    *�b  l+ E�Y hOb   !*�*�_ b  %l+  b  m+ !E�Y *�_ l+  E�O�_ %b  %a "%�%a #%�%E�[OY�}O�a $,a % �_ %a &%�a $,%a '%E�Y hOa (�a )�a *�� *jv�OL OL OL OL Ojv�Ok�Ok�OL OL 	OL 
�� x��lvE[�k/E�Z[�l/E�ZO�i  �������������E�OfE�Y <�*jk+ �*kk+ �*a k+ �*a k+ �*a k+ �*a k+ �E�OeE�Oa a K S� ascr  ��ޭ