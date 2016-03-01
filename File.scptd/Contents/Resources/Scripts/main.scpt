FasdUAS 1.101.10   ��   ��    k             l      ��  ��    � � File -- common file system and path string operations

Notes:

- Path manipulation commands all operate on POSIX paths, as those are reliable whereas HFS paths (which are already deprecated everywhere else in OS X) are not.

     � 	 	�   F i l e   - -   c o m m o n   f i l e   s y s t e m   a n d   p a t h   s t r i n g   o p e r a t i o n s 
 
 N o t e s : 
 
 -   P a t h   m a n i p u l a t i o n   c o m m a n d s   a l l   o p e r a t e   o n   P O S I X   p a t h s ,   a s   t h o s e   a r e   r e l i a b l e   w h e r e a s   H F S   p a t h s   ( w h i c h   a r e   a l r e a d y   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X )   a r e   n o t . 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �        s u p p o r t   ! " ! l     ��������  ��  ��   "  # $ # l      % & ' % j    �� (�� 0 _support   ( N     ) ) 4    �� *
�� 
scpt * m     + + � , ,  T y p e S u p p o r t & "  used for parameter checking    ' � - - 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g $  . / . l     ��������  ��  ��   /  0 1 0 l     ��������  ��  ��   1  2 3 2 i   ! 4 5 4 I      �� 6���� 
0 _error   6  7 8 7 o      ���� 0 handlername handlerName 8  9 : 9 o      ���� 0 etext eText :  ; < ; o      ���� 0 enumber eNumber <  = > = o      ���� 0 efrom eFrom >  ?�� ? o      ���� 
0 eto eTo��  ��   5 n     @ A @ I    �� B���� &0 throwcommanderror throwCommandError B  C D C m     E E � F F  F i l e D  G H G o    ���� 0 handlername handlerName H  I J I o    ���� 0 etext eText J  K L K o    	���� 0 enumber eNumber L  M N M o   	 
���� 0 efrom eFrom N  O�� O o   
 ���� 
0 eto eTo��  ��   A o     ���� 0 _support   3  P Q P l     ��������  ��  ��   Q  R S R l     ��������  ��  ��   S  T U T l     �� V W��   V J D--------------------------------------------------------------------    W � X X � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - U  Y Z Y l     �� [ \��   [  File Read/Write; these are atomic alternatives to StandardAdditions' File Read/Write suite, with better support for text encodings (incremental read/write is almost entirely useless in practice as AS doesn't have the capabilities or smarts to do it right)    \ � ] ]    F i l e   R e a d / W r i t e ;   t h e s e   a r e   a t o m i c   a l t e r n a t i v e s   t o   S t a n d a r d A d d i t i o n s '   F i l e   R e a d / W r i t e   s u i t e ,   w i t h   b e t t e r   s u p p o r t   f o r   t e x t   e n c o d i n g s   ( i n c r e m e n t a l   r e a d / w r i t e   i s   a l m o s t   e n t i r e l y   u s e l e s s   i n   p r a c t i c e   a s   A S   d o e s n ' t   h a v e   t h e   c a p a b i l i t i e s   o r   s m a r t s   t o   d o   i t   r i g h t ) Z  ^ _ ^ l     ��������  ��  ��   _  ` a ` h   " )�� b�� (0 _nsstringencodings _NSStringEncodings b k       c c  d e d l     �� f g��   f � � note: AS can't natively represent integers larger than 2^30, but as long as they're not larger than 2^50 (1e15) then AS's real (Double) representation will reliably coerce back to integer when passed to ASOC    g � h h�   n o t e :   A S   c a n ' t   n a t i v e l y   r e p r e s e n t   i n t e g e r s   l a r g e r   t h a n   2 ^ 3 0 ,   b u t   a s   l o n g   a s   t h e y ' r e   n o t   l a r g e r   t h a n   2 ^ 5 0   ( 1 e 1 5 )   t h e n   A S ' s   r e a l   ( D o u b l e )   r e p r e s e n t a t i o n   w i l l   r e l i a b l y   c o e r c e   b a c k   t o   i n t e g e r   w h e n   p a s s e d   t o   A S O C e  i j i l     ��������  ��  ��   j  k l k l     �� m n��   m $  NS...StringEncoding constants    n � o o <   N S . . . S t r i n g E n c o d i n g   c o n s t a n t s l  p q p j     ��� r�� 
0 _list_   r J     � s s  t u t l 	    v���� v J      w w  x y x m     ��
�� FEncFE01 y  z�� z m    ���� ��  ��  ��   u  { | { l 	   }���� } J     ~ ~   �  m    ��
�� FEncFE02 �  ��� � m    ���� 
��  ��  ��   |  � � � l 	   ����� � J     � �  � � � m    	��
�� FEncFE03 �  ��� � m   	 
 � � A�      ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE04 �  ��� � m     � � A�     ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE05 �  ��� � m     � � A�     ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE06 �  ��� � m     � � A�      ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE07 �  ��� � m     � � A�     ��  ��  ��   �  � � � l 	    ����� � J      � �  � � � m    ��
�� FEncFE11 �  ��� � m    ���� ��  ��  ��   �  � � � l 	   & ����� � J     & � �  � � � m     !��
�� FEncFE12 �  ��� � m   ! $���� ��  ��  ��   �  � � � l 	 & . ����� � J   & . � �  � � � m   & )��
�� FEncFE13 �  ��� � m   ) ,���� ��  ��  ��   �  � � � l 	 . 6 ����� � J   . 6 � �  � � � m   . 1��
�� FEncFE14 �  ��� � m   1 4���� 	��  ��  ��   �  � � � l 	 6 < ����� � J   6 < � �  � � � m   6 9��
�� FEncFE15 �  ��� � m   9 :���� ��  ��  ��   �  � � � l 	 < D ����� � J   < D � �  � � � m   < ?��
�� FEncFE16 �  ��� � m   ? B���� ��  ��  ��   �  � � � l 	 D L ����� � J   D L � �  � � � m   D G��
�� FEncFE17 �  ��� � m   G J���� ��  ��  ��   �  � � � l 	 L T ���� � J   L T � �  � � � m   L O�~
�~ FEncFE18 �  ��} � m   O R�|�| �}  ��  �   �  � � � l 	 T \ ��{�z � J   T \ � �  � � � m   T W�y
�y FEncFE19 �  ��x � m   W Z�w�w �x  �{  �z   �  � � � l 	 \ d ��v�u � J   \ d � �  � � � m   \ _�t
�t FEncFE50 �  ��s � m   _ b�r�r �s  �v  �u   �  � � � l 	 d l ��q�p � J   d l � �  � � � m   d g�o
�o FEncFE51 �  ��n � m   g j�m�m �n  �q  �p   �  � � � l 	 l t ��l�k � J   l t � �  � � � m   l o�j
�j FEncFE52 �  ��i � m   o r�h�h �i  �l  �k   �  � � � l 	 t | �g�f  J   t |  m   t w�e
�e FEncFE53 �d m   w z�c�c �d  �g  �f   � �b l 	 | ��a�` J   | � 	 m   | �_
�_ FEncFE54	 
�^
 m    ��]�] �^  �a  �`  �b   q  l     �\�[�Z�\  �[  �Z   �Y i  � � I      �X�W�X 0 getencoding getEncoding �V o      �U�U 0 textencoding textEncoding�V  �W   k     V  Q     K k    3  r     c     o    �T�T 0 textencoding textEncoding m    �S
�S 
enum o      �R�R 0 textencoding textEncoding �Q X   	 3 �P!  Z   ."#�O�N" =   !$%$ n   &'& 4    �M(
�M 
cobj( m    �L�L ' o    �K�K 0 aref aRef% o     �J�J 0 textencoding textEncoding# L   $ *)) n  $ )*+* 4   % (�I,
�I 
cobj, m   & '�H�H + o   $ %�G�G 0 aref aRef�O  �N  �P 0 aref aRef! n   -.- o    �F�F 
0 _list_  .  f    �Q   R      �E�D/
�E .ascrerr ****      � ****�D  / �C0�B
�C 
errn0 d      11 m      �A�A��B   l  ; K2342 Q   ; K5675 L   > B88 c   > A9:9 o   > ?�@�@ 0 textencoding textEncoding: m   ? @�?
�? 
long6 R      �>�=;
�> .ascrerr ****      � ****�=  ; �<<�;
�< 
errn< d      == m      �:�:��;  7 l  J J�9>?�9  >   fall through   ? �@@    f a l l   t h r o u g h3 ] W not a predefined constant, but hedge bets as it might be a raw NSStringEncoding number   4 �AA �   n o t   a   p r e d e f i n e d   c o n s t a n t ,   b u t   h e d g e   b e t s   a s   i t   m i g h t   b e   a   r a w   N S S t r i n g E n c o d i n g   n u m b e r B�8B R   L V�7CD
�7 .ascrerr ****      � ****C m   T UEE �FF h I n v a l i d    u s i n g    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .D �6GH
�6 
errnG m   N O�5�5�YH �4IJ
�4 
erobI o   P Q�3�3 0 textencoding textEncodingJ �2K�1
�2 
errtK m   R S�0
�0 
enum�1  �8  �Y   a LML l     �/�.�-�/  �.  �-  M NON l     �,�+�*�,  �+  �*  O PQP l     �)RS�)  R  -----   S �TT 
 - - - - -Q UVU l     �(�'�&�(  �'  �&  V WXW i  * -YZY I     �%[\
�% .Fil:Readnull���     file[ o      �$�$ 0 thefile theFile\ �#]^
�# 
Type] |�"�!_� `�"  �!  _ o      �� 0 datatype dataType�   ` l     a��a m      �
� 
ctxt�  �  ^ �b�
� 
Encob |��c�d�  �  c o      �� 0 textencoding textEncoding�  d l     e��e m      �
� FEncFE01�  �  �  Z Q     �fghf k    �ii jkj r    lml n   non I    �p�� ,0 asposixpathparameter asPOSIXPathParameterp qrq o    	�� 0 thefile theFiler s�s m   	 
tt �uu  �  �  o o    �� 0 _support  m o      �� 0 	posixpath 	posixPathk vwv r    xyx n   z{z I    �|�� "0 astypeparameter asTypeParameter| }~} o    �
�
 0 datatype dataType~ �	 m    �� ���  a s�	  �  { o    �� 0 _support  y o      �� 0 datatype dataTypew ��� Z    ������ F    *��� =   "��� o     �� 0 datatype dataType� m     !�
� 
ctxt� >  % (��� o   % &�� 0 textencoding textEncoding� m   & '�
� FEncFEPE� l  - }���� k   - }�� ��� r   - 9��� n  - 7��� I   2 7� ����  0 getencoding getEncoding� ���� o   2 3���� 0 textencoding textEncoding��  ��  � o   - 2���� (0 _nsstringencodings _NSStringEncodings� o      ���� 0 textencoding textEncoding� ��� r   : S��� n  : D��� I   = D������� T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_� ��� o   = >���� 0 	posixpath 	posixPath� ��� o   > ?���� 0 textencoding textEncoding� ���� l  ? @������ m   ? @��
�� 
obj ��  ��  ��  ��  � n  : =��� o   ; =���� 0 nsstring NSString� m   : ;��
�� misccura� J      �� ��� o      ���� 0 
asocstring 
asocString� ���� o      ���� 0 theerror theError��  � ��� Z  T x������� =  T W��� o   T U���� 0 
asocstring 
asocString� m   U V��
�� 
msng� R   Z t����
�� .ascrerr ****      � ****� l  l s������ c   l s��� n  l q��� I   m q�������� ,0 localizeddescription localizedDescription��  ��  � o   l m���� 0 theerror theError� m   q r��
�� 
ctxt��  ��  � ����
�� 
errn� n  \ a��� I   ] a�������� 0 code  ��  ��  � o   \ ]���� 0 theerror theError� ����
�� 
erob� o   d e���� 0 thefile theFile� �����
�� 
errt� o   h i���� 0 datatype dataType��  ��  ��  � ���� L   y }�� c   y |��� o   y z���� 0 
asocstring 
asocString� m   z {��
�� 
ctxt��  �'! note: AS treats `text`, `string`, and `Unicode text` as synonyms when comparing for equality, which is a little bit problematic as StdAdds' `read` command treats `string` as 'primary encoding' and `Unicode text` as UTF16; passing `primary encoding` for `using` parameter provides an 'out'   � ���B   n o t e :   A S   t r e a t s   ` t e x t ` ,   ` s t r i n g ` ,   a n d   ` U n i c o d e   t e x t `   a s   s y n o n y m s   w h e n   c o m p a r i n g   f o r   e q u a l i t y ,   w h i c h   i s   a   l i t t l e   b i t   p r o b l e m a t i c   a s   S t d A d d s '   ` r e a d `   c o m m a n d   t r e a t s   ` s t r i n g `   a s   ' p r i m a r y   e n c o d i n g '   a n d   ` U n i c o d e   t e x t `   a s   U T F 1 6 ;   p a s s i n g   ` p r i m a r y   e n c o d i n g `   f o r   ` u s i n g `   p a r a m e t e r   p r o v i d e s   a n   ' o u t '�  � k   � ��� ��� r   � ���� I  � ������
�� .rdwropenshor       file� l  � ������� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf��  ��  ��  � o      ���� 0 fh  � ���� Q   � ����� k   � ��� ��� r   � ���� I  � �����
�� .rdwrread****        ****� o   � ����� 0 fh  � �����
�� 
as  � o   � ����� 0 datatype dataType��  � o      ���� 0 	theresult 	theResult� ��� I  � ������
�� .rdwrclosnull���     ****� o   � ����� 0 fh  ��  � ���� L   � ��� o   � ����� 0 	theresult 	theResult��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � k   � ��� ��� Q   � ������ I  � ������
�� .rdwrclosnull���     ****� o   � ����� 0 fh  ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  � ���� R   � �����
�� .ascrerr ****      � ****� o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enumber eNumber� ����
�� 
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  ��  ��  �  g R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  h I   � �������� 
0 _error  � ��� m   � ��� ���  r e a d   f i l e� � � o   � ����� 0 etext eText   o   � ����� 0 enumber eNumber  o   � ����� 0 efrom eFrom �� o   � ����� 
0 eto eTo��  ��  X  l     ��������  ��  ��   	 l     ��������  ��  ��  	 

 i  . 1 I     ��
�� .Fil:Writnull���     file o      ���� 0 thefile theFile ��
�� 
Data o      ���� 0 thedata theData ��
�� 
Type |��������  ��   o      ���� 0 datatype dataType��   l     ���� m      ��
�� 
ctxt��  ��   ����
�� 
Enco |��������  ��   o      ���� 0 textencoding textEncoding��   l     ��~ m      �}
�} FEncFE01�  �~  ��   Q    	 k    �   r    !"! n   #$# I    �|%�{�| ,0 asposixpathparameter asPOSIXPathParameter% &'& o    	�z�z 0 thefile theFile' (�y( m   	 
)) �**  �y  �{  $ o    �x�x 0 _support  " o      �w�w 0 	posixpath 	posixPath  +,+ r    -.- n   /0/ I    �v1�u�v "0 astypeparameter asTypeParameter1 232 o    �t�t 0 datatype dataType3 4�s4 m    55 �66  a s�s  �u  0 o    �r�r 0 _support  . o      �q�q 0 datatype dataType, 7�p7 Z    �89�o:8 F    *;<; =   "=>= o     �n�n 0 datatype dataType> m     !�m
�m 
ctxt< >  % (?@? o   % &�l�l 0 textencoding textEncoding@ m   & '�k
�k FEncFEPE9 k   - �AA BCB r   - ADED n  - ?FGF I   0 ?�jH�i�j &0 stringwithstring_ stringWithString_H I�hI l  0 ;J�g�fJ n  0 ;KLK I   5 ;�eM�d�e "0 astextparameter asTextParameterM NON o   5 6�c�c 0 thedata theDataO P�bP m   6 7QQ �RR  d a t a�b  �d  L o   0 5�a�a 0 _support  �g  �f  �h  �i  G n  - 0STS o   . 0�`�` 0 nsstring NSStringT m   - .�_
�_ misccuraE o      �^�^ 0 
asocstring 
asocStringC UVU r   B NWXW n  B LYZY I   G L�][�\�] 0 getencoding getEncoding[ \�[\ o   G H�Z�Z 0 textencoding textEncoding�[  �\  Z o   B G�Y�Y (0 _nsstringencodings _NSStringEncodingsX o      �X�X 0 textencoding textEncodingV ]^] r   O k_`_ n  O Xaba I   P X�Wc�V�W P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_c ded o   P Q�U�U 0 	posixpath 	posixPathe fgf m   Q R�T
�T boovtrueg hih o   R S�S�S 0 textencoding textEncodingi j�Rj l  S Tk�Q�Pk m   S T�O
�O 
obj �Q  �P  �R  �V  b o   O P�N�N 0 
asocstring 
asocString` J      ll mnm o      �M�M 0 
didsucceed 
didSucceedn o�Lo o      �K�K 0 theerror theError�L  ^ p�Jp Z   l �qr�I�Hq H   l nss o   l m�G�G 0 
didsucceed 
didSucceedr R   q ��Ftu
�F .ascrerr ****      � ****t l  � �v�E�Dv c   � �wxw n  � �yzy I   � ��C�B�A�C ,0 localizeddescription localizedDescription�B  �A  z o   � ��@�@ 0 theerror theErrorx m   � ��?
�? 
ctxt�E  �D  u �>{|
�> 
errn{ n  u z}~} I   v z�=�<�;�= 0 code  �<  �;  ~ o   u v�:�: 0 theerror theError| �9�
�9 
erob o   } ~�8�8 0 thefile theFile� �7��6
�7 
errt� o   � ��5�5 0 datatype dataType�6  �I  �H  �J  �o  : k   � ��� ��� r   � ���� I  � ��4��
�4 .rdwropenshor       file� l  � ���3�2� c   � ���� o   � ��1�1 0 	posixpath 	posixPath� m   � ��0
�0 
psxf�3  �2  � �/��.
�/ 
perm� m   � ��-
�- boovtrue�.  � o      �,�, 0 fh  � ��+� Q   � ����� k   � ��� ��� l  � ����� I  � ��*��
�* .rdwrseofnull���     ****� o   � ��)�) 0 fh  � �(��'
�( 
set2� m   � ��&�&  �'  � e _ important: when overwriting an existing file, make sure its previous contents are erased first   � ��� �   i m p o r t a n t :   w h e n   o v e r w r i t i n g   a n   e x i s t i n g   f i l e ,   m a k e   s u r e   i t s   p r e v i o u s   c o n t e n t s   a r e   e r a s e d   f i r s t� ��� I  � ��%��
�% .rdwrwritnull���     ****� o   � ��$�$ 0 thedata theData� �#��
�# 
refn� o   � ��"�" 0 fh  � �!�� 
�! 
as  � o   � ��� 0 datatype dataType�   � ��� I  � ����
� .rdwrclosnull���     ****� o   � ��� 0 fh  �  � ��� L   � ���  �  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � k   � ��� ��� Q   � ����� I  � ����
� .rdwrclosnull���     ****� o   � ��� 0 fh  �  � R      ���

� .ascrerr ****      � ****�  �
  �  � ��	� R   � ����
� .ascrerr ****      � ****� o   � ��� 0 etext eText� ���
� 
errn� o   � ��� 0 enumber eNumber� ���
� 
erob� o   � ��� 0 efrom eFrom� ���
� 
errt� o   � �� �  
0 eto eTo�  �	  �+  �p   R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I   �	������� 
0 _error  � ��� m   � ��� ���  w r i t e   f i l e� ��� o   � ���� 0 etext eText� ��� o   ���� 0 enumber eNumber� ��� o  ���� 0 efrom eFrom� ���� o  ���� 
0 eto eTo��  ��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   POSIX path manipulation   � ��� 0   P O S I X   p a t h   m a n i p u l a t i o n� ��� l     ��������  ��  ��  � ��� i  2 5��� I     ����
�� .Fil:ConPnull���     ****� o      ���� 0 filepath filePath� ����
�� 
From� |����������  ��  � o      ���� 0 
fromformat 
fromFormat��  � l     ������ m      ��
�� FLCTFLCP��  ��  � �����
�� 
To__� |����������  ��  � o      ���� 0 toformat toFormat��  � l     ������ m      ��
�� FLCTFLCP��  ��  ��  � l   w���� Q    w���� k   a�� ��� Z    ������� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 filepath filePath��  � �� ��
�� 
kocl  m    ��
�� 
ctxt��  ��  ��  � m    ����  � l    r     n    I    ������ ,0 asposixpathparameter asPOSIXPathParameter 	
	 o    ���� 0 filepath filePath
 �� m     �  ��  ��   o    ���� 0 _support   o      ���� 0 	posixpath 	posixPath F @ assume it's a file identifier object (alias, �class furl�, etc)    � �   a s s u m e   i t ' s   a   f i l e   i d e n t i f i e r   o b j e c t   ( a l i a s ,   � c l a s s   f u r l � ,   e t c )��  � l  ! � Z   ! � =  ! $ o   ! "���� 0 
fromformat 
fromFormat m   " #��
�� FLCTFLCP r   ' * o   ' (���� 0 filepath filePath o      ���� 0 	posixpath 	posixPath  =  - 0 o   - .���� 0 
fromformat 
fromFormat m   . /��
�� FLCTFLCH  l  3 ; !"  r   3 ;#$# n   3 9%&% 1   7 9��
�� 
psxp& l  3 7'����' 4   3 7��(
�� 
file( o   5 6���� 0 filepath filePath��  ��  $ o      ���� 0 	posixpath 	posixPath! � � caution: HFS path format is flawed and deprecated everywhere else in OS X (unlike POSIX path format, it can't distinguish between two volumes with the same name), but is still used by AS and a few older scriptable apps so must be supported   " �))�   c a u t i o n :   H F S   p a t h   f o r m a t   i s   f l a w e d   a n d   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X   ( u n l i k e   P O S I X   p a t h   f o r m a t ,   i t   c a n ' t   d i s t i n g u i s h   b e t w e e n   t w o   v o l u m e s   w i t h   t h e   s a m e   n a m e ) ,   b u t   i s   s t i l l   u s e d   b y   A S   a n d   a   f e w   o l d e r   s c r i p t a b l e   a p p s   s o   m u s t   b e   s u p p o r t e d *+* =  > A,-, o   > ?���� 0 
fromformat 
fromFormat- m   ? @��
�� FLCTFLCU+ .��. k   D v// 010 r   D N232 n  D L454 I   G L��6����  0 urlwithstring_ URLWithString_6 7��7 o   G H���� 0 filepath filePath��  ��  5 n  D G898 o   E G���� 0 nsurl NSURL9 m   D E��
�� misccura3 o      ���� 0 asocurl asocURL1 :��: Z  O v;<����; G   O ]=>= =  O R?@? o   O P���� 0 asocurl asocURL@ m   P Q��
�� 
msng> H   U [AA n  U ZBCB I   V Z�������� 0 fileurl fileURL��  ��  C o   U V���� 0 asocurl asocURL< R   ` r��DE
�� .ascrerr ****      � ****D m   n qFF �GG T I n v a l i d   d i r e c t   p a r a m e t e r   ( n o t   a   f i l e   U R L ) .E ��HI
�� 
errnH m   d g�����YI ��J��
�� 
erobJ o   j k���� 0 filepath filePath��  ��  ��  ��  ��   R   y ���KL
�� .ascrerr ****      � ****K m   � �MM �NN f I n v a l i d    f r o m    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .L ��OP
�� 
errnO m   } ������YP ��QR
�� 
erobQ o   � ����� 0 
fromformat 
fromFormatR ��S��
�� 
errtS m   � ���
�� 
enum��   \ V it's a text path in the user-specified format, so convert it to a standard POSIX path    �TT �   i t ' s   a   t e x t   p a t h   i n   t h e   u s e r - s p e c i f i e d   f o r m a t ,   s o   c o n v e r t   i t   t o   a   s t a n d a r d   P O S I X   p a t h� UVU l  � ���WX��  W   sanity check   X �YY    s a n i t y   c h e c kV Z[Z Z  � �\]����\ =   � �^_^ n  � �`a` 1   � ���
�� 
lenga o   � ����� 0 	posixpath 	posixPath_ m   � �����  ] R   � ���bc
�� .ascrerr ****      � ****b m   � �dd �ee L I n v a l i d   d i r e c t   p a r a m e t e r   ( e m p t y   p a t h ) .c ��fg
�� 
errnf m   � ������Yg ��h��
�� 
erobh o   � ����� 0 filepath filePath��  ��  ��  [ iji l  � ���kl��  k ; 5 convert POSIX path text to the requested format/type   l �mm j   c o n v e r t   P O S I X   p a t h   t e x t   t o   t h e   r e q u e s t e d   f o r m a t / t y p ej n��n Z   �aopqro =  � �sts o   � ����� 0 toformat toFormatt m   � ���
�� FLCTFLCPp L   � �uu o   � ����� 0 	posixpath 	posixPathq vwv =  � �xyx o   � ����� 0 toformat toFormaty m   � ���
�� FLCTFLCAw z{z l  � �|}~| L   � � c   � ���� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf� m   � ��
� 
alis} %  returns object of type `alias`   ~ ��� >   r e t u r n s   o b j e c t   o f   t y p e   ` a l i a s `{ ��� =  � ���� o   � ��~�~ 0 toformat toFormat� m   � ��}
�} FLCTFLCX� ��� l  � ����� L   � ��� c   � ���� o   � ��|�| 0 	posixpath 	posixPath� m   � ��{
�{ 
psxf� , & returns object of type `�class furl�`   � ��� L   r e t u r n s   o b j e c t   o f   t y p e   ` � c l a s s   f u r l � `� ��� =  � ���� o   � ��z�z 0 toformat toFormat� m   � ��y
�y FLCTFLCS� ��� l  � ����� L   � ��� N   � ��� n   � ���� 4   � ��x�
�x 
file� l  � ���w�v� c   � ���� c   � ���� o   � ��u�u 0 	posixpath 	posixPath� m   � ��t
�t 
psxf� m   � ��s
�s 
ctxt�w  �v  � 1   � ��r
�r 
ascr�NH returns an _object specifier_ of type 'file'. Caution: unlike alias and �class furl� objects, this is not a true object but may be used by some applications; not to be confused with the deprecated `file specifier` type (�class fss�), although it uses the same `file TEXT` constructor. Furthermore, it uses an HFS path string so suffers the same problems as HFS paths. Also, being a specifier, requires disambiguation when used [e.g.] in an `open` command otherwise command will be dispatched to it instead of target app, e.g. `tell app "TextEdit" to open {fileSpecifierObject}`. Horribly nasty, brittle, and confusing mis-feature, in other words, but supported (though not encouraged) as an option here for sake of compatibility as there's usually some scriptable app or other API in AS that will absolutely refuse to accept anything else.   � ����   r e t u r n s   a n   _ o b j e c t   s p e c i f i e r _   o f   t y p e   ' f i l e ' .   C a u t i o n :   u n l i k e   a l i a s   a n d   � c l a s s   f u r l �   o b j e c t s ,   t h i s   i s   n o t   a   t r u e   o b j e c t   b u t   m a y   b e   u s e d   b y   s o m e   a p p l i c a t i o n s ;   n o t   t o   b e   c o n f u s e d   w i t h   t h e   d e p r e c a t e d   ` f i l e   s p e c i f i e r `   t y p e   ( � c l a s s   f s s � ) ,   a l t h o u g h   i t   u s e s   t h e   s a m e   ` f i l e   T E X T `   c o n s t r u c t o r .   F u r t h e r m o r e ,   i t   u s e s   a n   H F S   p a t h   s t r i n g   s o   s u f f e r s   t h e   s a m e   p r o b l e m s   a s   H F S   p a t h s .   A l s o ,   b e i n g   a   s p e c i f i e r ,   r e q u i r e s   d i s a m b i g u a t i o n   w h e n   u s e d   [ e . g . ]   i n   a n   ` o p e n `   c o m m a n d   o t h e r w i s e   c o m m a n d   w i l l   b e   d i s p a t c h e d   t o   i t   i n s t e a d   o f   t a r g e t   a p p ,   e . g .   ` t e l l   a p p   " T e x t E d i t "   t o   o p e n   { f i l e S p e c i f i e r O b j e c t } ` .   H o r r i b l y   n a s t y ,   b r i t t l e ,   a n d   c o n f u s i n g   m i s - f e a t u r e ,   i n   o t h e r   w o r d s ,   b u t   s u p p o r t e d   ( t h o u g h   n o t   e n c o u r a g e d )   a s   a n   o p t i o n   h e r e   f o r   s a k e   o f   c o m p a t i b i l i t y   a s   t h e r e ' s   u s u a l l y   s o m e   s c r i p t a b l e   a p p   o r   o t h e r   A P I   i n   A S   t h a t   w i l l   a b s o l u t e l y   r e f u s e   t o   a c c e p t   a n y t h i n g   e l s e .� ��� =  � ��� o   � ��q�q 0 toformat toFormat� m   � ��p
�p FLCTFLCH� ��� L  �� c  
��� c  ��� o  �o�o 0 	posixpath 	posixPath� m  �n
�n 
psxf� m  	�m
�m 
ctxt� ��� = ��� o  �l�l 0 toformat toFormat� m  �k
�k FLCTFLCU� ��j� k  F�� ��� r  ��� n ��� I  �i��h�i $0 fileurlwithpath_ fileURLWithPath_� ��g� o  �f�f 0 	posixpath 	posixPath�g  �h  � n ��� o  �e�e 0 nsurl NSURL� m  �d
�d misccura� o      �c�c 0 asocurl asocURL� ��� Z  =���b�a� = "��� o   �`�` 0 asocurl asocURL� m   !�_
�_ 
msng� R  %9�^��
�^ .ascrerr ****      � ****� b  38��� m  36�� ��� f C o u l d n ' t   c o n v e r t   t h e   f o l l o w i n g   p a t h   t o   a   f i l e   U R L :  � o  67�]�] 0 	posixpath 	posixPath� �\��
�\ 
errn� m  ),�[�[�Y� �Z��Y
�Z 
erob� o  /0�X�X 0 filepath filePath�Y  �b  �a  � ��W� L  >F�� c  >E��� l >C��V�U� n >C��� I  ?C�T�S�R�T  0 absolutestring absoluteString�S  �R  � o  >?�Q�Q 0 asocurl asocURL�V  �U  � m  CD�P
�P 
ctxt�W  �j  r R  Ia�O��
�O .ascrerr ****      � ****� m  ]`�� ��� b I n v a l i d    t o    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .� �N��
�N 
errn� m  MP�M�M�Y� �L��
�L 
erob� o  ST�K�K 0 toformat toFormat� �J��I
�J 
errt� m  WZ�H
�H 
enum�I  ��  � R      �G��
�G .ascrerr ****      � ****� o      �F�F 0 etext eText� �E��
�E 
errn� o      �D�D 0 enumber eNumber� �C��
�C 
erob� o      �B�B 0 efrom eFrom� �A��@
�A 
errt� o      �?�? 
0 eto eTo�@  � I  iw�>��=�> 
0 _error  � ��� m  jm�� ���  c o n v e r t   p a t h� ��� o  mn�<�< 0 etext eText� ��� o  no�;�; 0 enumber eNumber� ��� o  op�:�: 0 efrom eFrom� ��9� o  pq�8�8 
0 eto eTo�9  �=  � x r brings a modicum of sanity to the horrible mess that is AppleScript's file path formats and file identifier types   � ��� �   b r i n g s   a   m o d i c u m   o f   s a n i t y   t o   t h e   h o r r i b l e   m e s s   t h a t   i s   A p p l e S c r i p t ' s   f i l e   p a t h   f o r m a t s   a n d   f i l e   i d e n t i f i e r   t y p e s� ��� l     �7�6�5�7  �6  �5  � ��� l     �4�3�2�4  �3  �2  � ��� i  6 9��� I     �1��
�1 .Fil:NorPnull���     ****� o      �0�0 0 filepath filePath� �/��.
�/ 
ExpR� |�-�,��+ �-  �,  � o      �*�* 0 isexpanding isExpanding�+    l     �)�( m      �'
�' boovfals�)  �(  �.  � Q     R k    @  r    	 n   

 I    �&�%�& ,0 asposixpathparameter asPOSIXPathParameter  o    	�$�$ 0 filepath filePath �# m   	 
 �  �#  �%   o    �"�" 0 _support  	 o      �!�! 0 filepath filePath  Z    0� � F     o    �� 0 isexpanding isExpanding H     C     o    �� 0 filepath filePath m     �  / r    , I   *��
� .Fil:JoiPnull���     **** J    &   !"! I   #���
� .Fil:CurFnull��� ��� null�  �  " #�# o   # $�� 0 filepath filePath�  �   o      �� 0 filepath filePath�   �   $�$ L   1 @%% c   1 ?&'& l  1 =(��( n  1 =)*) I   9 =���� 60 stringbystandardizingpath stringByStandardizingPath�  �  * l  1 9+��+ n  1 9,-, I   4 9�.�� &0 stringwithstring_ stringWithString_. /�
/ o   4 5�	�	 0 filepath filePath�
  �  - n  1 4010 o   2 4�� 0 nsstring NSString1 m   1 2�
� misccura�  �  �  �  ' m   = >�
� 
ctxt�   R      �23
� .ascrerr ****      � ****2 o      �� 0 etext eText3 �45
� 
errn4 o      �� 0 enumber eNumber5 �6� 
� 
errt6 o      ���� 
0 eto eTo�    I   H R��7���� 
0 _error  7 898 m   I J:: �;;  n o r m a l i z e   p a t h9 <=< o   J K���� 0 etext eText= >?> o   K L���� 0 enumber eNumber? @A@ o   L M���� 0 filepath filePathA B��B o   M N���� 
0 eto eTo��  ��  � CDC l     ��������  ��  ��  D EFE l     ��������  ��  ��  F GHG i  : =IJI I     ��KL
�� .Fil:JoiPnull���     ****K o      ����  0 pathcomponents pathComponentsL ��M��
�� 
ExteM |����N��O��  ��  N o      ���� 0 fileextension fileExtension��  O l     P����P m      QQ �RR  ��  ��  ��  J Q     �STUS k    �VV WXW r    YZY n    [\[ 2   ��
�� 
cobj\ n   ]^] I    ��_���� "0 aslistparameter asListParameter_ `a` o    	����  0 pathcomponents pathComponentsa b��b m   	 
cc �dd  ��  ��  ^ o    ���� 0 _support  Z o      ���� 0 subpaths subPathsX efe Q    \ghig k    Ljj klk Z   %mn����m =   opo o    ���� 0 subpaths subPathsp J    ����  n R    !������
�� .ascrerr ****      � ****��  ��  ��  ��  l q��q X   & Lr��sr r   6 Gtut n  6 Cvwv I   ; C��x���� ,0 asposixpathparameter asPOSIXPathParameterx yzy n  ; >{|{ 1   < >��
�� 
pcnt| o   ; <���� 0 aref aRefz }��} m   > ?~~ �  ��  ��  w o   6 ;���� 0 _support  u n     ��� 1   D F��
�� 
pcnt� o   C D���� 0 aref aRef�� 0 aref aRefs o   ) *���� 0 subpaths subPaths��  h R      ������
�� .ascrerr ****      � ****��  ��  i R   T \����
�� .ascrerr ****      � ****� m   Z [�� ��� � I n v a l i d   p a t h   c o m p o n e n t s   l i s t   ( e x p e c t e d   o n e   o r   m o r e   t e x t   a n d / o r   f i l e   i t e m s ) .� ����
�� 
errn� m   V W�����Y� �����
�� 
erob� o   X Y����  0 pathcomponents pathComponents��  f ��� r   ] i��� l  ] g������ n  ] g��� I   b g������� *0 pathwithcomponents_ pathWithComponents_� ���� o   b c���� 0 subpaths subPaths��  ��  � n  ] b��� o   ^ b���� 0 nsstring NSString� m   ] ^��
�� misccura��  ��  � o      ���� 0 asocpath asocPath� ��� r   j y��� n  j w��� I   o w������� "0 astextparameter asTextParameter� ��� o   o p���� 0 fileextension fileExtension� ���� m   p s�� ��� ( u s i n g   f i l e   e x t e n s i o n��  ��  � o   j o���� 0 _support  � o      ���� 0 fileextension fileExtension� ��� Z   z �������� >   z ���� n  z ��� 1   { ��
�� 
leng� o   z {���� 0 fileextension fileExtension� m    �����  � k   � ��� ��� r   � ���� n  � ���� I   � �������� B0 stringbyappendingpathextension_ stringByAppendingPathExtension_� ���� o   � ����� 0 fileextension fileExtension��  ��  � o   � ����� 0 asocpath asocPath� o      ���� 0 asocpath asocPath� ���� Z  � �������� =  � ���� o   � ����� 0 asocpath asocPath� m   � ���
�� 
msng� R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� . I n v a l i d   f i l e   e x t e n s i o n .� ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 fileextension fileExtension��  ��  ��  ��  ��  ��  � ���� L   � ��� c   � ���� o   � ����� 0 asocpath asocPath� m   � ���
�� 
ctxt��  T R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  U I   � �������� 
0 _error  � ��� m   � ��� ���  j o i n   p a t h� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  H ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  > A��� I     ����
�� .Fil:SplPnull���     ctxt� o      ���� 0 filepath filePath� �����
�� 
Upon� |����������  ��  � o      ���� 0 splitposition splitPosition��  � l     ���~� m      �}
�} FLSPFLSL�  �~  ��  � Q     ����� k    s�� ��� r    ��� n   ��� I    �|��{�| &0 stringwithstring_ stringWithString_� ��z� l   ��y�x� n   ��� I    �w��v�w ,0 asposixpathparameter asPOSIXPathParameter� ��� o    �u�u 0 filepath filePath� ��t� m    �� ���  �t  �v  � o    �s�s 0 _support  �y  �x  �z  �{  � n   ��� o    �r�r 0 nsstring NSString� m    �q
�q misccura� o      �p�p 0 asocpath asocPath� ��o� Z    s����� =   ��� o    �n�n 0 splitposition splitPosition� m    �m
�m FLSPFLSL� L    /   J    .  c    % l   #�l�k n   # I    #�j�i�h�j F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent�i  �h   o    �g�g 0 asocpath asocPath�l  �k   m   # $�f
�f 
ctxt 	�e	 c   % ,

 l  % *�d�c n  % * I   & *�b�a�`�b &0 lastpathcomponent lastPathComponent�a  �`   o   % &�_�_ 0 asocpath asocPath�d  �c   m   * +�^
�^ 
ctxt�e  �  =  2 5 o   2 3�]�] 0 splitposition splitPosition m   3 4�\
�\ FLSPFLSE  L   8 I J   8 H  c   8 ? l  8 =�[�Z n  8 = I   9 =�Y�X�W�Y >0 stringbydeletingpathextension stringByDeletingPathExtension�X  �W   o   8 9�V�V 0 asocpath asocPath�[  �Z   m   = >�U
�U 
ctxt �T c   ? F  l  ? D!�S�R! n  ? D"#" I   @ D�Q�P�O�Q 0 pathextension pathExtension�P  �O  # o   ? @�N�N 0 asocpath asocPath�S  �R    m   D E�M
�M 
ctxt�T   $%$ =  L O&'& o   L M�L�L 0 splitposition splitPosition' m   M N�K
�K FLSPFLSA% (�J( L   R Z)) c   R Y*+* l  R W,�I�H, n  R W-.- I   S W�G�F�E�G  0 pathcomponents pathComponents�F  �E  . o   R S�D�D 0 asocpath asocPath�I  �H  + m   W X�C
�C 
list�J  � R   ] s�B/0
�B .ascrerr ****      � ****/ m   o r11 �22 b I n v a l i d    a t    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .0 �A34
�A 
errn3 m   _ b�@�@�Y4 �?56
�? 
erob5 o   e f�>�> 0 matchformat matchFormat6 �=7�<
�= 
errt7 m   i l�;
�; 
enum�<  �o  � R      �:89
�: .ascrerr ****      � ****8 o      �9�9 0 etext eText9 �8:;
�8 
errn: o      �7�7 0 enumber eNumber; �6<=
�6 
erob< o      �5�5 0 efrom eFrom= �4>�3
�4 
errt> o      �2�2 
0 eto eTo�3  � I   { ��1?�0�1 
0 _error  ? @A@ m   | BB �CC  s p l i t   p a t hA DED o    ��/�/ 0 etext eTextE FGF o   � ��.�. 0 enumber eNumberG HIH o   � ��-�- 0 efrom eFromI J�,J o   � ��+�+ 
0 eto eTo�,  �0  � KLK l     �*�)�(�*  �)  �(  L MNM l     �'�&�%�'  �&  �%  N OPO l     �$QR�$  Q J D--------------------------------------------------------------------   R �SS � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -P TUT l     �#VW�#  V S M Shell Script Support handlers for use in AppleScripts that run via osascript   W �XX �   S h e l l   S c r i p t   S u p p o r t   h a n d l e r s   f o r   u s e   i n   A p p l e S c r i p t s   t h a t   r u n   v i a   o s a s c r i p tU YZY l     �"�!� �"  �!  �   Z [\[ l     ]^_] j   B F�`�  0 _argvusererror _ArgvUserError` m   B E��'^�� error code used to indicate the shell script's user supplied invalid command line options (errors due to bugs in invalid option/argument definitions supplied by shell script author use standard AS error codes); need to decide what's a sensible code to use and document it in SDEF (unfortunately, `on error number ...` blocks only accept literal integer (for pattern matching) or identifier (for assignment) and don't allow a command as parameter, so there's no way to supply library-defined error numbers as 'named constants' via library-defined commands, e.g. `on error number (command line user error)`, that return the appropriate number)   _ �aa   e r r o r   c o d e   u s e d   t o   i n d i c a t e   t h e   s h e l l   s c r i p t ' s   u s e r   s u p p l i e d   i n v a l i d   c o m m a n d   l i n e   o p t i o n s   ( e r r o r s   d u e   t o   b u g s   i n   i n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n s   s u p p l i e d   b y   s h e l l   s c r i p t   a u t h o r   u s e   s t a n d a r d   A S   e r r o r   c o d e s ) ;   n e e d   t o   d e c i d e   w h a t ' s   a   s e n s i b l e   c o d e   t o   u s e   a n d   d o c u m e n t   i t   i n   S D E F   ( u n f o r t u n a t e l y ,   ` o n   e r r o r   n u m b e r   . . . `   b l o c k s   o n l y   a c c e p t   l i t e r a l   i n t e g e r   ( f o r   p a t t e r n   m a t c h i n g )   o r   i d e n t i f i e r   ( f o r   a s s i g n m e n t )   a n d   d o n ' t   a l l o w   a   c o m m a n d   a s   p a r a m e t e r ,   s o   t h e r e ' s   n o   w a y   t o   s u p p l y   l i b r a r y - d e f i n e d   e r r o r   n u m b e r s   a s   ' n a m e d   c o n s t a n t s '   v i a   l i b r a r y - d e f i n e d   c o m m a n d s ,   e . g .   ` o n   e r r o r   n u m b e r   ( c o m m a n d   l i n e   u s e r   e r r o r ) ` ,   t h a t   r e t u r n   t h e   a p p r o p r i a t e   n u m b e r )\ bcb l     ����  �  �  c ded h   G R�f� 0 novalue NoValuef l     �gh�  g J D unique constant used to indicate no defaultValue property was given   h �ii �   u n i q u e   c o n s t a n t   u s e d   t o   i n d i c a t e   n o   d e f a u l t V a l u e   p r o p e r t y   w a s   g i v e ne jkj l     ����  �  �  k lml j   S [�n� 
0 lf2 LF2n b   S Zopo 1   S V�
� 
lnfdp 1   V Y�
� 
lnfdm qrq j   \ `�s� 0 indent1 Indent1s m   \ _tt �uu     r vwv j   a e�x� 0 indent2 Indent2x m   a dyy �zz             w {|{ l     ����  �  �  | }~} l     ����  �  �  ~ � l     �
�	��
  �	  �  � ��� i  f i��� I      ���� 0 vt100 VT100� ��� o      �� 0 
formatcode 
formatCode�  �  � k     �� ��� l      ����  �F@ Returns a magic character sequence that will apply the specified formatting or other control operation in Terminal.app and other VT100 terminal emulators. Multiple codes may be given as semicolon-separated numeric text, e.g. "1;7". Commonly used style codes are:
	
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
	   � ����   R e t u r n s   a   m a g i c   c h a r a c t e r   s e q u e n c e   t h a t   w i l l   a p p l y   t h e   s p e c i f i e d   f o r m a t t i n g   o r   o t h e r   c o n t r o l   o p e r a t i o n   i n   T e r m i n a l . a p p   a n d   o t h e r   V T 1 0 0   t e r m i n a l   e m u l a t o r s .   M u l t i p l e   c o d e s   m a y   b e   g i v e n   a s   s e m i c o l o n - s e p a r a t e d   n u m e r i c   t e x t ,   e . g .   " 1 ; 7 " .   C o m m o n l y   u s e d   s t y l e   c o d e s   a r e : 
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
 	� ��� L     �� b     ��� b     	��� b     ��� l    ��� � 5     �����
�� 
cha � m    ���� 
�� kfrmID  �  �   � m    �� ���  [� o    ���� 0 
formatcode 
formatCode� m   	 
�� ���  m�  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  � - ' convert raw args to supported AS types   � ��� N   c o n v e r t   r a w   a r g s   t o   s u p p o r t e d   A S   t y p e s� ��� l     ��������  ��  ��  � ��� i  j m��� I      ������� 0 _unpackvalue _unpackValue� ��� o      ���� 0 thevalue theValue� ���� o      ���� $0 definitionrecord definitionRecord��  ��  � k    ��� ��� l     ������  � � � note that only ASOC-friendly AS types are supported here since NSDictionaries are used as temporary storage for parsed options and arguments   � ���   n o t e   t h a t   o n l y   A S O C - f r i e n d l y   A S   t y p e s   a r e   s u p p o r t e d   h e r e   s i n c e   N S D i c t i o n a r i e s   a r e   u s e d   a s   t e m p o r a r y   s t o r a g e   f o r   p a r s e d   o p t i o n s   a n d   a r g u m e n t s� ��� r     ��� c     ��� n    ��� o    ���� 0 	valuetype 	valueType� o     ���� $0 definitionrecord definitionRecord� m    ��
�� 
type� o      ���� 0 	valuetype 	valueType� ��� Z   ������ =   ��� o    	���� 0 	valuetype 	valueType� m   	 
��
�� 
ctxt� r    ��� o    ���� 0 thevalue theValue� o      ���� 0 	theresult 	theResult� ��� E   ��� J    �� ��� m    ��
�� 
long� ��� m    ��
�� 
doub� ���� m    ��
�� 
nmbr��  � J    �� ���� o    ���� 0 	valuetype 	valueType��  � ��� l    ����� k     ��� ��� r     -��� n    +��� I   ' +�������� 0 init  ��  ��  � n    '��� I   # '�������� 	0 alloc  ��  ��  � n    #��� o   ! #���� &0 nsnumberformatter NSNumberFormatter� m     !��
�� misccura� o      ���� 0 asocformatter asocFormatter� ��� n  . 6��� I   / 6������� "0 setnumberstyle_ setNumberStyle_� ���� l  / 2������ n  / 2��� o   0 2���� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m   / 0��
�� misccura��  ��  ��  ��  � o   . /���� 0 asocformatter asocFormatter� ��� n  7 C��� I   8 C������� 0 
setlocale_ 
setLocale_� ���� l  8 ?������ n  8 ?��� I   ; ?�������� 0 systemlocale systemLocale��  ��  � n  8 ;��� o   9 ;���� 0 nslocale NSLocale� m   8 9��
�� misccura��  ��  ��  ��  � o   7 8���� 0 asocformatter asocFormatter� ��� r   D L��� n  D J��� I   E J������� &0 numberfromstring_ numberFromString_�  ��  o   E F���� 0 thevalue theValue��  ��  � o   D E���� 0 asocformatter asocFormatter� o      ���� 0 
asocresult 
asocResult�  Z  M i���� =  M R o   M N���� 0 
asocresult 
asocResult m   N Q��
�� 
msng R   U e��
�� .ascrerr ****      � **** b   _ d	
	 m   _ b � ( N o t   a   v a l i d   n u m b e r :  
 o   b c���� 0 thevalue theValue ����
�� 
errn o   Y ^����  0 _argvusererror _ArgvUserError��  ��  ��    r   j q c   j o o   j k���� 0 
asocresult 
asocResult m   k n��
�� 
**** o      ���� 0 	theresult 	theResult �� Z   r ����� =  r u o   r s���� 0 	valuetype 	valueType m   s t��
�� 
long k   x �  Z  x ����� >   x } `   x { !  o   x y���� 0 	theresult 	theResult! m   y z����  m   { |����   R   � ���"#
�� .ascrerr ****      � ****" b   � �$%$ m   � �&& �'' * N o t   a   v a l i d   i n t e g e r :  % o   � ����� 0 thevalue theValue# ��(��
�� 
errn( o   � �����  0 _argvusererror _ArgvUserError��  ��  ��   )��) r   � �*+* c   � �,-, o   � ����� 0 	theresult 	theResult- m   � ���
�� 
long+ o      ���� 0 	theresult 	theResult��  ��  ��  ��  � 6 0 note: decimal numbers must be in canonical form   � �.. `   n o t e :   d e c i m a l   n u m b e r s   m u s t   b e   i n   c a n o n i c a l   f o r m� /0/ E  � �121 J   � �33 454 m   � ���
�� 
furl5 676 m   � ���
�� 
alis7 898 m   � ���
�� 
file9 :��: m   � ���
�� 
psxf��  2 J   � �;; <��< o   � ����� 0 	valuetype 	valueType��  0 =>= l  �G?@A? k   �GBB CDC l  � ���EF��  E   expand/normalize path   F �GG ,   e x p a n d / n o r m a l i z e   p a t hD HIH Z   �JK����J H   � �LL C   � �MNM o   � ����� 0 thevalue theValueN m   � �OO �PP  /K k   � �QQ RSR r   � �TUT n  � �VWV I   � ��������� ,0 currentdirectorypath currentDirectoryPath��  ��  W n  � �XYX I   � ���������  0 defaultmanager defaultManager��  ��  Y n  � �Z[Z o   � ����� 0 nsfilemanager NSFileManager[ m   � ���
�� misccuraU o      ���� 0 basepath basePathS \]\ Z  � �^_����^ =  � �`a` o   � ����� 0 basepath basePatha m   � ���
�� 
msng_ R   � ���bc
�� .ascrerr ****      � ****b b   � �ded m   � �ff �gg � C a n ' t   e x p a n d   r e l a t i v e   f i l e   p a t h   ( c u r r e n t   w o r k i n g   d i r e c t o r y   i s   u n k n o w n ) :  e o   � ����� 0 thevalue theValuec ��h��
�� 
errnh o   � �����  0 _argvusererror _ArgvUserError��  ��  ��  ] i��i r   � �jkj l  � �l���l n  � �mnm I   � ��~o�}�~ *0 pathwithcomponents_ pathWithComponents_o p�|p J   � �qq rsr o   � ��{�{ 0 basepath basePaths t�zt o   � ��y�y 0 thevalue theValue�z  �|  �}  n n  � �uvu o   � ��x�x 0 nsstring NSStringv m   � ��w
�w misccura��  �  k o      �v�v 0 thevalue theValue��  ��  ��  I wxw r  yzy c  {|{ c  }~} l �u�t n ��� I  �s�r�q�s 60 stringbystandardizingpath stringByStandardizingPath�r  �q  � l ��p�o� n ��� I  �n��m�n &0 stringwithstring_ stringWithString_� ��l� o  �k�k 0 thevalue theValue�l  �m  � n ��� o  �j�j 0 nsstring NSString� m  �i
�i misccura�p  �o  �u  �t  ~ m  �h
�h 
ctxt| m  �g
�g 
psxfz o      �f�f 0 	theresult 	theResultx ��e� Q  G���� Z /���d�c� = !��� o  �b�b 0 	valuetype 	valueType� m   �a
�a 
alis� r  $+��� c  $)��� o  $%�`�` 0 	theresult 	theResult� m  %(�_
�_ 
alis� o      �^�^ 0 	theresult 	theResult�d  �c  � R      �]�\�
�] .ascrerr ****      � ****�\  � �[��Z
�[ 
errn� d      �� m      �Y�Y +�Z  � l 7G���� R  7G�X��
�X .ascrerr ****      � ****� b  AF��� m  AD�� ��� 2 F i l e   p a t h   d o e s n  t   e x i s t :  � o  DE�W�W 0 thevalue theValue� �V��U
�V 
errn� o  ;@�T�T  0 _argvusererror _ArgvUserError�U  �   file not found   � ���    f i l e   n o t   f o u n d�e  @ � � note: `file` is treated as synonym for `POSIX file` here, as actual 'file' object specifiers are both mostly pointless and much more problematic due to using HFS paths   A ���P   n o t e :   ` f i l e `   i s   t r e a t e d   a s   s y n o n y m   f o r   ` P O S I X   f i l e `   h e r e ,   a s   a c t u a l   ' f i l e '   o b j e c t   s p e c i f i e r s   a r e   b o t h   m o s t l y   p o i n t l e s s   a n d   m u c h   m o r e   p r o b l e m a t i c   d u e   t o   u s i n g   H F S   p a t h s> ��� = JO��� o  JK�S�S 0 	valuetype 	valueType� m  KN�R
�R 
bool� ��Q� l R����� P  R���P�� Z  Y������ E Yp��� J  Yl�� ��� m  Y\�� ���  t r u e� ��� m  \_�� ���  y e s� ��� m  _b�� ���  t� ��� m  be�� ���  y� ��O� m  eh�� ���  1�O  � J  lo�� ��N� o  lm�M�M 0 thevalue theValue�N  � L  su�� m  st�L
�L boovtrue� ��� E x���� J  x��� ��� m  x{�� ��� 
 f a l s e� ��� m  {~�� ���  n o� ��� m  ~��� ���  f� ��� m  ���� ���  n� ��K� m  ���� ���  0�K  � J  ���� ��J� o  ���I�I 0 thevalue theValue�J  � ��H� L  ���� m  ���G
�G boovfals�H  � R  ���F��
�F .ascrerr ****      � ****� b  ����� m  ���� ��� 2 N o t    y e s    o r    n o    ( Y | N ) :  � o  ���E�E 0 thevalue theValue� �D��C
�D 
errn� o  ���B�B  0 _argvusererror _ArgvUserError�C  �P  � �A�@
�A conscase�@  � W Q may be used by boolean argument definitions (boolean options don't take a value)   � ��� �   m a y   b e   u s e d   b y   b o o l e a n   a r g u m e n t   d e f i n i t i o n s   ( b o o l e a n   o p t i o n s   d o n ' t   t a k e   a   v a l u e )�Q  � R  ���?��
�? .ascrerr ****      � ****� m  ���� ��� r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) .� �>��
�> 
errn� m  ���=�=�Y� �<��
�< 
erob� l ����;�:� N  ���� n  ����� o  ���9�9 0 	valuetype 	valueType� o  ���8�8 $0 definitionrecord definitionRecord�;  �:  � �7��6
�7 
errt� m  ���5
�5 
type�6  � ��4� L  ���� o  ���3�3 0 	theresult 	theResult�4  � ��� l     �2�1�0�2  �1  �0  �    l     �/�.�-�/  �.  �-    i  n q I      �,�+�, 40 _defaultvalueplaceholder _defaultValuePlaceholder �* o      �)�) $0 definitionrecord definitionRecord�*  �+   l    g	
 k     g  r      c      n     o    �(�( 0 	valuetype 	valueType o     �'�' $0 definitionrecord definitionRecord m    �&
�& 
type o      �%�% 0 	valuetype 	valueType  l   �$�$   ^ X note: the following conditional block should implement same branches as in _unpackValue    � �   n o t e :   t h e   f o l l o w i n g   c o n d i t i o n a l   b l o c k   s h o u l d   i m p l e m e n t   s a m e   b r a n c h e s   a s   i n   _ u n p a c k V a l u e �# Z    g =    o    	�"�" 0 	valuetype 	valueType m   	 
�!
�! 
ctxt L       m    !! �""  T E X T #$# E   %&% J    '' ()( m    � 
�  
long) *+* m    �
� 
doub+ ,�, m    �
� 
nmbr�  & J    -- .�. o    �� 0 	valuetype 	valueType�  $ /0/ Z    ,12�31 =   "454 o     �� 0 	valuetype 	valueType5 m     !�
� 
long2 L   % '66 m   % &77 �88  I N T E G E R�  3 L   * ,99 m   * +:: �;;  N U M B E R0 <=< E  / 9>?> J   / 5@@ ABA m   / 0�
� 
furlB CDC m   0 1�
� 
alisD EFE m   1 2�
� 
fileF G�G m   2 3�
� 
psxf�  ? J   5 8HH I�I o   5 6�� 0 	valuetype 	valueType�  = JKJ L   < >LL m   < =MM �NN  F I L EK OPO =  A DQRQ o   A B�� 0 	valuetype 	valueTypeR m   B C�
� 
boolP S�S L   G KTT m   G JUU �VV  Y | N�   R   N g�WX
� .ascrerr ****      � ****W m   c fYY �ZZ r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) .X �[\
� 
errn[ m   R U���Y\ �
]^
�
 
erob] l  X \_�	�_ N   X \`` n   X [aba o   Y [�� 0 	valuetype 	valueTypeb o   X Y�� $0 definitionrecord definitionRecord�	  �  ^ �c�
� 
errtc m   _ `�
� 
type�  �#  	 J D returns appropriate default placeholderValue according to valueType   
 �dd �   r e t u r n s   a p p r o p r i a t e   d e f a u l t   p l a c e h o l d e r V a l u e   a c c o r d i n g   t o   v a l u e T y p e efe l     ��� �  �  �   f ghg l     ��������  ��  ��  h iji i  r uklk I      ��m���� *0 _formatdefaultvalue _formatDefaultValuem n��n o      ���� $0 definitionrecord definitionRecord��  ��  l l    �opqo k     �rr sts r     uvu n     wxw o    ���� 0 defaultvalue defaultValuex o     ���� $0 definitionrecord definitionRecordv o      ���� 0 defaultvalue defaultValuet yzy Z   ({|����{ F    }~} >    � l   ������ I   ����
�� .corecnte****       ****� J    	�� ���� o    ���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   
 ��
�� 
list��  ��  ��  � m    ����  ~ =    ��� n    ��� 1    ��
�� 
leng� o    ���� 0 defaultvalue defaultValue� m    ���� | r    $��� n    "��� 4    "���
�� 
cobj� m     !���� � o    ���� 0 defaultvalue defaultValue� o      ���� 0 defaultvalue defaultValue��  ��  z ��� Z   ) ������ >   ) 4��� l  ) 2������ I  ) 2����
�� .corecnte****       ****� J   ) ,�� ���� o   ) *���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   - .��
�� 
ctxt��  ��  ��  � m   2 3����  � r   7 :��� o   7 8���� 0 defaultvalue defaultValue� o      ���� 0 defaulttext defaultText� ��� G   = X��� >   = H��� l  = F������ I  = F����
�� .corecnte****       ****� J   = @�� ���� o   = >���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   A B��
�� 
long��  ��  ��  � m   F G����  � >   K V��� l  K T������ I  K T����
�� .corecnte****       ****� J   K N�� ���� o   K L���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   O P��
�� 
doub��  ��  ��  � m   T U����  � ��� k   [ ��� ��� r   [ h��� n  [ f��� I   b f�������� 0 init  ��  ��  � n  [ b��� I   ^ b�������� 	0 alloc  ��  ��  � n  [ ^��� o   \ ^���� &0 nsnumberformatter NSNumberFormatter� m   [ \��
�� misccura� o      ���� 0 asocformatter asocFormatter� ��� n  i q��� I   j q������� "0 setnumberstyle_ setNumberStyle_� ���� l  j m������ n  j m��� o   k m���� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� m   j k��
�� misccura��  ��  ��  ��  � o   i j���� 0 asocformatter asocFormatter� ��� n  r ���� I   s �������� 0 
setlocale_ 
setLocale_� ���� l  s |������ n  s |��� I   x |�������� 0 systemlocale systemLocale��  ��  � n  s x��� o   t x���� 0 nslocale NSLocale� m   s t��
�� misccura��  ��  ��  ��  � o   r s���� 0 asocformatter asocFormatter� ���� r   � ���� c   � ���� l  � ������� n  � ���� I   � �������� &0 stringfromnumber_ stringFromNumber_� ���� o   � ����� 0 defaultvalue defaultValue��  ��  � o   � ����� 0 asocformatter asocFormatter��  ��  � m   � ���
�� 
****� o      ���� 0 defaulttext defaultText��  � ��� G   � ���� >   � ���� l  � ������� I  � �����
�� .corecnte****       ****� J   � ��� ���� o   � ����� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   � ���
�� 
furl��  ��  ��  � m   � �����  � >   � ���� l  � ������� I  � �����
�� .corecnte****       ****� J   � ��� ���� o   � ����� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   � ���
�� 
alis��  ��  ��  � m   � �����  � ��� r   � ���� n   � ���� 1   � ���
�� 
psxp� o   � ����� 0 defaultvalue defaultValue� o      ���� 0 defaulttext defaultText� ��� =  � ���� o   � ����� 0 defaultvalue defaultValue� m   � ���
�� boovtrue� ��� r   � �� � m   � � �  Y  o      ���� 0 defaulttext defaultText�  =  � � o   � ����� 0 defaultvalue defaultValue m   � ���
�� boovfals �� r   � �	 m   � �

 �  N	 o      ���� 0 defaulttext defaultText��  � L   � � m   � � �  � �� L   � � b   � � b   � � m   � � �  D e f a u l t :    o   � ����� 0 defaulttext defaultText m   � � �    ��  p G A formats default value for inclusion in OPTIONS/ARGUMENTS section   q � �   f o r m a t s   d e f a u l t   v a l u e   f o r   i n c l u s i o n   i n   O P T I O N S / A R G U M E N T S   s e c t i o nj  l     ��������  ��  ��    l     ��    -----    �   
 - - - - - !"! l     �~#$�~  #   parse ARGV   $ �%%    p a r s e   A R G V" &'& l     �}�|�{�}  �|  �{  ' ()( i  v y*+* I      �z,�y�z (0 _buildoptionstable _buildOptionsTable, -�x- o      �w�w &0 optiondefinitions optionDefinitions�x  �y  + k    �.. /0/ l     �v12�v  1 � � create a case-sensitive lookup table of all short and long option names (e.g. "-a", "-A", "-o", "--output-file", etc); used by _parseOptions() to retrieve the definition record for each option it encounters   2 �33�   c r e a t e   a   c a s e - s e n s i t i v e   l o o k u p   t a b l e   o f   a l l   s h o r t   a n d   l o n g   o p t i o n   n a m e s   ( e . g .   " - a " ,   " - A " ,   " - o " ,   " - - o u t p u t - f i l e " ,   e t c ) ;   u s e d   b y   _ p a r s e O p t i o n s ( )   t o   r e t r i e v e   t h e   d e f i n i t i o n   r e c o r d   f o r   e a c h   o p t i o n   i t   e n c o u n t e r s0 454 r     676 J     �u�u  7 o      �t�t 0 
foundnames 
foundNames5 898 r    :;: n   <=< I    �s�r�q�s 0 
dictionary  �r  �q  = n   >?> o    �p�p *0 nsmutabledictionary NSMutableDictionary? m    �o
�o misccura; o      �n�n 20 optiondefinitionsbyname optionDefinitionsByName9 @A@ X   �B�mCB k   �DD EFE l   ;GHIG r    ;JKJ b    9LML l   $N�l�kN c    $OPO n   "QRQ 1     "�j
�j 
pcntR o     �i�i 0 	optionref 	optionRefP m   " #�h
�h 
reco�l  �k  M K   $ 8SS �gTU�g 0 	shortname 	shortNameT m   % &VV �WW  U �fXY�f 0 longname longNameX m   ' (ZZ �[[  Y �e\]�e 0 propertyname propertyName\ m   ) *^^ �__  ] �d`a�d 0 	valuetype 	valueType` m   + ,�c
�c 
ctxta �bbc�b 0 islist isListb m   / 0�a
�a boovfalsc �`d�_�` 0 defaultvalue defaultValued m   3 4�^
�^ boovfals�_  K o      �]�] $0 optiondefinition optionDefinitionH 5 / this defaultValue is only used by boolean opts   I �ee ^   t h i s   d e f a u l t V a l u e   i s   o n l y   u s e d   b y   b o o l e a n   o p t sF fgf Q   < yhijh k   ? _kk lml r   ? Fnon c   ? Dpqp n  ? Brsr o   @ B�\�\ 0 propertyname propertyNames o   ? @�[�[ $0 optiondefinition optionDefinitionq m   B C�Z
�Z 
ctxto o      �Y�Y 0 propertyname propertyNamem t�Xt Z  G _uv�W�Vu =  G Nwxw n  G Jyzy o   H J�U�U 0 propertyname propertyNamez o   G H�T�T $0 optiondefinition optionDefinitionx m   J M{{ �||  v R   Q [�S�R}
�S .ascrerr ****      � ****�R  } �Q~�P
�Q 
errn~ m   U X�O�O�\�P  �W  �V  �X  i R      �N�M
�N .ascrerr ****      � ****�M   �L��K
�L 
errn� d      �� m      �J�J��K  j R   g y�I��
�I .ascrerr ****      � ****� m   u x�� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( p r o p e r t y   n a m e   m u s t   b e   n o n - e m p t y   t e x t ) .� �H��
�H 
errn� m   k n�G�G�Y� �F��E
�F 
erob� o   q r�D�D 0 	optionref 	optionRef�E  g ��� r   z ���� n   z ��� 1   { �C
�C 
leng� o   z {�B�B 0 
foundnames 
foundNames� o      �A�A 0 	namecount 	nameCount� ��� X   ����@�� k   ���� ��� r   � ���� o   � ��?�? 0 aref aRef� J      �� ��� o      �>�> 0 thename theName� ��=� o      �<�< 0 
nameprefix 
namePrefix�=  � ��� Q   � ����� r   � ���� c   � ���� o   � ��;�; 0 thename theName� m   � ��:
�: 
ctxt� o      �9�9 0 thename theName� R      �8�7�
�8 .ascrerr ****      � ****�7  � �6��5
�6 
errn� d      �� m      �4�4��5  � R   � ��3��
�3 .ascrerr ****      � ****� m   � ��� ��� r I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t / l o n g   n a m e   m u s t   b e   t e x t ) .� �2��
�2 
errn� m   � ��1�1�\� �0��/
�0 
erob� o   � ��.�. 0 	optionref 	optionRef�/  � ��-� Z   �����,�+� >  � ���� o   � ��*�* 0 thename theName� m   � ��� ���  � k   ���� ��� Z  � ����)�(� E  � ���� o   � ��'�' 0 
foundnames 
foundNames� J   � ��� ��&� o   � ��%�% 0 thename theName�&  � R   � ��$��
�$ .ascrerr ****      � ****� m   � ��� ��� x I n v a l i d   o p t i o n   d e f i n i t i o n   ( f o u n d   d u p l i c a t e   s h o r t / l o n g   n a m e ) .� �#��
�# 
errn� m   � ��"�"�Y� �!�� 
�! 
erob� o   � ��� 0 	optionref 	optionRef�   �)  �(  � ��� r   ���� o   � ��� 0 thename theName� n      ���  ;   � o   � �� 0 
foundnames 
foundNames� ��� P  ����� Z  
������ =  
��� n 
��� 1  �
� 
leng� o  
�� 0 
nameprefix 
namePrefix� m  �� � l A���� Z A����� l (���� G  (��� >  ��� n ��� 1  �
� 
leng� o  �� 0 thename theName� m  �� � H  $�� E #��� m  !�� ��� 4 a b c d e f g h i j k l m n o p q r s t u v w x y z� o  !"�� 0 thename theName�  �  � R  +=���
� .ascrerr ****      � ****� m  9<�� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t   n a m e   m u s t   b e   a   s i n g l e   A - Z   o r   a - z   c h a r a c t e r ) .� ���
� 
errn� m  /2���Y� ���
� 
erob� o  56�
�
 0 	optionref 	optionRef�  �  �  �   validate short name   � ��� (   v a l i d a t e   s h o r t   n a m e�  � l D����� k  D��� ��� Z D����	�� G  Di��� G  D]��� =  DK��� n DI��� 1  EI�
� 
leng� o  DE�� 0 thename theName� m  IJ��  � H  NY	 	  E NX			 m  NQ		 �		 4 a b c d e f g h i j k l m n o p q r s t u v w x y z	 n QW			 4  RW�	
� 
cha 	 m  UV�� 	 o  QR�� 0 thename theName� D  `e				 o  `a�� 0 thename theName		 m  ad	
	
 �		  -� R  l~� 		
�  .ascrerr ****      � ****	 m  z}		 �		 � I n v a l i d   o p t i o n   d e f i n i t i o n   ( l o n g   n a m e   m u s t   s t a r t   w i t h   A - Z   o r   a - z   c h a r a c t e r ) .	 ��		
�� 
errn	 m  ps�����Y	 ��	��
�� 
erob	 o  vw���� 0 	optionref 	optionRef��  �	  �  � 	��	 X  ��	��		 Z ��		����	 H  ��		 E ��			 m  ��		 �		 J a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0 -	 n ��			 1  ����
�� 
pcnt	 o  ������ 0 charref charRef	 R  ����		 
�� .ascrerr ****      � ****	 m  ��	!	! �	"	" � I n v a l i d   o p t i o n   d e f i n i t i o n   ( l o n g   n a m e   c a n   o n l y   c o n t a i n   A - Z ,   a - z ,   0 - 9   o r   h y p h e n   c h a r a c t e r s ) .	  ��	#	$
�� 
errn	# m  �������Y	$ ��	%��
�� 
erob	% o  ������ 0 	optionref 	optionRef��  ��  ��  �� 0 charref charRef	 o  ������ 0 thename theName��  �   validate long name   � �	&	& &   v a l i d a t e   l o n g   n a m e�  � ����
�� conscase��  � 	'��	' l ��	(����	( n ��	)	*	) I  ����	+���� &0 setobject_forkey_ setObject_forKey_	+ 	,	-	, o  ������ $0 optiondefinition optionDefinition	- 	.��	. l ��	/����	/ b  ��	0	1	0 o  ������ 0 
nameprefix 
namePrefix	1 o  ������ 0 thename theName��  ��  ��  ��  	* o  ������ 20 optiondefinitionsbyname optionDefinitionsByName��  ��  ��  �,  �+  �-  �@ 0 aref aRef� J   � �	2	2 	3	4	3 J   � �	5	5 	6	7	6 n  � �	8	9	8 o   � ����� 0 	shortname 	shortName	9 o   � ����� $0 optiondefinition optionDefinition	7 	:��	: m   � �	;	; �	<	<  -��  	4 	=��	= J   � �	>	> 	?	@	? n  � �	A	B	A o   � ����� 0 longname longName	B o   � ����� $0 optiondefinition optionDefinition	@ 	C��	C m   � �	D	D �	E	E  - -��  ��  � 	F��	F Z ��	G	H����	G =  ��	I	J	I n  ��	K	L	K 1  ����
�� 
leng	L o  ������ 0 
foundnames 
foundNames	J o  ������ 0 	namecount 	nameCount	H R  ����	M	N
�� .ascrerr ****      � ****	M m  ��	O	O �	P	P � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .	N ��	Q	R
�� 
errn	Q m  �������Y	R ��	S��
�� 
erob	S o  ������ 0 	optionref 	optionRef��  ��  ��  ��  �m 0 	optionref 	optionRefC o    ���� &0 optiondefinitions optionDefinitionsA 	T��	T L  ��	U	U o  ������ 20 optiondefinitionsbyname optionDefinitionsByName��  ) 	V	W	V l     ��������  ��  ��  	W 	X	Y	X l     ��������  ��  ��  	Y 	Z	[	Z i  z }	\	]	\ I      ��	^���� 0 _parseoptions _parseOptions	^ 	_	`	_ o      ���� 0 rawarguments rawArguments	` 	a	b	a o      ���� &0 optiondefinitions optionDefinitions	b 	c��	c o      ���� &0 hasdefaultoptions hasDefaultOptions��  ��  	] k    n	d	d 	e	f	e l     ��	g	h��  	goi given a list of raw arguments passed to script's run handler, extract those items that are command option names and (where relevant) their corresponding values, converting those values to the required type and returning an NSMutableDictionary of option name-value pairs plus a list of any remaining (i.e. non-option) arguments to be passed to _parseArguments()   	h �	i	i�   g i v e n   a   l i s t   o f   r a w   a r g u m e n t s   p a s s e d   t o   s c r i p t ' s   r u n   h a n d l e r ,   e x t r a c t   t h o s e   i t e m s   t h a t   a r e   c o m m a n d   o p t i o n   n a m e s   a n d   ( w h e r e   r e l e v a n t )   t h e i r   c o r r e s p o n d i n g   v a l u e s ,   c o n v e r t i n g   t h o s e   v a l u e s   t o   t h e   r e q u i r e d   t y p e   a n d   r e t u r n i n g   a n   N S M u t a b l e D i c t i o n a r y   o f   o p t i o n   n a m e - v a l u e   p a i r s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s   t o   b e   p a s s e d   t o   _ p a r s e A r g u m e n t s ( )	f 	j	k	j l     ��	l	m��  	l 6 0 first build a lookup table of all known options   	m �	n	n `   f i r s t   b u i l d   a   l o o k u p   t a b l e   o f   a l l   k n o w n   o p t i o n s	k 	o	p	o r     	q	r	q I     ��	s���� (0 _buildoptionstable _buildOptionsTable	s 	t��	t o    ���� &0 optiondefinitions optionDefinitions��  ��  	r o      ���� 20 optiondefinitionsbyname optionDefinitionsByName	p 	u	v	u r   	 	w	x	w n  	 	y	z	y I    �������� 0 
dictionary  ��  ��  	z n  	 	{	|	{ o   
 ���� *0 nsmutabledictionary NSMutableDictionary	| m   	 
��
�� misccura	x o      ���� (0 asocparametersdict asocParametersDict	v 	}	~	} l   		�	�	 r    	�	�	� m    	�	� �	�	�  =	� n     	�	�	� 1    ��
�� 
txdl	� 1    ��
�� 
ascr	� P J note: a long option can use a space or '=' to separate its name and value   	� �	�	� �   n o t e :   a   l o n g   o p t i o n   c a n   u s e   a   s p a c e   o r   ' = '   t o   s e p a r a t e   i t s   n a m e   a n d   v a l u e	~ 	�	�	� l   ��	�	���  	� R L consume raw arguments list until it is empty or a non-option is encountered   	� �	�	� �   c o n s u m e   r a w   a r g u m e n t s   l i s t   u n t i l   i t   i s   e m p t y   o r   a   n o n - o p t i o n   i s   e n c o u n t e r e d	� 	�	�	� W   h	�	�	� k   "c	�	� 	�	�	� r   " (	�	�	� n   " &	�	�	� 4  # &��	�
�� 
cobj	� m   $ %���� 	� o   " #���� 0 rawarguments rawArguments	� o      ���� 0 thearg theArg	� 	�	�	� Z   ) 	�	�	�	�	� C   ) ,	�	�	� o   ) *���� 0 thearg theArg	� m   * +	�	� �	�	�  - -	� l  / m	�	�	�	� k   / m	�	� 	�	�	� Z   / @	�	�����	� =  / 2	�	�	� o   / 0���� 0 thearg theArg	� m   0 1	�	� �	�	�  - -	� l  5 <	�	�	�	� k   5 <	�	� 	�	�	� r   5 :	�	�	� n   5 8	�	�	� 1   6 8��
�� 
rest	� o   5 6���� 0 rawarguments rawArguments	� o      ���� 0 rawarguments rawArguments	� 	���	�  S   ; <��  	� i c double-hypens terminates the option list, so anything left in rawArguments is positional arguments   	� �	�	� �   d o u b l e - h y p e n s   t e r m i n a t e s   t h e   o p t i o n   l i s t ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s��  ��  	� 	�	�	� l  A G	�	�	�	� r   A G	�	�	� n   A E	�	�	� 4  B E��	�
�� 
citm	� m   C D���� 	� o   A B���� 0 thearg theArg	� o      ���� 0 
optionname 
optionName	�   get "--NAME"   	� �	�	�    g e t   " - - N A M E "	� 	���	� Z   H m	�	���	�	� ?   H Q	�	�	� l  H O	�����	� I  H O��	�	�
�� .corecnte****       ****	� o   H I���� 0 thearg theArg	� ��	���
�� 
kocl	� m   J K��
�� 
citm��  ��  ��  	� m   O P���� 	� l  T e	�	�	�	� r   T e	�	�	� n   T `	�	�	� 7  U `��	�	�
�� 
ctxt	� l  Y \	�����	� 4   Y \��	�
�� 
citm	� m   Z [���� ��  ��  	� m   ] _������	� o   T U���� 0 thearg theArg	� n      	�	�	� 4  a d��	�
�� 
cobj	� m   b c���� 	� o   ` a���� 0 rawarguments rawArguments	� * $ put "VALUE" back on stack for later   	� �	�	� H   p u t   " V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r��  	� l  h m	�	�	�	� r   h m	�	�	� n   h k	�	�	� 1   i k��
�� 
rest	� o   h i���� 0 rawarguments rawArguments	� o      ���� 0 rawarguments rawArguments	� ( " remove the option name from stack   	� �	�	� D   r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k��  	� < 6 found "--[NAME[=VALUE]]" (NAME is a long option name)   	� �	�	� l   f o u n d   " - - [ N A M E [ = V A L U E ] ] "   ( N A M E   i s   a   l o n g   o p t i o n   n a m e )	� 	�	�	� C   p s	�	�	� o   p q���� 0 thearg theArg	� m   q r	�	� �	�	�  -	� 	���	� l  v �	�	�	�	� k   v �	�	� 	�	�	� l  v �	�	�	�	� Z  v �	�	�����	� G   v �	�	�	� =  v {	�	�	� o   v w���� 0 thearg theArg	� m   w z	�	� �
 
   -	� E  ~ �


 m   ~ �

 �

  0 1 2 3 4 5 6 7 8 9 0
 n  � �


 4   � ���

�� 
cha 
 m   � ����� 
 o   � ��� 0 thearg theArg	�  S   � ���  ��  	� � { it's a lone hyphen or a negative number (i.e. not an option), so treat it and rest of rawArguments as positional arguments   	� �

 �   i t ' s   a   l o n e   h y p h e n   o r   a   n e g a t i v e   n u m b e r   ( i . e .   n o t   a n   o p t i o n ) ,   s o   t r e a t   i t   a n d   r e s t   o f   r a w A r g u m e n t s   a s   p o s i t i o n a l   a r g u m e n t s	� 
	


	 l  � �



 r   � �


 n   � �


 7  � ��~


�~ 
ctxt
 m   � ��}�} 
 m   � ��|�| 
 o   � ��{�{ 0 thearg theArg
 o      �z�z 0 
optionname 
optionName
  	 get "-N"   
 �

    g e t   " - N "

 
�y
 Z   � �

�x

 ?   � �


 n  � �


 1   � ��w
�w 
leng
 o   � ��v�v 0 thearg theArg
 m   � ��u�u 
 l  � �



 k   � �
 
  
!
"
! r   � �
#
$
# n   � �
%
&
% 7  � ��t
'
(
�t 
ctxt
' m   � ��s�s 
( m   � ��r�r��
& o   � ��q�q 0 thearg theArg
$ n      
)
*
) 4  � ��p
+
�p 
cobj
+ m   � ��o�o 
* o   � ��n�n 0 rawarguments rawArguments
" 
,
-
, r   � �
.
/
. n  � �
0
1
0 I   � ��m
2�l�m 0 objectforkey_ objectForKey_
2 
3�k
3 o   � ��j�j 0 
optionname 
optionName�k  �l  
1 o   � ��i�i 20 optiondefinitionsbyname optionDefinitionsByName
/ o      �h�h $0 optiondefinition optionDefinition
- 
4�g
4 Z   � �
5
6�f�e
5 F   � �
7
8
7 >  � �
9
:
9 o   � ��d�d $0 optiondefinition optionDefinition
: m   � ��c
�c 
msng
8 =  � �
;
<
; n  � �
=
>
= o   � ��b�b 0 	valuetype 	valueType
> l  � �
?�a�`
? c   � �
@
A
@ o   � ��_�_ $0 optiondefinition optionDefinition
A m   � ��^
�^ 
****�a  �`  
< m   � ��]
�] 
bool
6 r   � �
B
C
B b   � �
D
E
D m   � �
F
F �
G
G  -
E n   � �
H
I
H 4  � ��\
J
�\ 
cobj
J m   � ��[�[ 
I o   � ��Z�Z 0 rawarguments rawArguments
C n      
K
L
K 4  � ��Y
M
�Y 
cobj
M m   � ��X�X 
L o   � ��W�W 0 rawarguments rawArguments�f  �e  �g  
 / ) put "[-N�]VALUE" back on stack for later   
 �
N
N R   p u t   " [ - N & ] V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r�x  
 l  � �
O
P
Q
O r   � �
R
S
R n   � �
T
U
T 1   � ��V
�V 
rest
U o   � ��U�U 0 rawarguments rawArguments
S o      �T�T 0 rawarguments rawArguments
P ' !remove the option name from stack   
Q �
V
V B r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k�y  	� H B found "-N[N�][VALUE]" (N is a single-character short option name)   	� �
W
W �   f o u n d   " - N [ N & ] [ V A L U E ] "   ( N   i s   a   s i n g l e - c h a r a c t e r   s h o r t   o p t i o n   n a m e )��  	� l  � 
X
Y
Z
X  S   � 
Y S M not an option name, so anything left in rawArguments is positional arguments   
Z �
[
[ �   n o t   a n   o p t i o n   n a m e ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s	� 
\
]
\ l �S
^
_�S  
^ - ' look up the option's definition record   
_ �
`
` N   l o o k   u p   t h e   o p t i o n ' s   d e f i n i t i o n   r e c o r d
] 
a
b
a r  	
c
d
c n 
e
f
e I  �R
g�Q�R 0 objectforkey_ objectForKey_
g 
h�P
h o  �O�O 0 
optionname 
optionName�P  �Q  
f o  �N�N 20 optiondefinitionsbyname optionDefinitionsByName
d o      �M�M $0 optiondefinition optionDefinition
b 
i
j
i Z  
�
k
l�L�K
k = 

m
n
m o  
�J�J $0 optiondefinition optionDefinition
n m  �I
�I 
msng
l l �
o
p
q
o k  �
r
r 
s
t
s Z  t
u
v�H�G
u o  �F�F &0 hasdefaultoptions hasDefaultOptions
v k  p
w
w 
x
y
x r  ?
z
{
z J  0
|
| 
}
~
} E "

�
 J  
�
� 
�
�
� m  
�
� �
�
�  - h
� 
��E
� m  
�
� �
�
�  - - h e l p�E  
� J  !
�
� 
��D
� o  �C�C 0 
optionname 
optionName�D  
~ 
��B
� E ".
�
�
� J  "*
�
� 
�
�
� m  "%
�
� �
�
�  - v
� 
��A
� m  %(
�
� �
�
�  - - v e r s i o n�A  
� J  *-
�
� 
��@
� o  *+�?�? 0 
optionname 
optionName�@  �B  
{ J      
�
� 
�
�
� o      �>�> 0 ishelp isHelp
� 
��=
� o      �<�< 0 	isversion 	isVersion�=  
y 
��;
� Z  @p
�
��:�9
� G  @I
�
�
� o  @A�8�8 0 ishelp isHelp
� o  DE�7�7 0 	isversion 	isVersion
� l Ll
�
�
�
� k  Ll
�
� 
�
�
� n LQ
�
�
� I  MQ�6�5�4�6 $0 removeallobjects removeAllObjects�5  �4  
� o  LM�3�3 (0 asocparametersdict asocParametersDict
� 
�
�
� n R[
�
�
� I  S[�2
��1�2 $0 setvalue_forkey_ setValue_forKey_
� 
�
�
� o  ST�0�0 0 ishelp isHelp
� 
��/
� m  TW
�
� �
�
�  h e l p�/  �1  
� o  RS�.�. (0 asocparametersdict asocParametersDict
� 
�
�
� n \e
�
�
� I  ]e�-
��,�- $0 setvalue_forkey_ setValue_forKey_
� 
�
�
� o  ]^�+�+ 0 	isversion 	isVersion
� 
��*
� m  ^a
�
� �
�
�  v e r s i o n�*  �,  
� o  \]�)�) (0 asocparametersdict asocParametersDict
� 
�
�
� r  fj
�
�
� J  fh�(�(  
� o      �'�' 0 rawarguments rawArguments
� 
��&
�  S  kl�&  
�  � ignore everything else and return a minimal record containing only `help` and `version` properties, one or both of which are true, so must be dealt with accordingly by `run` handler (i.e. format+log help text and return and/or return version number)   
� �
�
��   i g n o r e   e v e r y t h i n g   e l s e   a n d   r e t u r n   a   m i n i m a l   r e c o r d   c o n t a i n i n g   o n l y   ` h e l p `   a n d   ` v e r s i o n `   p r o p e r t i e s ,   o n e   o r   b o t h   o f   w h i c h   a r e   t r u e ,   s o   m u s t   b e   d e a l t   w i t h   a c c o r d i n g l y   b y   ` r u n `   h a n d l e r   ( i . e .   f o r m a t + l o g   h e l p   t e x t   a n d   r e t u r n   a n d / o r   r e t u r n   v e r s i o n   n u m b e r )�:  �9  �;  �H  �G  
t 
��%
� R  u��$
�
�
�$ .ascrerr ****      � ****
� b  �
�
�
� m  �
�
� �
�
�   U n k n o w n   o p t i o n :  
� o  ���#�# 0 
optionname 
optionName
� �"
��!
�" 
errn
� o  y~� �   0 _argvusererror _ArgvUserError�!  �%  
p A ; check for default options (help/version), else raise error   
q �
�
� v   c h e c k   f o r   d e f a u l t   o p t i o n s   ( h e l p / v e r s i o n ) ,   e l s e   r a i s e   e r r o r�L  �K  
j 
�
�
� r  ��
�
�
� c  ��
�
�
� o  ���� $0 optiondefinition optionDefinition
� m  ���
� 
****
� o      �� $0 optiondefinition optionDefinition
� 
�
�
� r  ��
�
�
� n ��
�
�
� o  ���� 0 propertyname propertyName
� o  ���� $0 optiondefinition optionDefinition
� o      �� 0 propertyname propertyName
� 
�
�
� l ���
�
��  
� #  now process the option value   
� �
�
� :   n o w   p r o c e s s   t h e   o p t i o n   v a l u e
� 
�
�
� Z  �
�
��
�
� = ��
�
�
� n ��
�
�
� o  ���� 0 	valuetype 	valueType
� o  ���� $0 optiondefinition optionDefinition
� m  ���
� 
bool
� Q  ��
�
�
�
� r  ��
�
�
� H  ��
�
� n ��
�
�
� o  ���� 0 defaultvalue defaultValue
� o  ���� $0 optiondefinition optionDefinition
� o      �� 0 thevalue theValue
� R      ���
� .ascrerr ****      � ****�  �  
� R  ���
�
�
� .ascrerr ****      � ****
� b  ��
�
�
� m  ��
�
� �
�
� J B a d   d e f a u l t V a l u e   f o r   b o o l e a n   o p t i o n :  
� o  ���� 0 
optionname 
optionName
� �
�
�
� 
errn
� m  �����\
� �

��	
�
 
erob
� l ��
���
� N  ��
�
� n  ��
�
�
� o  ���� 0 defaultvalue defaultValue
� o  ���� $0 optiondefinition optionDefinition�  �  �	  �  
� k  �
�
� 
�
�
� Z ��
�
���
� = ��   o  ���� 0 rawarguments rawArguments J  ����  
� R  ��� 
�  .ascrerr ****      � **** b  �� m  �� � 4 M i s s i n g   v a l u e   f o r   o p t i o n :   o  ������ 0 
optionname 
optionName ����
�� 
errn o  ������  0 _argvusererror _ArgvUserError��  �  �  
� 	
	 r  �� I  �������� 0 _unpackvalue _unpackValue  n  �� 4 ����
�� 
cobj m  ������  o  ������ 0 rawarguments rawArguments �� o  ������ $0 optiondefinition optionDefinition��  ��   o      ���� 0 thevalue theValue
 �� r  � n  � 1  ���
�� 
rest o  ������ 0 rawarguments rawArguments o      ���� 0 rawarguments rawArguments��  
�  Z  [�� n 
 o  	���� 0 islist isList o  ���� $0 optiondefinition optionDefinition l 7 !"  k  7## $%$ r  &'& n ()( I  ��*���� 0 objectforkey_ objectForKey_* +��+ o  ���� 0 propertyname propertyName��  ��  ) o  ���� (0 asocparametersdict asocParametersDict' o      ���� 0 thelist theList% ,��, Z  7-.��/- = 010 o  ���� 0 thelist theList1 m  ��
�� 
msng. r  *232 n (454 I  #(��6���� $0 arraywithobject_ arrayWithObject_6 7��7 o  #$���� 0 thevalue theValue��  ��  5 n #898 o  #����  0 nsmutablearray NSMutableArray9 m  ��
�� misccura3 o      ���� 0 thevalue theValue��  / k  -7:: ;<; n -3=>= I  .3��?���� 0 
addobject_ 
addObject_? @��@ o  ./���� 0 thevalue theValue��  ��  > o  -.���� 0 thelist theList< A��A r  47BCB o  45���� 0 thelist theListC o      ���� 0 thevalue theValue��  ��  ! = 7 option can appear multiple times, so collect in a list   " �DD n   o p t i o n   c a n   a p p e a r   m u l t i p l e   t i m e s ,   s o   c o l l e c t   i n   a   l i s t EFE > :DGHG l :@I����I n :@JKJ I  ;@��L���� 0 objectforkey_ objectForKey_L M��M o  ;<���� 0 propertyname propertyName��  ��  K o  :;���� (0 asocparametersdict asocParametersDict��  ��  H m  @C��
�� 
msngF N��N R  GW��OP
�� .ascrerr ****      � ****O b  QVQRQ m  QTSS �TT $ D u p l i c a t e   o p t i o n :  R o  TU���� 0 
optionname 
optionNameP ��U��
�� 
errnU o  KP����  0 _argvusererror _ArgvUserError��  ��  ��   V��V n \cWXW I  ]c��Y���� &0 setobject_forkey_ setObject_forKey_Y Z[Z o  ]^���� 0 thevalue theValue[ \��\ o  ^_���� 0 propertyname propertyName��  ��  X o  \]���� (0 asocparametersdict asocParametersDict��  	� =   !]^] o    ���� 0 rawarguments rawArguments^ J     ����  	� _��_ L  in`` J  imaa bcb o  ij���� (0 asocparametersdict asocParametersDictc d��d o  jk���� 0 rawarguments rawArguments��  ��  	[ efe l     ��������  ��  ��  f ghg l     ��������  ��  ��  h iji i  ~ �klk I      ��m���� (0 _adddefaultoptions _addDefaultOptionsm non o      ���� (0 asocparametersdict asocParametersDicto p��p o      ���� &0 optiondefinitions optionDefinitions��  ��  l k     �qq rsr X     �t��ut k    �vv wxw r    "yzy b     {|{ l   }����} c    ~~ o    ���� 0 recref recRef m    ��
�� 
reco��  ��  | K    �� ������ 0 propertyname propertyName� m    �� ���  � ������ 0 longname longName� m    �� ���  � ������� 0 defaultvalue defaultValue� o    ���� 0 novalue NoValue��  z o      ���� 0 rec  x ��� r   # (��� n  # &��� o   $ &���� 0 propertyname propertyName� o   # $���� 0 rec  � o      ���� 0 propertyname propertyName� ��� Z  ) 8������� =  ) ,��� o   ) *���� 0 propertyname propertyName� m   * +�� ���  � r   / 4��� n  / 2��� o   0 2���� 0 longname longName� o   / 0���� 0 rec  � o      ���� 0 propertyname propertyName��  ��  � ���� Z   9 �������� =  9 A��� l  9 ?������ n  9 ?��� I   : ?������� 0 objectforkey_ objectForKey_� ���� o   : ;���� 0 propertyname propertyName��  ��  � o   9 :���� (0 asocparametersdict asocParametersDict��  ��  � m   ? @��
�� 
msng� k   D ��� ��� r   D I��� n  D G��� o   E G���� 0 defaultvalue defaultValue� o   D E���� 0 rec  � o      ���� 0 thevalue theValue� ��� Z   J �������� =  J Q��� o   J K���� 0 thevalue theValue� o   K P���� 0 novalue NoValue� l  T ����� k   T ��� ��� r   T [��� b   T Y��� m   T U�� ���  - -� n  U X��� o   V X���� 0 longname longName� o   U V���� 0 rec  � o      ���� 0 
optionname 
optionName� ��� Z  \ o������� =  \ _��� o   \ ]���� 0 
optionname 
optionName� m   ] ^�� ���  - -� r   b k��� b   b i��� m   b c�� ���  -� n  c h��� o   d h���� 0 	shortname 	shortName� o   c d���� 0 rec  � o      �� 0 
optionname 
optionName��  ��  � ��~� R   p ��}��
�} .ascrerr ****      � ****� b   z ��� m   z }�� ��� 2 M i s s i n g   r e q u i r e d   o p t i o n :  � o   } ~�|�| 0 
optionname 
optionName� �{��z
�{ 
errn� o   t y�y�y  0 _argvusererror _ArgvUserError�z  �~  � 2 , record doesn't have a defaultValue property   � ��� X   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y��  ��  � ��� Z  � ����x�w� =  � ���� o   � ��v�v 0 thevalue theValue� m   � ��u
�u 
msng� r   � ���� n  � ���� I   � ��t�s�r�t 0 null  �s  �r  � n  � ���� o   � ��q�q 0 nsnull NSNull� m   � ��p
�p misccura� o      �o�o 0 thevalue theValue�x  �w  � ��n� l  � ���m�l� n  � ���� I   � ��k��j�k &0 setobject_forkey_ setObject_forKey_� ��� o   � ��i�i 0 thevalue theValue� ��h� o   � ��g�g 0 propertyname propertyName�h  �j  � o   � ��f�f (0 asocparametersdict asocParametersDict�m  �l  �n  ��  ��  ��  �� 0 recref recRefu o    �e�e &0 optiondefinitions optionDefinitionss ��� l  � ��d���d  � ` Z set default help, version properties if not already supplied by user of optionDefinitions   � ��� �   s e t   d e f a u l t   h e l p ,   v e r s i o n   p r o p e r t i e s   i f   n o t   a l r e a d y   s u p p l i e d   b y   u s e r   o f   o p t i o n D e f i n i t i o n s� ��c� X   � ���b�� Z  � ����a�`� =  � ���� l  � ���_�^� n  � ���� I   � ��]��\�] 0 objectforkey_ objectForKey_� ��[� o   � ��Z�Z 0 aref aRef�[  �\  � o   � ��Y�Y (0 asocparametersdict asocParametersDict�_  �^  � m   � ��X
�X 
msng� l  � ���W�V� n  � �   I   � ��U�T�U &0 setobject_forkey_ setObject_forKey_  m   � ��S
�S boovfals �R o   � ��Q�Q 0 aref aRef�R  �T   o   � ��P�P (0 asocparametersdict asocParametersDict�W  �V  �a  �`  �b 0 aref aRef� J   � �  m   � �		 �

  h e l p �O m   � � �  v e r s i o n�O  �c  j  l     �N�M�L�N  �M  �L    l     �K�J�I�K  �J  �I    i  � � I      �H�G�H "0 _parsearguments _parseArguments  o      �F�F 0 argumentslist argumentsList  o      �E�E *0 argumentdefinitions argumentDefinitions �D o      �C�C (0 asocparametersdict asocParametersDict�D  �G   k    �  l     �B �B   q k parse the remaining raw arguments, converting to the required type and adding to the parameters dictionary     �!! �   p a r s e   t h e   r e m a i n i n g   r a w   a r g u m e n t s ,   c o n v e r t i n g   t o   t h e   r e q u i r e d   t y p e   a n d   a d d i n g   t o   t h e   p a r a m e t e r s   d i c t i o n a r y "#" r     $%$ m     �A�A  % o      �@�@ 0 i  # &'& r    	()( n   *+* 1    �?
�? 
leng+ o    �>�> 0 argumentslist argumentsList) o      �=�= 0 argcount argCount' ,-, l  
 ./0. r   
 121 m   
 �<
�< boovfals2 o      �;�;  0 mustbeoptional mustBeOptional/ � � repeat loop will throw invalid argument definition error if an optional argument definition is followed by a required argument definition   0 �33   r e p e a t   l o o p   w i l l   t h r o w   i n v a l i d   a r g u m e n t   d e f i n i t i o n   e r r o r   i f   a n   o p t i o n a l   a r g u m e n t   d e f i n i t i o n   i s   f o l l o w e d   b y   a   r e q u i r e d   a r g u m e n t   d e f i n i t i o n- 454 X   Z6�:76 k   U88 9:9 r    #;<; [    !=>= o    �9�9 0 i  > m     �8�8 < o      �7�7 0 i  : ?@? r   $ :ABA b   $ 8CDC l  $ )E�6�5E c   $ )FGF n  $ 'HIH 1   % '�4
�4 
pcntI o   $ %�3�3 0 argref argRefG m   ' (�2
�2 
reco�6  �5  D K   ) 7JJ �1KL�1 0 propertyname propertyNameK m   * +MM �NN  L �0OP�0 0 	valuetype 	valueTypeO m   , -�/
�/ 
ctxtP �.QR�. 0 islist isListQ m   . /�-
�- boovfalsR �,S�+�, 0 defaultvalue defaultValueS o   0 5�*�* 0 novalue NoValue�+  B o      �)�) (0 argumentdefinition argumentDefinition@ TUT Z   ; qVWX�(V >  ; DYZY n  ; >[\[ o   < >�'�' 0 defaultvalue defaultValue\ o   ; <�&�& (0 argumentdefinition argumentDefinitionZ o   > C�%�% 0 novalue NoValueW r   G J]^] m   G H�$
�$ boovtrue^ o      �#�#  0 mustbeoptional mustBeOptionalX _`_ F   M \aba o   M N�"�"  0 mustbeoptional mustBeOptionalb =  Q Zcdc n  Q Tefe o   R T�!�! 0 defaultvalue defaultValuef o   Q R� �  (0 argumentdefinition argumentDefinitiond o   T Y�� 0 novalue NoValue` g�g R   _ m�hi
� .ascrerr ****      � ****h m   i ljj �kk � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( a   n o n - o p t i o n a l   a r g u m e n t   c a n n o t   f o l l o w   a n   o p t i o n a l   a r g u m e n t ) .i �lm
� 
errnl m   a b���Ym �n�
� 
erobn o   e f�� 0 argref argRef�  �  �(  U opo Z  r �qr��q =  r ysts n  r uuvu o   s u�� 0 propertyname propertyNamev o   r s�� (0 argumentdefinition argumentDefinitiont m   u xww �xx  r R   | ��yz
� .ascrerr ****      � ****y m   � �{{ �|| � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y   p r o p e r t y N a m e   p r o p e r t y ) .z �}~
� 
errn} m   ~ ���Y~ ��
� 
erob o   � ��� 0 argref argRef�  �  �  p ��� Z   � ������ =   � ���� o   � ��� 0 argumentslist argumentsList� J   � ���  � k   � ��� ��� r   � ���� n  � ���� o   � ��
�
 0 defaultvalue defaultValue� o   � ��	�	 (0 argumentdefinition argumentDefinition� o      �� 0 thevalue theValue� ��� Z   � ������ =  � ���� o   � ��� 0 thevalue theValue� o   � ��� 0 novalue NoValue� l  � ����� k   � ��� ��� r   � ���� n  � ���� o   � ��� $0 valueplaceholder valuePlaceholder� o   � ��� (0 argumentdefinition argumentDefinition� o      � �  "0 placeholdertext placeholderText� ��� Z  � �������� =   � ���� n  � ���� 1   � ���
�� 
leng� o   � ����� "0 placeholdertext placeholderText� m   � �����  � r   � ���� I   � �������� 40 _defaultvalueplaceholder _defaultValuePlaceholder� ���� n  � ���� o   � ����� 0 	valuetype 	valueType� o   � ����� (0 argumentdefinition argumentDefinition��  ��  � o      ���� "0 placeholdertext placeholderText��  ��  � ���� R   � �����
�� .ascrerr ****      � ****� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ��� 4 M i s s i n g   r e q u i r e d   a r g u m e n t  � o   � ����� 0 i  � m   � ��� ���    ( e x p e c t e d  � o   � ����� "0 placeholdertext placeholderText� m   � ��� ���  ) .� �����
�� 
errn� o   � �����  0 _argvusererror _ArgvUserError��  ��  � W Q record doesn't have a defaultValue property, so user should've supplied argument   � ��� �   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y ,   s o   u s e r   s h o u l d ' v e   s u p p l i e d   a r g u m e n t�  �  �  �  � k   � ��� ��� r   � ���� I   � �������� 0 _unpackvalue _unpackValue� ��� n   � ���� 4  � ����
�� 
cobj� m   � ����� � o   � ����� 0 argumentslist argumentsList� ���� o   � ����� (0 argumentdefinition argumentDefinition��  ��  � o      ���� 0 thevalue theValue� ���� r   � ���� n   � ���� 1   � ���
�� 
rest� o   � ����� 0 argumentslist argumentsList� o      ���� 0 argumentslist argumentsList��  � ��� Z   �K������� n  � ���� o   � ����� 0 islist isList� o   � ����� (0 argumentdefinition argumentDefinition� k   G�� ��� Z  ������� A   ��� o   ���� 0 i  � n  ��� 1  ��
�� 
leng� o  ���� *0 argumentdefinitions argumentDefinitions� R  ����
�� .ascrerr ****      � ****� m  �� ��� � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( o n l y   t h e   l a s t   a r g u m e n t   d e f i n i t i o n   m a y   c o n t a i n   a n    i s L i s t : t r u e    p r o p e r t y ) .� ����
�� 
errn� m  
�����Y� �����
�� 
erob� o  ���� 0 argref argRef��  ��  ��  � ��� r   ��� J  �� ���� o  ���� 0 thevalue theValue��  � o      ���� 0 thevalue theValue� ��� X  !B����� r  1=��� I  1:������� 0 _unpackvalue _unpackValue� ��� n 25��� 1  35��
�� 
pcnt� o  23���� 0 aref aRef� ���� o  56���� (0 argumentdefinition argumentDefinition��  ��  � n      ���  ;  ;<� o  :;���� 0 thevalue theValue�� 0 aref aRef� o  $%���� 0 argumentslist argumentsList� ���� r  CG��� J  CE����  � o      ���� 0 argumentslist argumentsList��  ��  ��  � ���� l LU������ n LU��� I  MU�� ���� &0 setobject_forkey_ setObject_forKey_   o  MN���� 0 thevalue theValue �� l NQ���� n NQ o  OQ���� 0 propertyname propertyName o  NO���� (0 argumentdefinition argumentDefinition��  ��  ��  ��  � o  LM���� (0 asocparametersdict asocParametersDict��  ��  ��  �: 0 argref argRef7 o    ���� *0 argumentdefinitions argumentDefinitions5 �� Z [�	���� > [_

 o  [\���� 0 argumentslist argumentsList J  \^����  	 R  b|��
�� .ascrerr ****      � **** b  j{ b  jw b  ju b  jq m  jm � : T o o   m a n y   a r g u m e n t s   ( e x p e c t e d   n  mp 1  np��
�� 
leng o  mn���� *0 argumentdefinitions argumentDefinitions m  qt �    b u t   r e c e i v e d   o  uv���� 0 argcount argCount m  wz �  ) . ����
�� 
errn o  di����  0 _argvusererror _ArgvUserError��  ��  ��  ��     l     ��������  ��  ��    !"! l     ��#$��  #  -----   $ �%% 
 - - - - -" &'& l     ��()��  ( ) # format built-in help documentation   ) �** F   f o r m a t   b u i l t - i n   h e l p   d o c u m e n t a t i o n' +,+ l     ��������  ��  ��  , -.- i  � �/0/ I      ��1����  0 _formatoptions _formatOptions1 232 o      ���� &0 optiondefinitions optionDefinitions3 454 o      ���� 0 vtstyle vtStyle5 6��6 o      ���� &0 hasdefaultoptions hasDefaultOptions��  ��  0 k    �77 898 l     ��:;��  : ] W generates OPTIONS section, along with options synopsis for inclusion in autogenerated    ; �<< �   g e n e r a t e s   O P T I O N S   s e c t i o n ,   a l o n g   w i t h   o p t i o n s   s y n o p s i s   f o r   i n c l u s i o n   i n   a u t o g e n e r a t e d  9 =>= r     ?@? J     AA BCB m     DD �EE  C FGF m    HH �II  G J��J m    KK �LL  ��  @ J      MM NON o      ����  0 defaultoptions defaultOptionsO PQP o      ����  0 booleanoptions booleanOptionsQ R��R o      ���� 0 otheroptions otherOptions��  > STS r    'UVU b    %WXW b    !YZY n   [\[ o    ���� 0 b  \ o    ���� 0 vtstyle vtStyleZ m     ]] �^^  O P T I O N SX n  ! $_`_ o   " $���� 0 n  ` o   ! "���� 0 vtstyle vtStyleV o      ����  0 optionssection optionsSectionT aba X   (c��dc k   8ee fgf r   8 `hih b   8 ^jkj l  8 ;l����l c   8 ;mnm o   8 9���� 0 	optionref 	optionRefn m   9 :��
�� 
reco��  ��  k K   ; ]oo ��pq�� 0 	shortname 	shortNamep m   < =rr �ss  q ��tu�� 0 longname longNamet m   > ?vv �ww  u ��xy�� 0 	valuetype 	valueTypex m   @ A��
�� 
ctxty ��z{�� 0 islist isListz m   D E��
�� boovfals{ ��|}�� 0 defaultvalue defaultValue| o   H M���� 0 novalue NoValue} ��~�� $0 valueplaceholder valuePlaceholder~ m   P S�� ���   ������� $0 valuedescription valueDescription� m   V Y�� ���  ��  i o      ���� $0 optiondefinition optionDefinitiong ��� Q   a ����� k   d ��� ��� r   d k��� c   d i��� n  d g��� o   e g���� 0 	shortname 	shortName� o   d e�� $0 optiondefinition optionDefinition� m   g h�~
�~ 
ctxt� o      �}�} 0 	shortname 	shortName� ��� r   l s��� c   l q��� n  l o��� o   m o�|�| 0 longname longName� o   l m�{�{ $0 optiondefinition optionDefinition� m   o p�z
�z 
ctxt� o      �y�y 0 longname longName� ��� r   t }��� c   t {��� n  t w��� o   u w�x�x 0 	valuetype 	valueType� o   t u�w�w $0 optiondefinition optionDefinition� m   w z�v
�v 
type� o      �u�u 0 	valuetype 	valueType� ��� r   ~ ���� c   ~ ���� n  ~ ���� o    ��t�t 0 islist isList� o   ~ �s�s $0 optiondefinition optionDefinition� m   � ��r
�r 
bool� o      �q�q 0 islist isList� ��� r   � ���� c   � ���� n  � ���� o   � ��p�p $0 valueplaceholder valuePlaceholder� o   � ��o�o $0 optiondefinition optionDefinition� m   � ��n
�n 
ctxt� o      �m�m $0 valueplaceholder valuePlaceholder� ��l� r   � ���� c   � ���� n  � ���� o   � ��k�k $0 valuedescription valueDescription� o   � ��j�j $0 optiondefinition optionDefinition� m   � ��i
�i 
ctxt� o      �h�h $0 valuedescription valueDescription�l  � R      �g�f�
�g .ascrerr ****      � ****�f  � �e��d
�e 
errn� d      �� m      �c�c��d  � n  � ���� I   � ��b��a�b 60 throwinvalidparametertype throwInvalidParameterType� ��� o   � ��`�` &0 optiondefinitions optionDefinitions� ��� m   � ��� ���  o p t i o n s� ��� m   � ��_
�_ 
reco� ��^� m   � ��� ��� ` l i s t   o f    c o m m a n d   l i n e   o p t i o n   d e f i n i t i o n    r e c o r d s�^  �a  � o   � ��]�] 0 _support  � ��� r   � ���� b   � ���� b   � ���� o   � ��\�\  0 optionssection optionsSection� o   � ��[�[ 
0 lf2 LF2� o   � ��Z�Z 0 indent1 Indent1� o      �Y�Y  0 optionssection optionsSection� ��� Z   �#���X�� =  � ���� o   � ��W�W 0 	shortname 	shortName� m   � ��� ���  � k   � ��� ��� Z  � ����V�U� =  � ���� o   � ��T�T 0 longname longName� m   � ��� ���  � R   � ��S��
�S .ascrerr ****      � ****� m   � ��� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .� �R��
�R 
errn� m   � ��Q�Q�Y� �P��O
�P 
erob� o   � ��N�N 0 	optionref 	optionRef�O  �V  �U  � ��� r   � ���� o   � ��M�M 0 longname longName� o      �L�L 0 
optionname 
optionName� ��K� r   � ���� b   � ���� b   � ���� o   � ��J�J  0 optionssection optionsSection� m   � ��� ���  - -� o   � ��I�I 0 longname longName� o      �H�H  0 optionssection optionsSection�K  �X  � k   #�� ��� r   ��� o   �G�G 0 	shortname 	shortName� o      �F�F 0 
optionname 
optionName� ��� r     b   b  	 o  �E�E  0 optionssection optionsSection m   �  - o  	
�D�D 0 	shortname 	shortName o      �C�C  0 optionssection optionsSection� �B Z #	
�A�@	 >  o  �?�? 0 longname longName m   �  
 r   b   b   o  �>�>  0 optionssection optionsSection m   �  ,   - - o  �=�= 0 longname longName o      �<�<  0 optionssection optionsSection�A  �@  �B  �  Z  $��; = $) o  $%�:�: 0 	valuetype 	valueType m  %(�9
�9 
bool l ,1  r  ,1!"! b  ,/#$# o  ,-�8�8  0 booleanoptions booleanOptions$ o  -.�7�7 0 
optionname 
optionName" o      �6�6  0 booleanoptions booleanOptions ) # group all boolean flags as "[-N�]"     �%% F   g r o u p   a l l   b o o l e a n   f l a g s   a s   " [ - N & ] "�;   k  4�&& '(' r  4C)*) > 4?+,+ n 49-.- o  59�5�5 0 defaultvalue defaultValue. o  45�4�4 $0 optiondefinition optionDefinition, o  9>�3�3 0 novalue NoValue* o      �2�2 0 
isoptional 
isOptional( /0/ r  DK121 b  DI343 o  DE�1�1 0 otheroptions otherOptions4 1  EH�0
�0 
spac2 o      �/�/ 0 otheroptions otherOptions0 565 Z L]78�.�-7 o  LO�,�, 0 
isoptional 
isOptional8 r  RY9:9 b  RW;<; o  RS�+�+ 0 otheroptions otherOptions< m  SV== �>>  [: o      �*�* 0 otheroptions otherOptions�.  �-  6 ?@? r  ^gABA b  ^eCDC b  ^cEFE o  ^_�)�) 0 otheroptions otherOptionsF m  _bGG �HH  -D o  cd�(�( 0 
optionname 
optionNameB o      �'�' 0 otheroptions otherOptions@ IJI r  hkKLK o  hi�&�& $0 valueplaceholder valuePlaceholderL o      �%�% $0 valueplaceholder valuePlaceholderJ MNM Z l�OP�$�#O = lqQRQ o  lm�"�" $0 valueplaceholder valuePlaceholderR m  mpSS �TT  P r  t|UVU I  tz�!W� �! 40 _defaultvalueplaceholder _defaultValuePlaceholderW X�X o  uv�� $0 optiondefinition optionDefinition�  �   V o      �� $0 valueplaceholder valuePlaceholder�$  �#  N YZY r  ��[\[ b  ��]^] b  ��_`_ n ��aba o  ���� 0 u  b o  ���� 0 vtstyle vtStyle` o  ���� $0 valueplaceholder valuePlaceholder^ n ��cdc o  ���� 0 n  d o  ���� 0 vtstyle vtStyle\ o      �� $0 valueplaceholder valuePlaceholderZ efe r  ��ghg b  ��iji b  ��klk o  ���� 0 otheroptions otherOptionsl 1  ���
� 
spacj o  ���� $0 valueplaceholder valuePlaceholderh o      �� 0 otheroptions otherOptionsf mnm Z ��op��o o  ���� 0 
isoptional 
isOptionalp r  ��qrq b  ��sts o  ���� 0 otheroptions otherOptionst m  ��uu �vv  ]r o      �� 0 otheroptions otherOptions�  �  n wxw r  ��yzy b  ��{|{ b  ��}~} o  ����  0 optionssection optionsSection~ 1  ���
� 
spac| o  ���� $0 valueplaceholder valuePlaceholderz o      �
�
  0 optionssection optionsSectionx � Z �����	�� > ����� n ����� o  ���� 0 defaultvalue defaultValue� o  ���� $0 optiondefinition optionDefinition� o  ���� 0 novalue NoValue� r  ����� b  ����� o  ���� $0 valuedescription valueDescription� I  ������ *0 _formatdefaultvalue _formatDefaultValue� ��� o  ��� �  $0 optiondefinition optionDefinition�  �  � o      ���� $0 valuedescription valueDescription�	  �  � ���� Z ��������� o  ������ 0 islist isList� r  ����� b  ����� o  ������ $0 valuedescription valueDescription� m  ���� ��� N T h i s   o p t i o n   c a n   b e   u s e d   m u l t i p l e   t i m e s .� o      ���� $0 valuedescription valueDescription��  ��  ��   ���� Z �������� > ����� o  ������ $0 valuedescription valueDescription� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� b  ����� o  ������  0 optionssection optionsSection� 1  ����
�� 
lnfd� o  ������ 0 indent2 Indent2� o  ������ $0 valuedescription valueDescription� 1  ����
�� 
spac� o      ����  0 optionssection optionsSection��  ��  ��  �� 0 	optionref 	optionRefd o   + ,���� &0 optiondefinitions optionDefinitionsb ��� l ������  � � document default -h and -v options as needed (these will appear at bottom of OPTIONS section, which isn't aesthetically ideal but is simplest to implement and avoids messing with the order of the option definitions specified by the shell script's author)   � ����   d o c u m e n t   d e f a u l t   - h   a n d   - v   o p t i o n s   a s   n e e d e d   ( t h e s e   w i l l   a p p e a r   a t   b o t t o m   o f   O P T I O N S   s e c t i o n ,   w h i c h   i s n ' t   a e s t h e t i c a l l y   i d e a l   b u t   i s   s i m p l e s t   t o   i m p l e m e n t   a n d   a v o i d s   m e s s i n g   w i t h   t h e   o r d e r   o f   t h e   o p t i o n   d e f i n i t i o n s   s p e c i f i e d   b y   t h e   s h e l l   s c r i p t ' s   a u t h o r )� ��� Z  |������� o  ���� &0 hasdefaultoptions hasDefaultOptions� k  x�� ��� Z  A������� H  �� E  ��� o  ����  0 booleanoptions booleanOptions� m  �� ���  h� k  =�� ��� r  ��� b  ��� m  �� ���  h� o  ����  0 defaultoptions defaultOptions� o      ����  0 defaultoptions defaultOptions� ���� r  =��� b  ;��� b  7��� b  1��� b  -��� b  )��� b  #��� o  ����  0 optionssection optionsSection� o  "���� 
0 lf2 LF2� o  #(���� 0 indent1 Indent1� m  ),�� ���  - h ,   - - h e l p� 1  -0��
�� 
lnfd� o  16���� 0 indent2 Indent2� m  7:�� ��� 2 P r i n t   t h i s   h e l p   a n d   e x i t .� o      ����  0 optionssection optionsSection��  ��  ��  � ���� Z  Bx������� H  BH�� E  BG��� o  BC����  0 booleanoptions booleanOptions� m  CF�� ���  v� k  Kt�� ��� r  KR��� b  KP��� o  KL����  0 defaultoptions defaultOptions� m  LO�� ���  v� o      ����  0 defaultoptions defaultOptions� ���� r  St��� b  Sr��� b  Sn��� b  Sh��� b  Sd��� b  S`��� b  SZ��� o  ST����  0 optionssection optionsSection� o  TY���� 
0 lf2 LF2� o  Z_���� 0 indent1 Indent1� m  `c�� ���  - v ,   - - v e r s i o n� 1  dg��
�� 
lnfd� o  hm���� 0 indent2 Indent2� m  nq�� ��� < P r i n t   v e r s i o n   n u m b e r   a n d   e x i t .� o      ����  0 optionssection optionsSection��  ��  ��  ��  ��  ��  � ��� r  }���� m  }��� ���  � o      ���� "0 optionssynopsis optionsSynopsis�    Z ������ > �� o  ������  0 defaultoptions defaultOptions m  �� �   r  ��	 b  ��

 b  �� b  �� o  ������ "0 optionssynopsis optionsSynopsis m  �� �    [ - o  ������  0 defaultoptions defaultOptions m  �� �  ]	 o      ���� "0 optionssynopsis optionsSynopsis��  ��    Z ������ > �� o  ������  0 booleanoptions booleanOptions m  �� �   r  �� b  �� b  �� !  b  ��"#" o  ������ "0 optionssynopsis optionsSynopsis# m  ��$$ �%%    [ -! o  ������  0 booleanoptions booleanOptions m  ��&& �''  ] o      ���� "0 optionssynopsis optionsSynopsis��  ��   ()( Z ��*+����* > ��,-, o  ������ 0 otheroptions otherOptions- m  ��.. �//  + r  ��010 b  ��232 o  ������ "0 optionssynopsis optionsSynopsis3 o  ������ 0 otheroptions otherOptions1 o      ���� "0 optionssynopsis optionsSynopsis��  ��  ) 4��4 L  ��55 J  ��66 787 o  ������ "0 optionssynopsis optionsSynopsis8 9��9 o  ������  0 optionssection optionsSection��  ��  . :;: l     ��������  ��  ��  ; <=< l     ��������  ��  ��  = >?> i  � �@A@ I      ��B���� $0 _formatarguments _formatArgumentsB CDC o      ���� *0 argumentdefinitions argumentDefinitionsD E��E o      ���� 0 vtstyle vtStyle��  ��  A k    >FF GHG Z    IJ����I =    KLK o     ���� *0 argumentdefinitions argumentDefinitionsL J    ����  J L    MM J    NN OPO m    QQ �RR  P S��S m    	TT �UU  ��  ��  ��  H VWV r    XYX m    ZZ �[[  Y o      ���� &0 argumentssynopsis argumentsSynopsisW \]\ r     ^_^ b    `a` b    bcb n   ded o    ���� 0 b  e o    ���� 0 vtstyle vtStylec m    ff �gg  A R G U M E N T Sa n   hih o    ���� 0 n  i o    ���� 0 vtstyle vtStyle_ o      ���� $0 argumentssection argumentsSection] jkj X   !4l��ml k   1/nn opo r   1 Mqrq b   1 Ksts l  1 4u����u c   1 4vwv o   1 2���� 0 argumentref argumentRefw m   2 3��
�� 
reco��  ��  t K   4 Jxx ��yz�� 0 	valuetype 	valueTypey m   5 6��
�� 
ctxtz ��{|�� 0 islist isList{ m   7 8��
�� boovfals| ��}~�� 0 defaultvalue defaultValue} o   9 >���� 0 novalue NoValue~ ����� $0 valueplaceholder valuePlaceholder m   ? @�� ���  � ������� $0 valuedescription valueDescription� m   C F�� ���  ��  r o      ���� (0 argumentdefinition argumentDefinitionp ��� Q   N ����� k   Q v�� ��� r   Q Z��� c   Q X��� n  Q T��� o   R T���� 0 	valuetype 	valueType� o   Q R���� (0 argumentdefinition argumentDefinition� m   T W��
�� 
type� o      ���� 0 	valuetype 	valueType� ��� r   [ d��� c   [ b��� n  [ ^��� o   \ ^���� 0 islist isList� o   [ \���� (0 argumentdefinition argumentDefinition� m   ^ a��
�� 
bool� o      ���� 0 islist isList� ��� r   e l��� c   e j��� n  e h��� o   f h���� $0 valueplaceholder valuePlaceholder� o   e f���� (0 argumentdefinition argumentDefinition� m   h i��
�� 
ctxt� o      ���� $0 valueplaceholder valuePlaceholder� ���� r   m v��� c   m t��� n  m r��� o   n r���� $0 valuedescription valueDescription� o   m n���� (0 argumentdefinition argumentDefinition� m   r s��
�� 
ctxt� o      ���� $0 valuedescription valueDescription��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �����  � n  ~ ���� I   � ��~��}�~ 60 throwinvalidparametertype throwInvalidParameterType� ��� o   � ��|�| *0 argumentdefinitions argumentDefinitions� ��� m   � ��� ���  a r g u m e n t s� ��� m   � ��{
�{ 
reco� ��z� m   � ��� ��� d l i s t   o f    c o m m a n d   l i n e   a r g u m e n t   d e f i n i t i o n    r e c o r d s�z  �}  � o   ~ ��y�y 0 _support  � ��� Z  � ����x�w� =  � ���� o   � ��v�v $0 valueplaceholder valuePlaceholder� m   � ��� ���  � r   � ���� I   � ��u��t�u 40 _defaultvalueplaceholder _defaultValuePlaceholder� ��s� o   � ��r�r (0 argumentdefinition argumentDefinition�s  �t  � o      �q�q $0 valueplaceholder valuePlaceholder�x  �w  � ��� Z  � ����p�o� o   � ��n�n 0 islist isList� r   � ���� b   � ���� o   � ��m�m $0 valueplaceholder valuePlaceholder� m   � ��� ���    . . .� o      �l�l $0 valueplaceholder valuePlaceholder�p  �o  � ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ��k�k $0 argumentssection argumentsSection� o   � ��j�j 
0 lf2 LF2� o   � ��i�i 0 indent1 Indent1� n  � ���� o   � ��h�h 0 u  � o   � ��g�g 0 vtstyle vtStyle� o   � ��f�f $0 valueplaceholder valuePlaceholder� n  � ���� o   � ��e�e 0 n  � o   � ��d�d 0 vtstyle vtStyle� o      �c�c $0 argumentssection argumentsSection� ��� Z  � ����b�a� >  � ���� n  � ���� o   � ��`�` 0 defaultvalue defaultValue� o   � ��_�_ (0 argumentdefinition argumentDefinition� o   � ��^�^ 0 novalue NoValue� r   � ���� b   � ���� o   � ��]�] $0 valuedescription valueDescription� I   � ��\��[�\ *0 _formatdefaultvalue _formatDefaultValue� ��Z� o   � ��Y�Y (0 argumentdefinition argumentDefinition�Z  �[  � o      �X�X $0 valuedescription valueDescription�b  �a  � ��� Z  �	���W�V� >  � ���� o   � ��U�U $0 valuedescription valueDescription� m   � ��� ���  � r   ���� b   ���� b   ���� b   � �   o   � ��T�T $0 argumentssection argumentsSection 1   � ��S
�S 
lnfd� o   � �R�R 0 indent2 Indent2� o  �Q�Q $0 valuedescription valueDescription� o      �P�P $0 argumentssection argumentsSection�W  �V  �  Z 
%�O�N > 
 n 
	 o  �M�M 0 defaultvalue defaultValue	 o  
�L�L (0 argumentdefinition argumentDefinition o  �K�K 0 novalue NoValue r  !

 b   b   m   �  [ o  �J�J $0 valueplaceholder valuePlaceholder m   �  ] o      �I�I $0 valueplaceholder valuePlaceholder�O  �N   �H r  &/ b  &- b  &+ o  &'�G�G &0 argumentssynopsis argumentsSynopsis 1  '*�F
�F 
spac o  +,�E�E $0 valueplaceholder valuePlaceholder o      �D�D &0 argumentssynopsis argumentsSynopsis�H  �� 0 argumentref argumentRefm o   $ %�C�C *0 argumentdefinitions argumentDefinitionsk �B L  5> J  5=  b  5: !  m  58"" �## 
   [ - - ]! o  89�A�A &0 argumentssynopsis argumentsSynopsis $�@$ o  :;�?�? $0 argumentssection argumentsSection�@  �B  ? %&% l     �>�=�<�>  �=  �<  & '(' l     �;)*�;  )  -----   * �++ 
 - - - - -( ,-, l     �:�9�8�:  �9  �8  - ./. i  � �010 I     �723
�7 .Fil:Argvnull���     ****2 l 
    4�6�54 o      �4�4 0 argv  �6  �5  3 �356
�3 
OpsD5 |�2�17�08�2  �1  7 o      �/�/ &0 optiondefinitions optionDefinitions�0  8 l 
    9�.�-9 J      �,�,  �.  �-  6 �+:;
�+ 
OpsA: |�*�)<�(=�*  �)  < o      �'�' *0 argumentdefinitions argumentDefinitions�(  = l 
    >�&�%> J      ?? @�$@ K      AA �#BC�# 0 propertyname propertyNameB m      DD �EE  a r g u m e n t s L i s tC �"F�!�" 0 islist isListF m      � 
�  boovtrue�!  �$  �&  �%  ; �G�
� 
DefOG |��H�I�  �  H o      �� &0 hasdefaultoptions hasDefaultOptions�  I l     J��J m      �
� boovtrue�  �  �  1 k     �KK LML l     �NO�  N�� note: while NSUserDefaults provides some argument parsing support (see its NSArgumentDomain), it uses an atypical syntax and reads directly from argv, making it difficult both to omit arguments provided to osascript itself and to extract any arguments remaining after options are parsed; thus, this handler implements its own argv parser that avoids NSUserDefaults' deficiencies while also providing a better optparse-style UI/UX to both shell script authors and users   O �PP�   n o t e :   w h i l e   N S U s e r D e f a u l t s   p r o v i d e s   s o m e   a r g u m e n t   p a r s i n g   s u p p o r t   ( s e e   i t s   N S A r g u m e n t D o m a i n ) ,   i t   u s e s   a n   a t y p i c a l   s y n t a x   a n d   r e a d s   d i r e c t l y   f r o m   a r g v ,   m a k i n g   i t   d i f f i c u l t   b o t h   t o   o m i t   a r g u m e n t s   p r o v i d e d   t o   o s a s c r i p t   i t s e l f   a n d   t o   e x t r a c t   a n y   a r g u m e n t s   r e m a i n i n g   a f t e r   o p t i o n s   a r e   p a r s e d ;   t h u s ,   t h i s   h a n d l e r   i m p l e m e n t s   i t s   o w n   a r g v   p a r s e r   t h a t   a v o i d s   N S U s e r D e f a u l t s '   d e f i c i e n c i e s   w h i l e   a l s o   p r o v i d i n g   a   b e t t e r   o p t p a r s e - s t y l e   U I / U X   t o   b o t h   s h e l l   s c r i p t   a u t h o r s   a n d   u s e r sM Q�Q P     �RSTR k    �UU VWV r    
XYX n   Z[Z 1    �
� 
txdl[ 1    �
� 
ascrY o      �� 0 oldtids oldTIDsW \�\ Q    �]^_] k    j`` aba l   �cd�  c ) # first, ensure parameters are lists   d �ee F   f i r s t ,   e n s u r e   p a r a m e t e r s   a r e   l i s t sb fgf r    hih n   jkj I    �l�� "0 aslistparameter asListParameterl m�m o    �� 0 argv  �  �  k o    �� 0 _support  i o      �
�
 0 argv  g non r    'pqp n   %rsr I     %�	t��	 "0 aslistparameter asListParametert u�u o     !�� &0 optiondefinitions optionDefinitions�  �  s o     �� 0 _support  q o      �� &0 optiondefinitions optionDefinitionso vwv r   ( 4xyx n  ( 2z{z I   - 2�|�� "0 aslistparameter asListParameter| }�} o   - .� �  *0 argumentdefinitions argumentDefinitions�  �  { o   ( -���� 0 _support  y o      ���� *0 argumentdefinitions argumentDefinitionsw ~~ l  5 5������  � � � next iterate over the raw argument list, identifying option names and (if non-boolean) values, returning a NSMutableDictionary of parsed option values plus a list of any remaining (i.e. non-option) arguments   � ����   n e x t   i t e r a t e   o v e r   t h e   r a w   a r g u m e n t   l i s t ,   i d e n t i f y i n g   o p t i o n   n a m e s   a n d   ( i f   n o n - b o o l e a n )   v a l u e s ,   r e t u r n i n g   a   N S M u t a b l e D i c t i o n a r y   o f   p a r s e d   o p t i o n   v a l u e s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s ��� r   5 N��� I      ������� 0 _parseoptions _parseOptions� ��� n   6 9��� 2  7 9��
�� 
cobj� o   6 7���� 0 argv  � ��� o   9 :���� &0 optiondefinitions optionDefinitions� ���� o   : ;���� &0 hasdefaultoptions hasDefaultOptions��  ��  � J      �� ��� o      ���� (0 asocparametersdict asocParametersDict� ���� o      ���� 0 argumentslist argumentsList��  � ��� l  O O������  � v p add default values for any missing options to asocParametersDict, raising error if a required option is missing   � ��� �   a d d   d e f a u l t   v a l u e s   f o r   a n y   m i s s i n g   o p t i o n s   t o   a s o c P a r a m e t e r s D i c t ,   r a i s i n g   e r r o r   i f   a   r e q u i r e d   o p t i o n   i s   m i s s i n g� ��� I   O V������� (0 _adddefaultoptions _addDefaultOptions� ��� o   P Q���� (0 asocparametersdict asocParametersDict� ���� o   Q R���� &0 optiondefinitions optionDefinitions��  ��  � ��� l  W W������  � b \ parse the remaining arguments as named positional parameters, adding them to the dictionary   � ��� �   p a r s e   t h e   r e m a i n i n g   a r g u m e n t s   a s   n a m e d   p o s i t i o n a l   p a r a m e t e r s ,   a d d i n g   t h e m   t o   t h e   d i c t i o n a r y� ��� I   W _������� "0 _parsearguments _parseArguments� ��� o   X Y���� 0 argumentslist argumentsList� ��� o   Y Z���� *0 argumentdefinitions argumentDefinitions� ���� o   Z [���� (0 asocparametersdict asocParametersDict��  ��  � ��� r   ` e��� o   ` a���� 0 oldtids oldTIDs� n     ��� 1   b d��
�� 
txdl� 1   a b��
�� 
ascr� ���� l  f j���� L   f j�� c   f i��� o   f g���� (0 asocparametersdict asocParametersDict� m   g h��
�� 
****� : 4 coerce the dictionary to an AS record and return it   � ��� h   c o e r c e   t h e   d i c t i o n a r y   t o   a n   A S   r e c o r d   a n d   r e t u r n   i t��  ^ R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  _ k   r ��� ��� r   r w��� o   r s���� 0 oldtids oldTIDs� n     ��� 1   t v��
�� 
txdl� 1   s t��
�� 
ascr� ���� Z   x ������� =   x ��� o   x y���� 0 enumber eNumber� o   y ~����  0 _argvusererror _ArgvUserError� R   � �����
�� .ascrerr ****      � ****� o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enumber eNumber� ����
�� 
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  ��  � I   � �������� 
0 _error  � ��� m   � ��� ��� 8 p a r s e   c o m m a n d   l i n e   a r g u m e n t s� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  ��  �  S ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  T ����
�� consnume��  �  / ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Fil:FHlpnull��� ��� null��  � ����
�� 
Name� |����������  ��  � o      ���� 0 commandname commandName��  � l 
    ������ l     ������ m      �� ���  ��  ��  ��  ��  � ����
�� 
Summ� |����������  ��  � o      ���� $0 shortdescription shortDescription��  � l 
    ������ l     ������ m      �� ���  ��  ��  ��  ��  � ����
�� 
Usag� |������� ��  ��  � o      ���� "0 commandsynopses commandSynopses��    l 
    ���� J      ����  ��  ��  � ��
�� 
OpsD |��������  ��   o      ���� &0 optiondefinitions optionDefinitions��   l 
    ���� J      ����  ��  ��   ��
�� 
OpsA |����	��
��  ��  	 o      ���� *0 argumentdefinitions argumentDefinitions��  
 l 
    ���� J       �� K       ���� 0 propertyname propertyName m       �  a r g u m e n t s L i s t ������ 0 islist isList m      ��
�� boovtrue��  ��  ��  ��   ��
�� 
Docu |����~��  �   o      �}�} "0 longdescription longDescription�~   l 
    �|�{ l     �z�y m       �  �z  �y  �|  �{   �x
�x 
VFmt |�w�v�u�w  �v   o      �t�t 0 isstyled isStyled�u   l 
     �s�r  l     !�q�p! m      �o
�o boovtrue�q  �p  �s  �r   �n"�m
�n 
DefO" |�l�k#�j$�l  �k  # o      �i�i &0 hasdefaultoptions hasDefaultOptions�j  $ l     %�h�g% m      �f
�f boovtrue�h  �g  �m  � P    �&'(& Q   �)*+) k   �,, -.- r    /0/ n   121 I    �e3�d�e "0 astextparameter asTextParameter3 454 o    �c�c 0 commandname commandName5 6�b6 m    77 �88  n a m e�b  �d  2 o    �a�a 0 _support  0 o      �`�` 0 commandname commandName. 9:9 r    ";<; n    =>= I     �_?�^�_ "0 aslistparameter asListParameter? @�]@ o    �\�\ &0 optiondefinitions optionDefinitions�]  �^  > o    �[�[ 0 _support  < o      �Z�Z &0 optiondefinitions optionDefinitions: ABA r   # /CDC n  # -EFE I   ( -�YG�X�Y "0 aslistparameter asListParameterG H�WH o   ( )�V�V *0 argumentdefinitions argumentDefinitions�W  �X  F o   # (�U�U 0 _support  D o      �T�T *0 argumentdefinitions argumentDefinitionsB IJI r   0 <KLK n  0 :MNM I   5 :�SO�R�S "0 aslistparameter asListParameterO P�QP o   5 6�P�P "0 commandsynopses commandSynopses�Q  �R  N o   0 5�O�O 0 _support  L o      �N�N "0 commandsynopses commandSynopsesJ QRQ r   = JSTS n  = HUVU I   B H�MW�L�M "0 astextparameter asTextParameterW XYX o   B C�K�K $0 shortdescription shortDescriptionY Z�JZ m   C D[[ �\\  s u m m a r y�J  �L  V o   = B�I�I 0 _support  T o      �H�H $0 shortdescription shortDescriptionR ]^] r   K X_`_ n  K Vaba I   P V�Gc�F�G "0 astextparameter asTextParameterc ded o   P Q�E�E "0 longdescription longDescriptione f�Df m   Q Rgg �hh  d o c u m e n t a t i o n�D  �F  b o   K P�C�C 0 _support  ` o      �B�B "0 longdescription longDescription^ iji Z   Y �kl�Amk n  Y dnon I   ^ d�@p�?�@ (0 asbooleanparameter asBooleanParameterp qrq o   ^ _�>�> 0 isstyled isStyledr s�=s m   _ `tt �uu  t e r m i n a l   s t y l e s�=  �?  o o   Y ^�<�< 0 _support  l l  g �vwxv r   g �yzy K   g ~{{ �;|}�; 0 n  | I   h n�:~�9�: 0 vt100 VT100~ �8 m   i j�7�7  �8  �9  } �6���6 0 b  � I   o u�5��4�5 0 vt100 VT100� ��3� m   p q�2�2 �3  �4  � �1��0�1 0 u  � I   v |�/��.�/ 0 vt100 VT100� ��-� m   w x�,�, �-  �.  �0  z o      �+�+ 0 vtstyle vtStylew   normal, bold, underline   x ��� 0   n o r m a l ,   b o l d ,   u n d e r l i n e�A  m r   � ���� K   � ��� �*���* 0 n  � m   � ��� ���  � �)���) 0 b  � m   � ��� ���  � �(��'�( 0 u  � m   � ��� ���  �'  � o      �&�& 0 vtstyle vtStylej ��� l  � ��%���%  � %  construct NAME summary section   � ��� >   c o n s t r u c t   N A M E   s u m m a r y   s e c t i o n� ��� Z   � ����$�#� =  � ���� o   � ��"�" 0 commandname commandName� m   � ��� ���  � l  � ����� Q   � ����� r   � ���� l  � ���!� � I  � ����
� .Fil:SplPnull���     ctxt� l  � ����� n   � ���� o   � ��� 0 _  � l  � ����� I  � ����
� .Fil:EnVanull��� ��� null�  �  �  �  �  �  �  �!  �   � o      �� 0 commandname commandName� R      ���
� .ascrerr ****      � ****�  �  � l  � ����� r   � ���� m   � ��� ���  C O M M A N D� o      �� 0 commandname commandName� T N fallback on the offchance the above should fail to get the script's file name   � ��� �   f a l l b a c k   o n   t h e   o f f c h a n c e   t h e   a b o v e   s h o u l d   f a i l   t o   g e t   t h e   s c r i p t ' s   f i l e   n a m e� B < use the AppleScript shell script's own file name by default   � ��� x   u s e   t h e   A p p l e S c r i p t   s h e l l   s c r i p t ' s   o w n   f i l e   n a m e   b y   d e f a u l t�$  �#  � ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� n  � ���� o   � ��� 0 b  � o   � ��� 0 vtstyle vtStyle� m   � ��� ���  N A M E� n  � ���� o   � ��� 0 n  � o   � ��� 0 vtstyle vtStyle� o   � ��� 
0 lf2 LF2� o   � ��� 0 indent1 Indent1� o   � ��
�
 0 commandname commandName� o      �	�	 0 helptext helpText� ��� Z   � ������ >  � ���� o   � ��� $0 shortdescription shortDescription� m   � ��� ���  � r   � ���� b   � ���� b   � ���� o   � ��� 0 helptext helpText� m   � ��� ���    - -  � o   � ��� $0 shortdescription shortDescription� o      �� 0 helptext helpText�  �  � ��� l  � �����  � B < construct default SYNOPSIS, OPTIONS, and ARGUMENTS sections   � ��� x   c o n s t r u c t   d e f a u l t   S Y N O P S I S ,   O P T I O N S ,   a n d   A R G U M E N T S   s e c t i o n s� ��� r   ���� I      ��� �  0 _formatoptions _formatOptions� ��� o   � ����� &0 optiondefinitions optionDefinitions� ��� o   � ����� 0 vtstyle vtStyle� ���� o   � ����� &0 hasdefaultoptions hasDefaultOptions��  �   � J      �� ��� o      ���� 00 defaultoptionssynopsis defaultOptionsSynopsis� ���� o      ����  0 optionssection optionsSection��  � ��� r  &��� I      ������� $0 _formatarguments _formatArguments� ��� o  ���� *0 argumentdefinitions argumentDefinitions� ���� o  ���� 0 vtstyle vtStyle��  ��  � J      �� ��� o      ���� 40 defaultargumentssynopsis defaultArgumentsSynopsis� ���� o      ���� $0 argumentssection argumentsSection��  � ��� r  '<� � b  ': b  '6 b  '2 b  '. o  '(���� 0 helptext helpText o  (-���� 
0 lf2 LF2 n .1	
	 o  /1���� 0 b  
 o  ./���� 0 vtstyle vtStyle m  25 �  S Y N O P S I S n 69 o  79���� 0 n   o  67���� 0 vtstyle vtStyle  o      ���� 0 helptext helpText�  Z  =Q���� = =A o  =>���� "0 commandsynopses commandSynopses J  >@����   r  DM J  DK �� b  DI b  DG o  DE���� 0 commandname commandName o  EF���� 00 defaultoptionssynopsis defaultOptionsSynopsis o  GH���� 40 defaultargumentssynopsis defaultArgumentsSynopsis��   o      ���� "0 commandsynopses commandSynopses��  ��    Q  R� ! X  U"��#" r  iz$%$ b  ix&'& b  iv()( b  ip*+* o  ij���� 0 helptext helpText+ o  jo���� 
0 lf2 LF2) o  pu���� 0 indent1 Indent1' o  vw���� 0 textref textRef% o      ���� 0 helptext helpText�� 0 textref textRef# o  XY���� "0 commandsynopses commandSynopses  R      ����,
�� .ascrerr ****      � ****��  , ��-��
�� 
errn- d      .. m      �������  ! n ��/0/ I  ����1���� 60 throwinvalidparametertype throwInvalidParameterType1 232 o  ������ "0 commandsynopses commandSynopses3 454 m  ��66 �77  s y n o p s i s5 898 m  ����
�� 
list9 :��: m  ��;; �<<  l i s t   o f   t e x t��  ��  0 o  ������ 0 _support   =>= r  ��?@? b  ��ABA b  ��CDC b  ��EFE b  ��GHG o  ������ 0 helptext helpTextH o  ������ 
0 lf2 LF2F o  ������  0 optionssection optionsSectionD o  ������ 
0 lf2 LF2B o  ������ $0 argumentssection argumentsSection@ o      ���� 0 helptext helpText> IJI l ����KL��  K - ' add long DESCRIPTION section, if given   L �MM N   a d d   l o n g   D E S C R I P T I O N   s e c t i o n ,   i f   g i v e nJ NON Z  ��PQ����P > ��RSR o  ������ "0 longdescription longDescriptionS m  ��TT �UU  Q r  ��VWV b  ��XYX b  ��Z[Z b  ��\]\ b  ��^_^ b  ��`a` b  ��bcb o  ������ 0 helptext helpTextc o  ������ 
0 lf2 LF2a n ��ded o  ������ 0 b  e o  ������ 0 vtstyle vtStyle_ m  ��ff �gg  D E S C R I P T I O N] n ��hih o  ������ 0 n  i o  ������ 0 vtstyle vtStyle[ o  ������ 
0 lf2 LF2Y o  ������ "0 longdescription longDescriptionW o      ���� 0 helptext helpText��  ��  O j��j L  ��kk b  ��lml o  ������ 0 helptext helpTextm 1  ����
�� 
lnfd��  * R      ��no
�� .ascrerr ****      � ****n o      ���� 0 etext eTexto ��pq
�� 
errnp o      ���� 0 enumber eNumberq ��rs
�� 
erobr o      ���� 0 efrom eFroms ��t��
�� 
errtt o      ���� 
0 eto eTo��  + I  ����u���� 
0 _error  u vwv m  ��xx �yy 0 f o r m a t   c o m m a n d   l i n e   h e l pw z{z o  ������ 0 etext eText{ |}| o  ������ 0 enumber eNumber} ~~ o  ������ 0 efrom eFrom ���� o  ������ 
0 eto eTo��  ��  ' ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  ( ����
�� consnume��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     ������
�� .Fil:CurFnull��� ��� null��  ��  � Q     :���� k    (�� ��� r    ��� n   ��� I   
 �������� ,0 currentdirectorypath currentDirectoryPath��  ��  � n   
��� I    
�������  0 defaultmanager defaultManager��  �  � n   ��� o    �� 0 nsfilemanager NSFileManager� m    �
� misccura� o      �� 0 asocpath asocPath� ��� Z   !����� =   ��� o    �� 0 asocpath asocPath� m    �
� 
msng� R    ���
� .ascrerr ****      � ****� m    �� ���  N o t   a v a i l a b l e .� ���
� 
errn� m    ���@�  �  �  � ��� L   " (�� c   " '��� c   " %��� o   " #�� 0 asocpath asocPath� m   # $�
� 
ctxt� m   % &�
� 
psxf�  � R      ���
� .ascrerr ****      � ****� o      �~�~ 0 etext eText� �}��
�} 
errn� o      �|�| 0 enumber eNumber� �{��
�{ 
erob� o      �z�z 0 efrom eFrom� �y��x
�y 
errt� o      �w�w 
0 eto eTo�x  � I   0 :�v��u�v 
0 _error  � ��� m   1 2�� ��� , c u r r e n t   w o r k i n g   f o l d e r� ��� o   2 3�t�t 0 etext eText� ��� o   3 4�s�s 0 enumber eNumber� ��� o   4 5�r�r 0 efrom eFrom� ��q� o   5 6�p�p 
0 eto eTo�q  �u  � ��� l     �o�n�m�o  �n  �m  � ��� l     �l�k�j�l  �k  �j  � ��� i  � ���� I     �i�h�g
�i .Fil:EnVanull��� ��� null�h  �g  � L     �� c     ��� l    ��f�e� n    ��� I    �d�c�b�d 0 environment  �c  �b  � n    ��� I    �a�`�_�a 0 processinfo processInfo�`  �_  � n    ��� o    �^�^ 0 nsprocessinfo NSProcessInfo� m     �]
�] misccura�f  �e  � m    �\
�\ 
****� ��� l     �[�Z�Y�[  �Z  �Y  � ��� l     �X�W�V�X  �W  �V  � ��� i  � ���� I     �U�T�
�U .Fil:RSInnull��� ��� null�T  � �S��
�S 
Prmt� |�R�Q��P��R  �Q  � o      �O�O 0 
prompttext 
promptText�P  � l     ��N�M� m      �� ���  > >  �N  �M  � �L��K
�L 
ReTo� |�J�I��H��J  �I  � o      �G�G 0 isinteractive isInteractive�H  � l     ��F�E� m      �D
�D boovfals�F  �E  �K  � Q     ����� k    ��� ��� r    ��� n   
��� I    
�C�B�A�C :0 filehandlewithstandardinput fileHandleWithStandardInput�B  �A  � n   ��� o    �@�@ 0 nsfilehandle NSFileHandle� m    �?
�? misccura� o      �>�> 0 	asocstdin 	asocStdin� ��� Z    =���=�� o    �<�< 0 isinteractive isInteractive� k    3�� ��� I   �;��
�; .Fil:WSOunull���     ctxt� o    �:�: 0 
prompttext 
promptText� �9��
�9 
SLiB� m    �8
�8 boovfals� �7��6
�7 
ALiE�6  � � � r    " n     I     �5�4�3�5 0 availabledata availableData�4  �3   o    �2�2 0 	asocstdin 	asocStdin o      �1�1 0 asocdata asocData  �0 Z  # 3�/�. =   # *	 n  # (

 I   $ (�-�,�+�- 
0 length  �,  �+   o   # $�*�* 0 asocdata asocData	 m   ( )�)�)   L   - / m   - .�(
�( 
msng�/  �.  �0  �=  � r   6 = n  6 ; I   7 ;�'�&�%�' *0 readdatatoendoffile readDataToEndOfFile�&  �%   o   6 7�$�$ 0 	asocstdin 	asocStdin o      �#�# 0 asocdata asocData�  r   > O n  > M I   E M�"�!�" 00 initwithdata_encoding_ initWithData_encoding_  o   E F� �  0 asocdata asocData � l  F I�� n  F I o   G I�� ,0 nsutf8stringencoding NSUTF8StringEncoding m   F G�
� misccura�  �  �  �!   n  > E I   A E���� 	0 alloc  �  �   n  > A !  o   ? A�� 0 nsstring NSString! m   > ?�
� misccura o      �� 0 
asocstring 
asocString "#" Z  P d$%��$ =  P S&'& o   P Q�� 0 
asocstring 
asocString' m   Q R�
� 
msng% R   V `�()
� .ascrerr ****      � ****( m   \ _** �++ , N o t   U T F 8 - e n c o d e d   t e x t .) �,�
� 
errn, m   X [���\�  �  �  # -.- Z  e �/0��/ n  e m121 I   f m�
3�	�
 0 
hassuffix_ 
hasSuffix_3 4�4 1   f i�
� 
lnfd�  �	  2 o   e f�� 0 
asocstring 
asocString0 r   p ~565 n  p |787 I   q |�9�� &0 substringtoindex_ substringToIndex_9 :�: l  q x;��; \   q x<=< l  q v>� ��> n  q v?@? I   r v�������� 
0 length  ��  ��  @ o   q r���� 0 
asocstring 
asocString�   ��  = m   v w���� �  �  �  �  8 o   p q���� 0 
asocstring 
asocString6 o      ���� 0 
asocstring 
asocString�  �  . A��A L   � �BB c   � �CDC o   � ����� 0 
asocstring 
asocStringD m   � ���
�� 
ctxt��  � R      ��EF
�� .ascrerr ****      � ****E o      ���� 0 etext eTextF ��GH
�� 
errnG o      ���� 0 enumber eNumberH ��IJ
�� 
erobI o      ���� 0 efrom eFromJ ��K��
�� 
errtK o      ���� 
0 eto eTo��  � I   � ���L���� 
0 _error  L MNM m   � �OO �PP & r e a d   s t a n d a r d   i n p u tN QRQ o   � ����� 0 etext eTextR STS o   � ����� 0 enumber eNumberT UVU o   � ����� 0 efrom eFromV W��W o   � ����� 
0 eto eTo��  ��  � XYX l     ��������  ��  ��  Y Z[Z l     ��������  ��  ��  [ \]\ i  � �^_^ I     ��`a
�� .Fil:WSOunull���     ctxt` o      ���� 0 thetext theTexta ��bc
�� 
SLiBb |����d��e��  ��  d o      ���� 0 uselinefeeds useLinefeeds��  e l     f����f m      ��
�� boovtrue��  ��  c ��g��
�� 
ALiEg |����h��i��  ��  h o      ����  0 withlineending withLineEnding��  i l     j����j m      ��
�� boovtrue��  ��  ��  _ Q     �klmk k    nn opo r    qrq n   sts I    ��u���� &0 asnsmutablestring asNSMutableStringu v��v n   wxw I    ��y���� "0 astextparameter asTextParametery z{z o    ���� 0 thetext theText{ |��| m    }} �~~  ��  ��  x o    ���� 0 _support  ��  ��  t o    ���� 0 _support  r o      ���� 0 
asocstring 
asocStringp � Z    I������� o    �� 0 uselinefeeds useLinefeeds� k    E�� ��� n   2��� I    2���� l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_� ��� l 
  "���� l   "���� b    "��� o     �
� 
ret � 1     !�
� 
lnfd�  �  �  �  � ��� l  " #���� 1   " #�
� 
lnfd�  �  � ��� m   # $��  � ��� K   $ .�� ���� 0 location  � m   % &��  � ���� 
0 length  � n  ' ,��� I   ( ,���� 
0 length  �  �  � o   ' (�� 0 
asocstring 
asocString�  �  �  � o    �� 0 
asocstring 
asocString� ��� n  3 E��� I   4 E���� l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_� ��� l 
 4 5���� l  4 5���� o   4 5�
� 
ret �  �  �  �  � ��� l  5 6���� 1   5 6�
� 
lnfd�  �  � ��� m   6 7��  � ��� K   7 A�� ���� 0 location  � m   8 9��  � ���� 
0 length  � n  : ?��� I   ; ?���� 
0 length  �  �  � o   : ;�� 0 
asocstring 
asocString�  �  �  � o   3 4�� 0 
asocstring 
asocString�  ��  ��  � ��� Z  J d����� F   J W��� o   J K��  0 withlineending withLineEnding� H   N U�� l  N T���� n  N T��� I   O T���� 0 
hassuffix_ 
hasSuffix_� ��� 1   O P�
� 
lnfd�  �  � o   N O�� 0 
asocstring 
asocString�  �  � n  Z `��� I   [ `���� 0 appendstring_ appendString_� ��� 1   [ \�
� 
lnfd�  �  � o   Z [�� 0 
asocstring 
asocString�  �  � ��� r   e n��� n  e l��� I   h l���� <0 filehandlewithstandardoutput fileHandleWithStandardOutput�  �  � n  e h��� o   f h�� 0 nsfilehandle NSFileHandle� m   e f�
� misccura� o      �~�~ 0 
asocstdout 
asocStdout� ��� n  o |��� I   p |�}��|�} 0 
writedata_ 
writeData_� ��{� l  p x��z�y� n  p x��� I   q x�x��w�x (0 datausingencoding_ dataUsingEncoding_� ��v� l  q t��u�t� n  q t��� o   r t�s�s ,0 nsutf8stringencoding NSUTF8StringEncoding� m   q r�r
�r misccura�u  �t  �v  �w  � o   p q�q�q 0 
asocstring 
asocString�z  �y  �{  �|  � o   o p�p�p 0 
asocstdout 
asocStdout� ��o� L   } �n�n  �o  l R      �m��
�m .ascrerr ****      � ****� o      �l�l 0 etext eText� �k��
�k 
errn� o      �j�j 0 enumber eNumber� �i��
�i 
erob� o      �h�h 0 efrom eFrom� �g��f
�g 
errt� o      �e�e 
0 eto eTo�f  m I   � ��d��c�d 
0 _error  � ��� m   � ��� ��� * w r i t e   s t a n d a r d   o u t p u t� ��� o   � ��b�b 0 etext eText� ��� o   � ��a�a 0 enumber eNumber� ��� o   � ��`�` 0 efrom eFrom� ��_� o   � ��^�^ 
0 eto eTo�_  �c  ] ��� l     �]�\�[�]  �\  �[  � ��Z� l     �Y�X�W�Y  �X  �W  �Z       !�V������������U��ty������� �V  � �T�S�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�6
�T 
pimr�S 0 _support  �R 
0 _error  �Q (0 _nsstringencodings _NSStringEncodings
�P .Fil:Readnull���     file
�O .Fil:Writnull���     file
�N .Fil:ConPnull���     ****
�M .Fil:NorPnull���     ****
�L .Fil:JoiPnull���     ****
�K .Fil:SplPnull���     ctxt�J  0 _argvusererror _ArgvUserError�I 0 novalue NoValue�H 
0 lf2 LF2�G 0 indent1 Indent1�F 0 indent2 Indent2�E 0 vt100 VT100�D 0 _unpackvalue _unpackValue�C 40 _defaultvalueplaceholder _defaultValuePlaceholder�B *0 _formatdefaultvalue _formatDefaultValue�A (0 _buildoptionstable _buildOptionsTable�@ 0 _parseoptions _parseOptions�? (0 _adddefaultoptions _addDefaultOptions�> "0 _parsearguments _parseArguments�=  0 _formatoptions _formatOptions�< $0 _formatarguments _formatArguments
�; .Fil:Argvnull���     ****
�: .Fil:FHlpnull��� ��� null
�9 .Fil:CurFnull��� ��� null
�8 .Fil:EnVanull��� ��� null
�7 .Fil:RSInnull��� ��� null
�6 .Fil:WSOunull���     ctxt� �5	�5 	  

 �4�3
�4 
cobj    �2 
�2 
frmk�3   �1�0
�1 
cobj    �/
�/ 
osax�0  �    �. +
�. 
scpt� �- 5�,�+�*�- 
0 _error  �, �)�)   �(�'�&�%�$�( 0 handlername handlerName�' 0 etext eText�& 0 enumber eNumber�% 0 efrom eFrom�$ 
0 eto eTo�+   �#�"�!� ��# 0 handlername handlerName�" 0 etext eText�! 0 enumber eNumber�  0 efrom eFrom� 
0 eto eTo  E��� � &0 throwcommanderror throwCommandError�* b  ࠡ����+ � � b  � (0 _nsstringencodings _NSStringEncodings   ��� 
0 _list_  � 0 getencoding getEncoding ��    !"#$%&'()*+,- �.� .  ��
� FEncFE01�  �/� /  ��
� FEncFE02� 
 �0� 0  � �
� FEncFE03 �1� 1  � �
� FEncFE04 �2� 2  � �
� FEncFE05 �3� 3  � �
� FEncFE06 �
4�
 4  �	 �
�	 FEncFE07  �5� 5  ��
� FEncFE11� ! �6� 6  ��
� FEncFE12� " �7� 7  �� 
� FEncFE13�  # ��8�� 8  ����
�� FEncFE14�� 	$ ��9�� 9  ����
�� FEncFE15�� % ��:�� :  ����
�� FEncFE16�� & ��;�� ;  ����
�� FEncFE17�� ' ��<�� <  ����
�� FEncFE18�� ( ��=�� =  ����
�� FEncFE19�� ) ��>�� >  ����
�� FEncFE50�� * ��?�� ?  ����
�� FEncFE51�� + ��@�� @  ����
�� FEncFE52�� , ��A�� A  ����
�� FEncFE53�� - ��B�� B  ����
�� FEncFE54��  ������CD���� 0 getencoding getEncoding�� ��E�� E  ���� 0 textencoding textEncoding��  C ������ 0 textencoding textEncoding�� 0 aref aRefD ������������F������������E
�� 
enum�� 
0 _list_  
�� 
kocl
�� 
cobj
�� .corecnte****       ****��  F ������
�� 
errn���\��  
�� 
long
�� 
errn���Y
�� 
erob
�� 
errt�� �� W 5��&E�O ))�,[��l kh ��k/�  ��l/EY h[OY��W X   	��&W X  hO)�������� ��Z����GH��
�� .Fil:Readnull���     file�� 0 thefile theFile�� ��IJ
�� 
TypeI {�������� 0 datatype dataType��  
�� 
ctxtJ �K�
� 
EncoK {���� 0 textencoding textEncoding�  
� FEncFE01�  G ������������� 0 thefile theFile� 0 datatype dataType� 0 textencoding textEncoding� 0 	posixpath 	posixPath� 0 
asocstring 
asocString� 0 theerror theError� 0 fh  � 0 	theresult 	theResult� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToH  t�������������������������L������ ,0 asposixpathparameter asPOSIXPathParameter� "0 astypeparameter asTypeParameter
� 
ctxt
� FEncFEPE
� 
bool� 0 getencoding getEncoding
� misccura� 0 nsstring NSString
� 
obj � T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_
� 
cobj
� 
msng
� 
errn� 0 code  
� 
erob
� 
errt� � ,0 localizeddescription localizedDescription
� 
psxf
� .rdwropenshor       file
� 
as  
� .rdwrread****        ****
� .rdwrclosnull���     ****� 0 etext eTextL ��M
� 
errn� 0 enumber eNumberM ��N
� 
erob� 0 efrom eFromN ���
� 
errt� 
0 eto eTo�  �  �  � � 
0 _error  �� � �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& Ub  �k+ E�O��,���m+ E[�k/E�Z[�l/E�ZO��  )�j+ a �a �a �j+ �&Y hO��&Y O�a &j E�O �a �l E�O�j O�W )X   
�j W X  hO)�a �a �a �W X  *a ����a + � ���OP�
� .Fil:Writnull���     file� 0 thefile theFile� ��Q
� 
Data� 0 thedata theDataQ �RS
� 
TypeR {���� 0 datatype dataType�  
� 
ctxtS �T�
� 
EncoT {��~�}� 0 textencoding textEncoding�~  
�} FEncFE01�  O �|�{�z�y�x�w�v�u�t�s�r�q�p�| 0 thefile theFile�{ 0 thedata theData�z 0 datatype dataType�y 0 textencoding textEncoding�x 0 	posixpath 	posixPath�w 0 
asocstring 
asocString�v 0 
didsucceed 
didSucceed�u 0 theerror theError�t 0 fh  �s 0 etext eText�r 0 enumber eNumber�q 0 efrom eFrom�p 
0 eto eToP ')�o5�n�m�l�k�j�iQ�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�RU�Q�P��O�N�o ,0 asposixpathparameter asPOSIXPathParameter�n "0 astypeparameter asTypeParameter
�m 
ctxt
�l FEncFEPE
�k 
bool
�j misccura�i 0 nsstring NSString�h "0 astextparameter asTextParameter�g &0 stringwithstring_ stringWithString_�f 0 getencoding getEncoding
�e 
obj �d �c P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_
�b 
cobj
�a 
errn�` 0 code  
�_ 
erob
�^ 
errt�] �\ ,0 localizeddescription localizedDescription
�[ 
psxf
�Z 
perm
�Y .rdwropenshor       file
�X 
set2
�W .rdwrseofnull���     ****
�V 
refn
�U 
as  
�T .rdwrwritnull���     ****
�S .rdwrclosnull���     ****�R 0 etext eTextU �M�LV
�M 
errn�L 0 enumber eNumberV �K�JW
�K 
erob�J 0 efrom eFromW �I�H�G
�I 
errt�H 
0 eto eTo�G  �Q  �P  �O �N 
0 _error  �
 �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& i��,b  ��l+ 
k+ E�Ob  �k+ E�O��e���+ E[a k/E�Z[a l/E�ZO� !)a �j+ a �a �a �j+ �&Y hY a�a &a el E�O %�a jl O�a �a �� O�j OhW +X   ! 
�j W X " #hO)a �a �a �a �W X   !*a $����a %+ &� �F��E�DXY�C
�F .Fil:ConPnull���     ****�E 0 filepath filePath�D �BZ[
�B 
FromZ {�A�@�?�A 0 
fromformat 
fromFormat�@  
�? FLCTFLCP[ �>\�=
�> 
To__\ {�<�;�:�< 0 toformat toFormat�;  
�: FLCTFLCP�=  X 	�9�8�7�6�5�4�3�2�1�9 0 filepath filePath�8 0 
fromformat 
fromFormat�7 0 toformat toFormat�6 0 	posixpath 	posixPath�5 0 asocurl asocURL�4 0 etext eText�3 0 enumber eNumber�2 0 efrom eFrom�1 
0 eto eToY *�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ��F���M�d�����������]���
�0 
kocl
�/ 
ctxt
�. .corecnte****       ****�- ,0 asposixpathparameter asPOSIXPathParameter
�, FLCTFLCP
�+ FLCTFLCH
�* 
file
�) 
psxp
�( FLCTFLCU
�' misccura�& 0 nsurl NSURL�%  0 urlwithstring_ URLWithString_
�$ 
msng�# 0 fileurl fileURL
�" 
bool
�! 
errn� �Y
� 
erob� 
� 
errt
� 
enum� 
� 
leng
� FLCTFLCA
� 
psxf
� 
alis
� FLCTFLCX
� FLCTFLCS
� 
ascr� $0 fileurlwithpath_ fileURLWithPath_�  0 absolutestring absoluteString� 0 etext eText] ��^
� 
errn� 0 enumber eNumber^ ��_
� 
erob� 0 efrom eFrom_ �
�	�
�
 
errt�	 
0 eto eTo�  � � 
0 _error  �Cxc�kv��l j  b  ��l+ E�Y r��  �E�Y f��  *�/�,E�Y U��  7��,�k+ E�O�� 
 
�j+ �& )a a a �a a Y hY )a a a �a a a a O�a ,j  )a a a �a a Y hO��  �Y ��a   �a &a &Y ��a   �a &Y �a   _  �a &�&/Y f��  �a &�&Y U��  7��,�k+ !E�O��  )a a a �a a "�%Y hO�j+ #�&Y )a a a �a a a a $W X % &*a '����a (+ )� ����`a�
� .Fil:NorPnull���     ****� 0 filepath filePath� �b�
� 
ExpRb {�� ��� 0 isexpanding isExpanding�   
�� boovfals�  ` ������������ 0 filepath filePath�� 0 isexpanding isExpanding�� 0 etext eText�� 0 enumber eNumber�� 
0 eto eToa ��������������������c:������ ,0 asposixpathparameter asPOSIXPathParameter
�� 
bool
�� .Fil:CurFnull��� ��� null
�� .Fil:JoiPnull���     ****
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� 60 stringbystandardizingpath stringByStandardizingPath
�� 
ctxt�� 0 etext eTextc ����d
�� 
errn�� 0 enumber eNumberd ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � S Bb  ��l+ E�O�	 ���& *j �lvj E�Y hO��,�k+ j+ 	�&W X  *������+ � ��J����ef��
�� .Fil:JoiPnull���     ****��  0 pathcomponents pathComponents�� ��g��
�� 
Exteg {����Q�� 0 fileextension fileExtension��  ��  e 	��������������������  0 pathcomponents pathComponents�� 0 fileextension fileExtension�� 0 subpaths subPaths�� 0 aref aRef�� 0 asocpath asocPath�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTof c����������~�����������������������������������h������� "0 aslistparameter asListParameter
�� 
cobj
�� 
kocl
�� .corecnte****       ****
�� 
pcnt�� ,0 asposixpathparameter asPOSIXPathParameter��  ��  
�� 
errn���Y
�� 
erob�� 
�� misccura�� 0 nsstring NSString�� *0 pathwithcomponents_ pathWithComponents_�� "0 astextparameter asTextParameter
�� 
leng�� B0 stringbyappendingpathextension_ stringByAppendingPathExtension_
�� 
msng
�� 
ctxt�� 0 etext eTexth ���i
�� 
errn� 0 enumber eNumberi ��j
� 
erob� 0 efrom eFromj ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  �� � �b  ��l+ �-E�O ;�jv  	)jhY hO %�[��l kh b  ��,�l+ ��,F[OY��W X  	)�����O�a ,�k+ E�Ob  �a l+ E�O�a ,j $��k+ E�O�a   )����a Y hY hO�a &W X  *a ����a + � ����kl�
� .Fil:SplPnull���     ctxt� 0 filepath filePath� �m�
� 
Uponm {���� 0 splitposition splitPosition�  
� FLSPFLSL�  k ��������� 0 filepath filePath� 0 splitposition splitPosition� 0 asocpath asocPath� 0 matchformat matchFormat� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTol ���������������������1�nB��
� misccura� 0 nsstring NSString� ,0 asposixpathparameter asPOSIXPathParameter� &0 stringwithstring_ stringWithString_
� FLSPFLSL� F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent
� 
ctxt� &0 lastpathcomponent lastPathComponent
� FLSPFLSE� >0 stringbydeletingpathextension stringByDeletingPathExtension� 0 pathextension pathExtension
� FLSPFLSA�  0 pathcomponents pathComponents
� 
list
� 
errn��Y
� 
erob
� 
errt
� 
enum� � 0 etext eTextn ��o
� 
errn� 0 enumber eNumbero ��p
� 
erob� 0 efrom eFromp ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � � u��,b  ��l+ k+ E�O��  �j+ �&�j+ �&lvY C��  �j+ 
�&�j+ �&lvY )��  �j+ �&Y )�a a �a a a a W X  *a ����a + �U'� �f  q� 0 novalue NoValueq  rr  � �ss  
 
� ����tu�� 0 vt100 VT100� �v� v  �� 0 
formatcode 
formatCode�  t �� 0 
formatcode 
formatCodeu �����
� 
cha � 
� kfrmID  � )���0�%�%�%� ���~�}wx�|� 0 _unpackvalue _unpackValue�~ �{y�{ y  �z�y�z 0 thevalue theValue�y $0 definitionrecord definitionRecord�}  w �x�w�v�u�t�s�r�x 0 thevalue theValue�w $0 definitionrecord definitionRecord�v 0 	valuetype 	valueType�u 0 	theresult 	theResult�t 0 asocformatter asocFormatter�s 0 
asocresult 
asocResult�r 0 basepath basePathx 9�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_&�^�]�\�[�ZO�Y�X�Wf�V�U�T�S�Rz��Q�������P�������O�N�M�L��q 0 	valuetype 	valueType
�p 
type
�o 
ctxt
�n 
long
�m 
doub
�l 
nmbr
�k misccura�j &0 nsnumberformatter NSNumberFormatter�i 	0 alloc  �h 0 init  �g D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle�f "0 setnumberstyle_ setNumberStyle_�e 0 nslocale NSLocale�d 0 systemlocale systemLocale�c 0 
setlocale_ 
setLocale_�b &0 numberfromstring_ numberFromString_
�a 
msng
�` 
errn
�_ 
****
�^ 
furl
�] 
alis
�\ 
file
�[ 
psxf�Z �Y 0 nsfilemanager NSFileManager�X  0 defaultmanager defaultManager�W ,0 currentdirectorypath currentDirectoryPath�V 0 nsstring NSString�U *0 pathwithcomponents_ pathWithComponents_�T &0 stringwithstring_ stringWithString_�S 60 stringbystandardizingpath stringByStandardizingPath�R  z �K�J�I
�K 
errn�J���I  
�Q 
bool�P �O�Y
�N 
erob
�M 
errt�L �|ȡ�,�&E�O��  �E�Y����mv�kv ���,j+ j+ 	E�O���,k+ O���,j+ k+ O��k+ E�O�a   )a b  
la �%Y hO�a &E�O��  '�k#j )a b  
la �%Y hO��&E�Y hY%a a a a a v�kv ��a  A�a ,j+ j+ E�O�a   )a b  
la �%Y hO�a ,��lvk+  E�Y hO�a ,�k+ !j+ "�&a &E�O �a   �a &E�Y hW X # $)a b  
la %�%Y |�a &  [ga ' Qa (a )a *a +a ,a -v�kv eY 1a .a /a 0a 1a 2a -v�kv fY )a b  
la 3�%VY )a a 4a 5��,a 6�a 7a 8O�� �H�G�F{|�E�H 40 _defaultvalueplaceholder _defaultValuePlaceholder�G �D}�D }  �C�C $0 definitionrecord definitionRecord�F  { �B�A�B $0 definitionrecord definitionRecord�A 0 	valuetype 	valueType| �@�?�>!�=�<�;7:�:�9�8�7�6M�5U�4�3�2�1�0Y�@ 0 	valuetype 	valueType
�? 
type
�> 
ctxt
�= 
long
�< 
doub
�; 
nmbr
�: 
furl
�9 
alis
�8 
file
�7 
psxf�6 
�5 
bool
�4 
errn�3�Y
�2 
erob
�1 
errt�0 �E h��,�&E�O��  �Y V���mv�kv ��  �Y �Y :�����v�kv �Y (��  	a Y )a a a ��,a �a a � �/l�.�-~�,�/ *0 _formatdefaultvalue _formatDefaultValue�. �+��+ �  �*�* $0 definitionrecord definitionRecord�-  ~ �)�(�'�&�) $0 definitionrecord definitionRecord�( 0 defaultvalue defaultValue�' 0 defaulttext defaultText�& 0 asocformatter asocFormatter �%�$�#�"�!� ������������������
�% 0 defaultvalue defaultValue
�$ 
kocl
�# 
list
�" .corecnte****       ****
�! 
leng
�  
bool
� 
cobj
� 
ctxt
� 
long
� 
doub
� misccura� &0 nsnumberformatter NSNumberFormatter� 	0 alloc  � 0 init  � >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� "0 setnumberstyle_ setNumberStyle_� 0 nslocale NSLocale� 0 systemlocale systemLocale� 0 
setlocale_ 
setLocale_� &0 stringfromnumber_ stringFromNumber_
� 
****
� 
furl
� 
alis
� 
psxp�, ��,E�O�kv��l j	 	��,k �& ��k/E�Y hO�kv��l j �E�Y ��kv��l j
 �kv��l j�& 7��,j+ j+ E�O���,k+ O��a ,j+ k+ O��k+ a &E�Y N�kv�a l j
 �kv�a l j�& �a ,E�Y "�e  
a E�Y �f  
a E�Y a Oa �%a %� �+�����
� (0 _buildoptionstable _buildOptionsTable� �	��	 �  �� &0 optiondefinitions optionDefinitions�  � �������� ������� &0 optiondefinitions optionDefinitions� 0 
foundnames 
foundNames� 20 optiondefinitionsbyname optionDefinitionsByName� 0 	optionref 	optionRef� $0 optiondefinition optionDefinition� 0 propertyname propertyName� 0 	namecount 	nameCount�  0 aref aRef�� 0 thename theName�� 0 
nameprefix 
namePrefix�� 0 charref charRef� .������������������V��Z��^����������{����������������	;	D��������	��	
			!��	O
�� misccura�� *0 nsmutabledictionary NSMutableDictionary�� 0 
dictionary  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
reco�� 0 	shortname 	shortName�� 0 longname longName�� 0 propertyname propertyName�� 0 	valuetype 	valueType
�� 
ctxt�� 0 islist isList�� 0 defaultvalue defaultValue�� 
�� 
errn���\��  � ������
�� 
errn���\��  ���Y
�� 
erob�� 
�� 
leng
�� 
bool
�� 
cha �� &0 setobject_forkey_ setObject_forKey_�
�jvE�O��,j+ E�O�[��l kh ��,�&��������a fa fa %E�O %��,�&E�O��,a   )a a lhY hW X  )a a a �a a O�a ,E�OJ��,a lv��,a lvlv[��l kh �E[�k/E�Z[�l/E�ZO 
��&E�W X  )a a a �a a O�a   ꡨkv )a a a �a a !Y hO��6FOga " ��a ,k  2�a ,k
 a #�a $& )a a a �a a %Y hY w�a ,j 
 a &�a 'k/a $&
 �a (a $& )a a a �a a )Y hO 5�[��l kh 
a *��, )a a a �a a +Y h[OY��VO����%l+ ,Y h[OY��O�a ,�  )a a a �a a -Y h[OY�+O�� ��	]���������� 0 _parseoptions _parseOptions�� ����� �  �������� 0 rawarguments rawArguments�� &0 optiondefinitions optionDefinitions�� &0 hasdefaultoptions hasDefaultOptions��  � ���������������������������� 0 rawarguments rawArguments�� &0 optiondefinitions optionDefinitions�� &0 hasdefaultoptions hasDefaultOptions�� 20 optiondefinitionsbyname optionDefinitionsByName�� (0 asocparametersdict asocParametersDict�� 0 thearg theArg�� 0 
optionname 
optionName�� $0 optiondefinition optionDefinition�� 0 ishelp isHelp�� 0 	isversion 	isVersion�� 0 propertyname propertyName�� 0 thevalue theValue�� 0 thelist theList� 4��������	�������	�	����������	�	�
�������
F
�
�
�
��
��
��
��������
������S��� (0 _buildoptionstable _buildOptionsTable
�� misccura�� *0 nsmutabledictionary NSMutableDictionary�� 0 
dictionary  
�� 
ascr
�� 
txdl
�� 
cobj
�� 
rest
�� 
citm
�� 
kocl
�� .corecnte****       ****
� 
ctxt
� 
cha 
� 
bool
� 
leng� 0 objectforkey_ objectForKey_
� 
msng
� 
****� 0 	valuetype 	valueType� $0 removeallobjects removeAllObjects� $0 setvalue_forkey_ setValue_forKey_
� 
errn� 0 propertyname propertyName� 0 defaultvalue defaultValue�  �  ��\
� 
erob� � 0 _unpackvalue _unpackValue� 0 islist isList�  0 nsmutablearray NSMutableArray� $0 arraywithobject_ arrayWithObject_� 0 
addobject_ 
addObject_� &0 setobject_forkey_ setObject_forKey_��o*�k+  E�O��,j+ E�O���,FONh�jv ��k/E�O�� C��  ��,E�OY hO��k/E�O���l k �[�\[�l/\Zi2��k/FY ��,E�Y ��� ��a  
 a �a l/a & Y hO�[�\[Zk\Zl2E�O�a ,l L�[�\[Zm\Zi2��k/FO��k+ E�O�a 	 �a &a ,a  a & a ��k/%��k/FY hY ��,E�Y O��k+ E�O�a   x� _a a lv�kva a lv�kvlvE[�k/E�Z[�l/E�ZO�
 �a & %�j+ O��a l+  O��a !l+  OjvE�OY hY hO)a "b  
la #�%Y hO�a &E�O�a $,E�O�a ,a   1 �a %,E�W  X & ')a "a (a )�a %,a *a +�%Y 0�jv  )a "b  
la ,�%Y hO*��k/�l+ -E�O��,E�O�a .,E /��k+ E�O�a   �a /,�k+ 0E�Y ��k+ 1O�E�Y #��k+ a  )a "b  
la 2�%Y hO���l+ 3[OY��O��lv� �l������ (0 _adddefaultoptions _addDefaultOptions� ��� �  ��� (0 asocparametersdict asocParametersDict� &0 optiondefinitions optionDefinitions�  � ��������� (0 asocparametersdict asocParametersDict� &0 optiondefinitions optionDefinitions� 0 recref recRef� 0 rec  � 0 propertyname propertyName� 0 thevalue theValue� 0 
optionname 
optionName� 0 aref aRef� ������������������������������	
� 
kocl
� 
cobj
� .corecnte****       ****
� 
reco� 0 propertyname propertyName� 0 longname longName� 0 defaultvalue defaultValue� � 0 objectforkey_ objectForKey_
�� 
msng�� 0 	shortname 	shortName
�� 
errn
�� misccura�� 0 nsnull NSNull�� 0 null  �� &0 setobject_forkey_ setObject_forKey_� � ��[��l kh ��&�����b  �%E�O��,E�O��  
��,E�Y hO��k+ �  e��,E�O�b    1���,%E�O��  �a ,%E�Y hO)a b  
la �%Y hO��  a a ,j+ E�Y hO���l+ Y h[OY�bO 1a a lv[��l kh ��k+ �  �f�l+ Y h[OY��  ������������ "0 _parsearguments _parseArguments�� ����� �  �������� 0 argumentslist argumentsList�� *0 argumentdefinitions argumentDefinitions�� (0 asocparametersdict asocParametersDict��  � ����~�}�|�{�z�y�x�w�v�� 0 argumentslist argumentsList� *0 argumentdefinitions argumentDefinitions�~ (0 asocparametersdict asocParametersDict�} 0 i  �| 0 argcount argCount�{  0 mustbeoptional mustBeOptional�z 0 argref argRef�y (0 argumentdefinition argumentDefinition�x 0 thevalue theValue�w "0 placeholdertext placeholderText�v 0 aref aRef� !�u�t�s�r�q�p�oM�n�m�l�k�j�i�h�g�f�ejw{�d�c����b�a��`
�u 
leng
�t 
kocl
�s 
cobj
�r .corecnte****       ****
�q 
pcnt
�p 
reco�o 0 propertyname propertyName�n 0 	valuetype 	valueType
�m 
ctxt�l 0 islist isList�k 0 defaultvalue defaultValue�j 
�i 
bool
�h 
errn�g�Y
�f 
erob�e �d $0 valueplaceholder valuePlaceholder�c 40 _defaultvalueplaceholder _defaultValuePlaceholder�b 0 _unpackvalue _unpackValue
�a 
rest�` &0 setobject_forkey_ setObject_forKey_���jE�O��,E�OfE�OK�[��l kh �kE�O��,�&�����f�b  �%E�O��,b   eE�Y &�	 ��,b   �& )��a �a a Y hO��,a   )��a �a a Y hO�jv  P��,E�O�b    <�a ,E�O��,j  *��,k+ E�Y hO)�b  
la �%a %�%a %Y hY *��k/�l+ E�O�a ,E�O��,E L���, )��a �a a Y hO�kvE�O  �[��l kh 
*��,�l+ �6F[OY��OjvE�Y hO����,l+ [OY��O�jv )�b  
la ��,%a %�%a  %Y h �_0�^�]���\�_  0 _formatoptions _formatOptions�^ �[��[ �  �Z�Y�X�Z &0 optiondefinitions optionDefinitions�Y 0 vtstyle vtStyle�X &0 hasdefaultoptions hasDefaultOptions�]  � �W�V�U�T�S�R�Q�P�O�N�M�L�K�J�I�H�G�F�W &0 optiondefinitions optionDefinitions�V 0 vtstyle vtStyle�U &0 hasdefaultoptions hasDefaultOptions�T  0 defaultoptions defaultOptions�S  0 booleanoptions booleanOptions�R 0 otheroptions otherOptions�Q  0 optionssection optionsSection�P 0 	optionref 	optionRef�O $0 optiondefinition optionDefinition�N 0 	shortname 	shortName�M 0 longname longName�L 0 	valuetype 	valueType�K 0 islist isList�J $0 valueplaceholder valuePlaceholder�I $0 valuedescription valueDescription�H 0 
optionname 
optionName�G 0 
isoptional 
isOptional�F "0 optionssynopsis optionsSynopsis� DDHK�E�D]�C�B�A�@�?r�>v�=�<�;�:�9��8��7�6�5�4����3�2���1�0�/���.=GS�-�,u�+���*���������$&.
�E 
cobj�D 0 b  �C 0 n  
�B 
kocl
�A .corecnte****       ****
�@ 
reco�? 0 	shortname 	shortName�> 0 longname longName�= 0 	valuetype 	valueType
�< 
ctxt�; 0 islist isList�: 0 defaultvalue defaultValue�9 $0 valueplaceholder valuePlaceholder�8 $0 valuedescription valueDescription�7 
�6 
type
�5 
bool�4  � �)�(�'
�) 
errn�(�\�'  �3 �2 60 throwinvalidparametertype throwInvalidParameterType
�1 
errn�0�Y
�/ 
erob
�. 
spac�- 40 _defaultvalueplaceholder _defaultValuePlaceholder�, 0 u  �+ *0 _formatdefaultvalue _formatDefaultValue
�* 
lnfd�\����mvE[�k/E�Z[�l/E�Z[�m/E�ZO��,�%��,%E�Oݠ[��l kh ��&������a fa b  a a a a a %E�O >��,�&E�O��,�&E�O��,a &E�O�a ,a &E�O�a ,�&E�O�a ,�&E�W X  b  �a �a a + O�b  %b  %E�O�a   1�a    )a !a "a #�a a $Y hO�E�O�a %%�%E�Y %�E�O�a &%�%E�O�a ' �a (%�%E�Y hO�a   
��%E�Y ��a ,b  E^ O�_ )%E�O]  �a *%E�Y hO�a +%�%E�O�E�O�a ,  *�k+ -E�Y hO�a .,�%��,%E�O�_ )%�%E�O]  �a /%E�Y hO�_ )%�%E�O�a ,b   �*�k+ 0%E�Y hO� �a 1%E�Y hO�a 2 �_ 3%b  %�%_ )%E�Y h[OY�1O� r�a 4 .a 5�%E�O�b  %b  %a 6%_ 3%b  %a 7%E�Y hO�a 8 .�a 9%E�O�b  %b  %a :%_ 3%b  %a ;%E�Y hY hOa <E^ O�a = ] a >%�%a ?%E^ Y hO�a @ ] a A%�%a B%E^ Y hO�a C ] �%E^ Y hO] �lv �&A�%�$���#�& $0 _formatarguments _formatArguments�% �"��" �  �!� �! *0 argumentdefinitions argumentDefinitions�  0 vtstyle vtStyle�$  � 
����������� *0 argumentdefinitions argumentDefinitions� 0 vtstyle vtStyle� &0 argumentssynopsis argumentsSynopsis� $0 argumentssection argumentsSection� 0 argumentref argumentRef� (0 argumentdefinition argumentDefinition� 0 	valuetype 	valueType� 0 islist isList� $0 valueplaceholder valuePlaceholder� $0 valuedescription valueDescription� &QTZ�f������������
��	��������������� ��"� 0 b  � 0 n  
� 
kocl
� 
cobj
� .corecnte****       ****
� 
reco� 0 	valuetype 	valueType
� 
ctxt� 0 islist isList� 0 defaultvalue defaultValue� $0 valueplaceholder valuePlaceholder�
 $0 valuedescription valueDescription�	 

� 
type
� 
bool�  � ������
�� 
errn���\��  � � 60 throwinvalidparametertype throwInvalidParameterType� 40 _defaultvalueplaceholder _defaultValuePlaceholder� 0 u  � *0 _formatdefaultvalue _formatDefaultValue
�  
lnfd
�� 
spac�#?�jv  
��lvY hO�E�O��,�%��,%E�O�[��l kh ��&���f�b  ��a a a %E�O *��,a &E�O��,a &E�O��,�&E�O�a ,�&E�W X  b  �a �a a + O�a   *�k+ E�Y hO� �a %E�Y hO�b  %b  %�a ,%�%��,%E�O��,b   �*�k+ %E�Y hO�a   �_ !%b  %�%E�Y hO��,b   a "�%a #%E�Y hO�_ $%�%E�[OY��Oa %�%�lv ��1��������
�� .Fil:Argvnull���     ****�� 0 argv  �� ����
�� 
OpsD� {�������� &0 optiondefinitions optionDefinitions��  ��  � ����
�� 
OpsA� {������� *0 argumentdefinitions argumentDefinitions��  � ����� �  �� ��D��� 0 propertyname propertyName� �������� 0 islist isList
�� boovtrue��  � �����
�� 
DefO� {�������� &0 hasdefaultoptions hasDefaultOptions��  
�� boovtrue��  � ������������������������ 0 argv  �� &0 optiondefinitions optionDefinitions�� *0 argumentdefinitions argumentDefinitions�� &0 hasdefaultoptions hasDefaultOptions�� 0 oldtids oldTIDs�� (0 asocparametersdict asocParametersDict�� 0 argumentslist argumentsList�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ST��������������������������������
�� 
ascr
�� 
txdl�� "0 aslistparameter asListParameter
�� 
cobj�� 0 _parseoptions _parseOptions�� (0 _adddefaultoptions _addDefaultOptions�� "0 _parsearguments _parseArguments
�� 
****�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob
�� 
errt�� �� �� 
0 _error  �� ��� ���,E�O ab  �k+ E�Ob  �k+ E�Ob  �k+ E�O*��-��m+ E[�k/E�Z[�l/E�ZO*��l+ O*���m+ O���,FO��&W 2X 
 ���,FO�b  
  )�����Y *a ����a + V �����������
�� .Fil:FHlpnull��� ��� null��  �� ����
�� 
Name� {������ 0 commandname commandName�  � ���
� 
Summ� {���� $0 shortdescription shortDescription�  � ���
� 
Usag� {���� "0 commandsynopses commandSynopses�  �  � ���
� 
OpsD� {���� &0 optiondefinitions optionDefinitions�  �  � ���
� 
OpsA� {���� *0 argumentdefinitions argumentDefinitions�  � ��� �  �� ��� 0 propertyname propertyName� ���� 0 islist isList
� boovtrue�  � ���
� 
Docu� {��� "0 longdescription longDescription�  � ���
� 
VFmt� {���� 0 isstyled isStyled�  
� boovtrue� ���
� 
DefO� {���� &0 hasdefaultoptions hasDefaultOptions�  
� boovtrue�  � �������������������� 0 commandname commandName� $0 shortdescription shortDescription� "0 commandsynopses commandSynopses� &0 optiondefinitions optionDefinitions� *0 argumentdefinitions argumentDefinitions� "0 longdescription longDescription� 0 isstyled isStyled� &0 hasdefaultoptions hasDefaultOptions� 0 vtstyle vtStyle� 0 helptext helpText� 00 defaultoptionssynopsis defaultOptionsSynopsis�  0 optionssection optionsSection� 40 defaultargumentssynopsis defaultArgumentsSynopsis� $0 argumentssection argumentsSection� 0 textref textRef� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� /'(7��[gt���������������������~�}�|�{�z�6�y;�xTf�w�v�x�u�t� "0 astextparameter asTextParameter� "0 aslistparameter asListParameter� (0 asbooleanparameter asBooleanParameter� 0 n  � 0 vt100 VT100� 0 b  � 0 u  � � 
� .Fil:EnVanull��� ��� null� 0 _  
� .Fil:SplPnull���     ctxt�  �  �~  0 _formatoptions _formatOptions
�} 
cobj�| $0 _formatarguments _formatArguments
�{ 
kocl
�z .corecnte****       ****� �s�r�q
�s 
errn�r�\�q  
�y 
list�x 60 throwinvalidparametertype throwInvalidParameterType
�w 
lnfd�v 0 etext eText� �p�o�
�p 
errn�o 0 enumber eNumber� �n�m�
�n 
erob�m 0 efrom eFrom� �l�k�j
�l 
errt�k 
0 eto eTo�j  �u �t 
0 _error  �������b  ��l+ E�Ob  �k+ E�Ob  �k+ E�Ob  �k+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+  �*jk+ 
�*kk+ 
�*�k+ 
�E�Y ���a �a �E�O�a   $ *j a ,j E�W X  a E�Y hO��,a %��,%b  %b  %�%E�O�a  �a %�%E�Y hO*���m+ E[a k/E�Z[a l/E�ZO*��l+ E[a k/E�Z[a l/E�ZO�b  %��,%a %��,%E�O�jv  ��%�%kvE�Y hO / )�[a  a l !kh �b  %b  %�%E�[OY��W X  "b  �a #a $a %�+ &O�b  %�%b  %�%E�O�a ' "�b  %��,%a (%��,%b  %�%E�Y hO�_ )%W X * +*a ,�] ] ] a -+ .V �i��h�g���f
�i .Fil:CurFnull��� ��� null�h  �g  � �e�d�c�b�a�e 0 asocpath asocPath�d 0 etext eText�c 0 enumber eNumber�b 0 efrom eFrom�a 
0 eto eTo� �`�_�^�]�\�[�Z��Y�X�W���V�U
�` misccura�_ 0 nsfilemanager NSFileManager�^  0 defaultmanager defaultManager�] ,0 currentdirectorypath currentDirectoryPath
�\ 
msng
�[ 
errn�Z�@
�Y 
ctxt
�X 
psxf�W 0 etext eText� �T�S�
�T 
errn�S 0 enumber eNumber� �R�Q�
�R 
erob�Q 0 efrom eFrom� �P�O�N
�P 
errt�O 
0 eto eTo�N  �V �U 
0 _error  �f ; *��,j+ j+ E�O��  )��l�Y hO��&�&W X 
 *졢���+  �M��L�K���J
�M .Fil:EnVanull��� ��� null�L  �K  �  � �I�H�G�F�E
�I misccura�H 0 nsprocessinfo NSProcessInfo�G 0 processinfo processInfo�F 0 environment  
�E 
****�J ��,j+ j+ �& �D��C�B���A
�D .Fil:RSInnull��� ��� null�C  �B �@��
�@ 
Prmt� {�?�>��? 0 
prompttext 
promptText�>  � �=��<
�= 
ReTo� {�;�:�9�; 0 isinteractive isInteractive�:  
�9 boovfals�<  � 	�8�7�6�5�4�3�2�1�0�8 0 
prompttext 
promptText�7 0 isinteractive isInteractive�6 0 	asocstdin 	asocStdin�5 0 asocdata asocData�4 0 
asocstring 
asocString�3 0 etext eText�2 0 enumber eNumber�1 0 efrom eFrom�0 
0 eto eTo� �/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� �*������O��
�/ misccura�. 0 nsfilehandle NSFileHandle�- :0 filehandlewithstandardinput fileHandleWithStandardInput
�, 
SLiB
�+ 
ALiE�* 
�) .Fil:WSOunull���     ctxt�( 0 availabledata availableData�' 
0 length  
�& 
msng�% *0 readdatatoendoffile readDataToEndOfFile�$ 0 nsstring NSString�# 	0 alloc  �" ,0 nsutf8stringencoding NSUTF8StringEncoding�! 00 initwithdata_encoding_ initWithData_encoding_
�  
errn��\
� 
lnfd� 0 
hassuffix_ 
hasSuffix_� &0 substringtoindex_ substringToIndex_
� 
ctxt� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �A � ���,j+ E�O� '��f�f� O�j+ E�O�j+ j  �Y hY 	�j+ 
E�O��,j+ ���,l+ E�O��  )�a la Y hO�_ k+  ��j+ kk+ E�Y hO�a &W X  *a ����a +  �_�����
� .Fil:WSOunull���     ctxt� 0 thetext theText� ���
� 
SLiB� {��
�	� 0 uselinefeeds useLinefeeds�
  
�	 boovtrue� ���
� 
ALiE� {����  0 withlineending withLineEnding�  
� boovtrue�  � 	���� ����������� 0 thetext theText� 0 uselinefeeds useLinefeeds�  0 withlineending withLineEnding�  0 
asocstring 
asocString�� 0 
asocstdout 
asocStdout�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� }�������������������������������������������� "0 astextparameter asTextParameter�� &0 asnsmutablestring asNSMutableString
�� 
ret 
�� 
lnfd�� 0 location  �� 
0 length  �� �� l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_�� 0 
hassuffix_ 
hasSuffix_
�� 
bool�� 0 appendstring_ appendString_
�� misccura�� 0 nsfilehandle NSFileHandle�� <0 filehandlewithstandardoutput fileHandleWithStandardOutput�� ,0 nsutf8stringencoding NSUTF8StringEncoding�� (0 datausingencoding_ dataUsingEncoding_�� 0 
writedata_ 
writeData_�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � � �b  b  ��l+ k+ E�O� ,���%�j�j�j+ ��+ O���j�j�j+ ��+ Y hO�	 ��k+ 	�& ��k+ Y hO��,j+ E�O����,k+ k+ OhW X  *a ����a +  ascr  ��ޭ