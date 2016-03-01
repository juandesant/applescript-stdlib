FasdUAS 1.101.10   ��   ��    k             l      ��  ��    . ( Objects -- additional data structures

     � 	 	 P   O b j e c t s   - -   a d d i t i o n a l   d a t a   s t r u c t u r e s 
 
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �      s u p p o r t      l     ��������  ��  ��        l          j     �� �� 0 _support    N          4     �� !
�� 
scpt ! m     " " � # #  T y p e S u p p o r t  "  used for parameter checking     � $ $ 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g   % & % l     ��������  ��  ��   &  ' ( ' i   
 ) * ) I      �� +���� 
0 _error   +  , - , o      ���� 0 handlername handlerName -  . / . o      ���� 0 etext eText /  0 1 0 o      ���� 0 enumber eNumber 1  2 3 2 o      ���� 0 efrom eFrom 3  4�� 4 o      ���� 
0 eto eTo��  ��   * n     5 6 5 I    �� 7���� &0 throwcommanderror throwCommandError 7  8 9 8 m     : : � ; ;  O b j e c t s 9  < = < o    ���� 0 handlername handlerName =  > ? > o    ���� 0 etext eText ?  @ A @ o    	���� 0 enumber eNumber A  B C B o   	 
���� 0 efrom eFrom C  D�� D o   
 ���� 
0 eto eTo��  ��   6 o     ���� 0 _support   (  E F E l     ��������  ��  ��   F  G H G l     ��������  ��  ��   H  I J I l     �� K L��   K J D--------------------------------------------------------------------    L � M M � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - J  N O N l     �� P Q��   P   collections    Q � R R    c o l l e c t i o n s O  S T S l     ��������  ��  ��   T  U V U i    W X W I      �� Y����  0 _makeemptylist _makeEmptyList Y  Z�� Z o      ���� 0 n  ��  ��   X l    ! [ \ ] [ k     ! ^ ^  _ ` _ r      a b a J      c c  d�� d m     ��
�� 
msng��   b o      ���� 0 l   `  e f e V     g h g k     i i  j k j r     l m l b     n o n o    ���� 0 l   o o    ���� 0 l   m o      ���� 0 l   k  p�� p r     q r q _     s t s o    ���� 0 n   t m    ����  r o      ���� 0 n  ��   h ?   
  u v u o   
 ���� 0 n   v m    ����  f  w�� w L    ! x x o     ���� 0 l  ��   \ � � make a list of size n where n is a power of two, e.g. _makeBucketList(1024) returns a 1024 (2^10) item list (other values of n are rounded down automatically, e.g. n=1000 gives a 512-item list)    ] � y y�   m a k e   a   l i s t   o f   s i z e   n   w h e r e   n   i s   a   p o w e r   o f   t w o ,   e . g .   _ m a k e B u c k e t L i s t ( 1 0 2 4 )   r e t u r n s   a   1 0 2 4   ( 2 ^ 1 0 )   i t e m   l i s t   ( o t h e r   v a l u e s   o f   n   a r e   r o u n d e d   d o w n   a u t o m a t i c a l l y ,   e . g .   n = 1 0 0 0   g i v e s   a   5 1 2 - i t e m   l i s t ) V  z { z l     ��������  ��  ��   {  | } | l     ��������  ��  ��   }  ~  ~ l     �� � ���   �  -----    � � � � 
 - - - - -   � � � l     ��������  ��  ��   �  � � � i    � � � I     ������
�� .Typ:DicOnull��� ��� null��  ��   � l     � � � � k      � �  � � � l      �� � ���   �}w
		Create a basic hashmap, analogous to Cocoa's NSDictionary class. Uses NSString to generate key hashes from text-based keys (non-text keys will be coerced to text). Items are stored in a fixed-sized bucket list where each bucket contains either `missing value` or a linked list composed of AS records.

		Note: While Cocoa's NSMutableDictionary class may be used via AppleScript-ObjC, it is really only suitable for storing simple AppleScript values such as text and numbers; other values such as `missing value`, records, references, and script objects cannot reliably cross the ASOC bridge without being corrupted (e.g. references lose their target application information) or crashing (e.g. ASOC can't handle large numbers of script objects). For general-purpose use, it is safest to use a mostly-native AppleScript implementation, using Cocoa APIs only to speed up key hashing.		
	    � � � �� 
 	 	 C r e a t e   a   b a s i c   h a s h m a p ,   a n a l o g o u s   t o   C o c o a ' s   N S D i c t i o n a r y   c l a s s .   U s e s   N S S t r i n g   t o   g e n e r a t e   k e y   h a s h e s   f r o m   t e x t - b a s e d   k e y s   ( n o n - t e x t   k e y s   w i l l   b e   c o e r c e d   t o   t e x t ) .   I t e m s   a r e   s t o r e d   i n   a   f i x e d - s i z e d   b u c k e t   l i s t   w h e r e   e a c h   b u c k e t   c o n t a i n s   e i t h e r   ` m i s s i n g   v a l u e `   o r   a   l i n k e d   l i s t   c o m p o s e d   o f   A S   r e c o r d s . 
 
 	 	 N o t e :   W h i l e   C o c o a ' s   N S M u t a b l e D i c t i o n a r y   c l a s s   m a y   b e   u s e d   v i a   A p p l e S c r i p t - O b j C ,   i t   i s   r e a l l y   o n l y   s u i t a b l e   f o r   s t o r i n g   s i m p l e   A p p l e S c r i p t   v a l u e s   s u c h   a s   t e x t   a n d   n u m b e r s ;   o t h e r   v a l u e s   s u c h   a s   ` m i s s i n g   v a l u e ` ,   r e c o r d s ,   r e f e r e n c e s ,   a n d   s c r i p t   o b j e c t s   c a n n o t   r e l i a b l y   c r o s s   t h e   A S O C   b r i d g e   w i t h o u t   b e i n g   c o r r u p t e d   ( e . g .   r e f e r e n c e s   l o s e   t h e i r   t a r g e t   a p p l i c a t i o n   i n f o r m a t i o n )   o r   c r a s h i n g   ( e . g .   A S O C   c a n ' t   h a n d l e   l a r g e   n u m b e r s   o f   s c r i p t   o b j e c t s ) .   F o r   g e n e r a l - p u r p o s e   u s e ,   i t   i s   s a f e s t   t o   u s e   a   m o s t l y - n a t i v e   A p p l e S c r i p t   i m p l e m e n t a t i o n ,   u s i n g   C o c o a   A P I s   o n l y   t o   s p e e d   u p   k e y   h a s h i n g . 	 	 
 	 �  ��� � h     �� ��� ,0 dictionarycollection DictionaryCollection � k       � �  � � � x     �� �����   � 4    �� �
�� 
frmk � m     � � � � �  F o u n d a t i o n��   �  � � � l     ��������  ��  ��   �  � � � l      � � � � j    �� ��� 0 _buckets   � I    �� �����  0 _makeemptylist _makeEmptyList �  ��� � m    ���� ��  ��   � v p DictionaryCollections currently use a fixed-size bucket list (2^10=1024 items seems to be a reasonable default)    � � � � �   D i c t i o n a r y C o l l e c t i o n s   c u r r e n t l y   u s e   a   f i x e d - s i z e   b u c k e t   l i s t   ( 2 ^ 1 0 = 1 0 2 4   i t e m s   s e e m s   t o   b e   a   r e a s o n a b l e   d e f a u l t ) �  � � � j    �� ��� 	0 _size   � n     � � � 1    ��
�� 
leng � n    � � � o    ���� 0 _buckets   �  f     �  � � � j    �� ��� 
0 _count   � m    ����   �  � � � l     ��������  ��  ��   �  � � � i   ! � � � I      �� ����� 
0 _error   �  � � � o      ���� 0 handlername handlerName �  � � � o      ���� 0 etext eText �  � � � o      ���� 0 enumber eNumber �  � � � o      ���� 0 efrom eFrom �  ��� � o      ���� 
0 eto eTo��  ��   � n     � � � I    �� ����� $0 throwmethoderror throwMethodError �  � � � m     � � � � �  O b j e c t s �  � � � m     � � � � � ( D i c t i o n a r y C o l l e c t i o n �  � � � o    ���� 0 handlername handlerName �  � � � o    	���� 0 etext eText �  � � � o   	 
���� 0 enumber eNumber �  � � � o   
 ���� 0 efrom eFrom �  ��� � o    ���� 
0 eto eTo��  ��   � o     ���� 0 _support   �  � � � l     ��������  ��  ��   �  � � � i  " % � � � I      �� ����� 0 	_keyindex 	_keyIndex �  ��� � o      ���� 0 thekey theKey��  ��   � Q     � � � � k    � � �  � � � l   K � � � � Z   K � ����� � G    > � � � G    . � � � G     � � � >     � � � l    ����� � I   �� � �
�� .corecnte****       **** � J     � �  �� � o    �~�~ 0 thekey theKey�   � �} ��|
�} 
kocl � m    �{
�{ 
obj �|  ��  ��   � m    �z�z   � >     � � � l    ��y�x � I   �w � �
�w .corecnte****       **** � J     � �  ��v � o    �u�u 0 thekey theKey�v   � �t ��s
�t 
kocl � m    �r
�r 
list�s  �y  �x   � m    �q�q   � >   ! , � � � l  ! * ��p�o � I  ! *�n 
�n .corecnte****       ****  J   ! $ �m o   ! "�l�l 0 thekey theKey�m   �k�j
�k 
kocl m   % &�i
�i 
reco�j  �p  �o   � m   * +�h�h   � >   1 < l  1 :�g�f I  1 :�e	
�e .corecnte****       **** J   1 4

 �d o   1 2�c�c 0 thekey theKey�d  	 �b�a
�b 
kocl m   5 6�`
�` 
scpt�a  �g  �f   m   : ;�_�_   � R   A G�^�]
�^ .ascrerr ****      � ****�]   �\�[
�\ 
errn m   C D�Z�Z�\�[  ��  ��   � "  explicitly disallowed types    � � 8   e x p l i c i t l y   d i s a l l o w e d   t y p e s �  Z   L ��Y E  L W J   L Q  m   L M�X
�X 
type  m   M N�W
�W 
pcls �V m   N O�U
�U 
enum�V   J   Q V �T n  Q T  m   R T�S
�S 
pcls  o   Q R�R�R 0 thekey theKey�T   l  Z j!"#! r   Z j$%$ n  Z h&'& I   d h�Q�P�O�Q 0 typecodevalue typeCodeValue�P  �O  ' n  Z d()( I   _ d�N*�M�N 0 
asnsobject 
asNSObject* +�L+ o   _ `�K�K 0 thekey theKey�L  �M  ) o   Z _�J�J 0 _support  % o      �I�I 0 hashnum hashNum" caution: coercing a type class or constant symbol to text is problematic, as the resulting string may contain either its literal name or its raw four-char code depending on the terminology available at the time (furthermore, terminology conflicts and synonyms may cause its literal name to change); to avoid these problems, it's better to send the value over the ASOC to convert it to an NSAppleEventDescriptor, from which its raw four-char code can be obtained as an Int32 which can be safely used as its hashNum   # �,,   c a u t i o n :   c o e r c i n g   a   t y p e   c l a s s   o r   c o n s t a n t   s y m b o l   t o   t e x t   i s   p r o b l e m a t i c ,   a s   t h e   r e s u l t i n g   s t r i n g   m a y   c o n t a i n   e i t h e r   i t s   l i t e r a l   n a m e   o r   i t s   r a w   f o u r - c h a r   c o d e   d e p e n d i n g   o n   t h e   t e r m i n o l o g y   a v a i l a b l e   a t   t h e   t i m e   ( f u r t h e r m o r e ,   t e r m i n o l o g y   c o n f l i c t s   a n d   s y n o n y m s   m a y   c a u s e   i t s   l i t e r a l   n a m e   t o   c h a n g e ) ;   t o   a v o i d   t h e s e   p r o b l e m s ,   i t ' s   b e t t e r   t o   s e n d   t h e   v a l u e   o v e r   t h e   A S O C   t o   c o n v e r t   i t   t o   a n   N S A p p l e E v e n t D e s c r i p t o r ,   f r o m   w h i c h   i t s   r a w   f o u r - c h a r   c o d e   c a n   b e   o b t a i n e d   a s   a n   I n t 3 2   w h i c h   c a n   b e   s a f e l y   u s e d   a s   i t s   h a s h N u m�Y   l  m �-./- k   m �00 121 Z   m �34�H53 E  m w676 J   m q88 9:9 m   m n�G
�G 
long: ;�F; m   n o�E
�E 
doub�F  7 J   q v<< =�D= n  q t>?> m   r t�C
�C 
pcls? o   q r�B�B 0 thekey theKey�D  4 l  z �@AB@ k   z �CC DED l  z z�AFG�A  F � � TO DO: need a decent number hashing algorithm that neither overflows not habitually returns 0 (ironically enough, NSNumber's hash fails on doubles outside of �2^63)   G �HHJ   T O   D O :   n e e d   a   d e c e n t   n u m b e r   h a s h i n g   a l g o r i t h m   t h a t   n e i t h e r   o v e r f l o w s   n o t   h a b i t u a l l y   r e t u r n s   0   ( i r o n i c a l l y   e n o u g h ,   N S N u m b e r ' s   h a s h   f a i l s   o n   d o u b l e s   o u t s i d e   o f   � 2 ^ 6 3 )E IJI r   z }KLK o   z {�@�@ 0 thekey theKeyL o      �?�? 0 hashnum hashNumJ MNM r   ~ �OPO `   ~ �QRQ o   ~ �>�> 0 thekey theKeyR m    ��=�= P o      �<�< 0 divnum divNumN STS Z  � �UV�;�:U >   � �WXW o   � ��9�9 0 divnum divNumX m   � ��8�8  V r   � �YZY \   � �[\[ o   � ��7�7 0 hashnum hashNum\ ^   � �]^] m   � ��6�6 ^ o   � ��5�5 0 divnum divNumZ o      �4�4 0 hashnum hashNum�;  �:  T _`_ Z  � �ab�3�2a A   � �cdc o   � ��1�1 0 hashnum hashNumd m   � ��0�0  b r   � �efe d   � �gg o   � ��/�/ 0 hashnum hashNumf o      �.�. 0 hashnum hashNum�3  �2  ` h�-h Z  � �ij�,�+i A   � �klk o   � ��*�* 0 hashnum hashNuml m   � �mm it���bZj r   � �non ]   � �pqp o   � ��)�) 0 hashnum hashNumq m   � ��(�(  J�o o      �'�' 0 hashnum hashNum�,  �+  �-  A � � note: integers and reals that are numerically equalmust always produce same hash, since the linked list lookup compares integer and real keys for numeric equality (e.g. 1 = 1.0)    B �rrf   n o t e :   i n t e g e r s   a n d   r e a l s   t h a t   a r e   n u m e r i c a l l y   e q u a l m u s t   a l w a y s   p r o d u c e   s a m e   h a s h ,   s i n c e   t h e   l i n k e d   l i s t   l o o k u p   c o m p a r e s   i n t e g e r   a n d   r e a l   k e y s   f o r   n u m e r i c   e q u a l i t y   ( e . g .   1   =   1 . 0 )  �H  5 r   � �sts n  � �uvu I   � ��&�%�$�& 0 hash  �%  �$  v n  � �wxw I   � ��#y�"�# ,0 asnormalizednsstring asNormalizedNSStringy z�!z c   � �{|{ o   � �� �  0 thekey theKey| m   � ��
� 
ctxt�!  �"  x o   � ��� 0 _support  t o      �� 0 hashnum hashNum2 }~} l  � ����   � � `-[NSString hash]` returns UInt64 which ASOC unpacks as Double, so discard least significant bits when precision is lost due to rounding   � ���   ` - [ N S S t r i n g   h a s h ] `   r e t u r n s   U I n t 6 4   w h i c h   A S O C   u n p a c k s   a s   D o u b l e ,   s o   d i s c a r d   l e a s t   s i g n i f i c a n t   b i t s   w h e n   p r e c i s i o n   i s   l o s t   d u e   t o   r o u n d i n g~ ��� Z  � ������ ?   � ���� o   � ��� 0 hashnum hashNum� m   � ��� C������� r   � ���� _   � ���� o   � ��� 0 hashnum hashNum� m   � ��� � o      �� 0 hashnum hashNum�  �  �  .f` TO DO: what AS types are safe to use as keys? currently, all keys except those already explicitly disallowed or specially processed are coerced to text for hashing, rejecting any values that cause coercion errors if/when they occur, but to guarantee reliability it may be best to whitelist only AS types that are guaranteed to be safe for use as keys    / ����   T O   D O :   w h a t   A S   t y p e s   a r e   s a f e   t o   u s e   a s   k e y s ?   c u r r e n t l y ,   a l l   k e y s   e x c e p t   t h o s e   a l r e a d y   e x p l i c i t l y   d i s a l l o w e d   o r   s p e c i a l l y   p r o c e s s e d   a r e   c o e r c e d   t o   t e x t   f o r   h a s h i n g ,   r e j e c t i n g   a n y   v a l u e s   t h a t   c a u s e   c o e r c i o n   e r r o r s   i f / w h e n   t h e y   o c c u r ,   b u t   t o   g u a r a n t e e   r e l i a b i l i t y   i t   m a y   b e   b e s t   t o   w h i t e l i s t   o n l y   A S   t y p e s   t h a t   a r e   g u a r a n t e e d   t o   b e   s a f e   f o r   u s e   a s   k e y s   ��� L   � ��� [   � ���� `   � ���� o   � ��� 0 hashnum hashNum� o   � ��� 	0 _size  � m   � ��� �   � R      ���
� .ascrerr ****      � ****�  � ���
� 
errn� d      �� m      ����   � R   ����
� .ascrerr ****      � ****� m  �� ��� " I n v a l i d   k e y   t y p e .� �
��
�
 
errn� m   � ��	�	�Y� ���
� 
erob� o   � ��� 0 thekey theKey�   � ��� l     ����  �  �  � ��� l     ��� �  �  �   � ��� l     ��������  ��  ��  � ��� i  & )��� I      �������� 0 
countitems 
countItems��  ��  � L     �� o     ���� 
0 _count  � ��� l     ��������  ��  ��  � ��� i  * -��� I      ������� 0 additem addItem� ��� o      ���� 0 thekey theKey� ���� o      ���� 0 thevalue theValue��  ��  � Q     ����� k    ��� ��� r    ��� I    	������� 0 	_keyindex 	_keyIndex� ���� o    ���� 0 thekey theKey��  ��  � o      ���� 0 keyindex keyIndex� ��� l   ���� s    ��� o    ���� 0 thekey theKey� o      ���� 0 thekey theKey�-' while dates can be used as keys, it's essential that keys stored in linked lists are never mutated so they must be copied first (this is a no-op for text, numbers, and other immutable types, while other types for which copying is problematic, e.g. script objects, are already forbidden as keys)   � ���N   w h i l e   d a t e s   c a n   b e   u s e d   a s   k e y s ,   i t ' s   e s s e n t i a l   t h a t   k e y s   s t o r e d   i n   l i n k e d   l i s t s   a r e   n e v e r   m u t a t e d   s o   t h e y   m u s t   b e   c o p i e d   f i r s t   ( t h i s   i s   a   n o - o p   f o r   t e x t ,   n u m b e r s ,   a n d   o t h e r   i m m u t a b l e   t y p e s ,   w h i l e   o t h e r   t y p e s   f o r   w h i c h   c o p y i n g   i s   p r o b l e m a t i c ,   e . g .   s c r i p t   o b j e c t s ,   a r e   a l r e a d y   f o r b i d d e n   a s   k e y s )� ��� r    ��� n    ��� 4    ���
�� 
cobj� o    ���� 0 keyindex keyIndex� n   ��� o    ���� 0 _buckets  �  f    � o      ���� 0 	founditem 	foundItem� ��� Z    D������� =   ��� o    ���� 0 	founditem 	foundItem� m    ��
�� 
msng� l    @���� k     @�� ��� r     /��� K     (�� ������ 0 k  � o   ! "���� 0 thekey theKey� ������ 0 v  � o   # $���� 0 thevalue theValue� ������� 0 nextitem nextItem� m   % &��
�� 
msng��  � n      ��� 4   + .���
�� 
cobj� o   , -���� 0 keyindex keyIndex� n  ( +��� o   ) +���� 0 _buckets  �  f   ( )� ��� r   0 =��� [   0 7��� o   0 5���� 
0 _count  � m   5 6���� � o      ���� 
0 _count  � ���� L   > @����  ��  �   insert new item   � ���     i n s e r t   n e w   i t e m��  ��  � ���� P   E ����� T   J ��� k   O ��� ��� Z   O {������� =  O T��� n   O R��� o   P R���� 0 k  � o   O P���� 0 	founditem 	foundItem� o   R S���� 0 thekey theKey� l  W w���� k   W w��    r   W \ n   W Z o   X Z���� 0 v   o   W X���� 0 	founditem 	foundItem o      ���� 0 oldvalue oldValue  r   ] t	 J   ] a

  o   ] ^���� 0 thekey theKey �� o   ^ _���� 0 thevalue theValue��  	 J        n       o   g i���� 0 k   o   f g���� 0 	founditem 	foundItem �� n       o   p r���� 0 v   o   o p���� 0 	founditem 	foundItem��   �� L   u w����  ��  �   replace existing item   � � ,   r e p l a c e   e x i s t i n g   i t e m��  ��  �  Z   | ����� =  | � n   |  o   } ���� 0 nextitem nextItem o   | }���� 0 	founditem 	foundItem m    ���
�� 
msng l  � � !"  k   � �## $%$ r   � �&'& K   � �(( ��)*�� 0 k  ) o   � ����� 0 thekey theKey* ��+,�� 0 v  + o   � ����� 0 thevalue theValue, ��-���� 0 nextitem nextItem- m   � ���
�� 
msng��  ' n      ./. o   � ����� 0 nextitem nextItem/ o   � ����� 0 	founditem 	foundItem% 010 r   � �232 [   � �454 o   � ����� 
0 _count  5 m   � ����� 3 o      ���� 
0 _count  1 6��6 L   � �����  ��  !   insert new item   " �77     i n s e r t   n e w   i t e m��  ��   8��8 r   � �9:9 n   � �;<; o   � ����� 0 nextitem nextItem< o   � ����� 0 	founditem 	foundItem: o      ���� 0 	founditem 	foundItem��  � ��=
�� conscase= ��>
�� consdiac> ��?
�� conshyph? ��@
�� conspunc@ ����
�� conswhit��  � ����
�� consnume��  ��  � R      ��AB
�� .ascrerr ****      � ****A o      ���� 0 etext eTextB ��CD
�� 
errnC o      ���� 0 enumber eNumberD ��EF
�� 
erobE o      ���� 0 efrom eFromF ��G��
�� 
errtG o      ���� 
0 eto eTo��  � I   � ���H���� 
0 _error  H IJI m   � �KK �LL  a d d I t e mJ MNM o   � ����� 0 etext eTextN OPO o   � ����� 0 enumber eNumberP QRQ o   � ����� 0 efrom eFromR S��S o   � ����� 
0 eto eTo��  ��  � TUT l     ��������  ��  ��  U VWV i  . 1XYX I      ��Z���� 0 
removeitem 
removeItemZ [��[ o      ���� 0 thekey theKey��  ��  Y Q     �\]^\ k    �__ `a` r    bcb I    	��d���� 0 	_keyindex 	_keyIndexd e��e o    ���� 0 thekey theKey��  ��  c o      ���� 0 keyindex keyIndexa fgf r    hih n    jkj 4    ��l
�� 
cobjl o    ���� 0 keyindex keyIndexk n   mnm o    ���� 0 _buckets  n  f    i o      ���� 0 	founditem 	foundItemg opo P    wqrsq k    vtt uvu r    wxw m    ��
�� 
msngx o      �� 0 previtem prevItemv y�~y V    vz{z k   & q|| }~} r   & +� n   & )��� o   ' )�}�} 0 k  � o   & '�|�| 0 	founditem 	foundItem� o      �{�{ 0 foundkey foundKey~ ��� Z   , g���z�y� =  , /��� o   , -�x�x 0 foundkey foundKey� o   - .�w�w 0 thekey theKey� k   2 c�� ��� r   2 7��� n   2 5��� o   3 5�v�v 0 v  � o   2 3�u�u 0 	founditem 	foundItem� o      �t�t 0 thevalue theValue� ��� Z   8 R���s�� =  8 ;��� o   8 9�r�r 0 previtem prevItem� m   9 :�q
�q 
msng� r   > H��� n   > A��� o   ? A�p�p 0 nextitem nextItem� o   > ?�o�o 0 	founditem 	foundItem� n      ��� 4   D G�n�
�n 
cobj� o   E F�m�m 0 keyindex keyIndex� n  A D��� o   B D�l�l 0 _buckets  �  f   A B�s  � r   K R��� n   K N��� o   L N�k�k 0 nextitem nextItem� o   K L�j�j 0 	founditem 	foundItem� n      ��� o   O Q�i�i 0 nextitem nextItem� o   N O�h�h 0 previtem prevItem� ��� r   S `��� \   S Z��� o   S X�g�g 
0 _count  � m   X Y�f�f � o      �e�e 
0 _count  � ��d� l  a c���� L   a c�� o   a b�c�c 0 thevalue theValue�   return the removed value   � ��� 2   r e t u r n   t h e   r e m o v e d   v a l u e�d  �z  �y  � ��� r   h k��� o   h i�b�b 0 	founditem 	foundItem� o      �a�a 0 previtem prevItem� ��`� r   l q��� n   l o��� o   m o�_�_ 0 nextitem nextItem� o   l m�^�^ 0 	founditem 	foundItem� o      �]�] 0 	founditem 	foundItem�`  { >  " %��� o   " #�\�\ 0 	founditem 	foundItem� m   # $�[
�[ 
msng�~  r �Z�
�Z conscase� �Y�
�Y consdiac� �X�
�X conshyph� �W�
�W conspunc� �V�U
�V conswhit�U  s �T�S
�T consnume�S  p ��R� R   x ��Q��
�Q .ascrerr ****      � ****� m   ~ �� ���  I t e m   n o t   f o u n d .� �P��
�P 
errn� m   z {�O�O�@� �N��M
�N 
erob� o   | }�L�L 0 thekey theKey�M  �R  ] R      �K��
�K .ascrerr ****      � ****� o      �J�J 0 etext eText� �I��
�I 
errn� o      �H�H 0 enumber eNumber� �G��
�G 
erob� o      �F�F 0 efrom eFrom� �E��D
�E 
errt� o      �C�C 
0 eto eTo�D  ^ I   � ��B��A�B 
0 _error  � ��� m   � ��� ���  r e m o v e I t e m� ��� o   � ��@�@ 0 etext eText� ��� o   � ��?�? 0 enumber eNumber� ��� o   � ��>�> 0 efrom eFrom� ��=� o   � ��<�< 
0 eto eTo�=  �A  W ��� l     �;�:�9�;  �:  �9  � ��� i  2 5��� I      �8�7�6�8  0 deleteallitems deleteAllItems�7  �6  � k     !�� ��� r     
��� I     �5��4�5  0 _makeemptylist _makeEmptyList� ��3� m    �2�2 �3  �4  � n     ��� o    	�1�1 0 _buckets  �  f    � ��� r    ��� n    ��� 1    �0
�0 
leng� n   ��� o    �/�/ 0 _buckets  �  f    � o      �.�. 	0 _size  � ��� r    ��� m    �-�-  � o      �,�, 
0 _count  � ��+� L    !�*�*  �+  � ��� l     �)�(�'�)  �(  �'  � ��� i  6 9��� I      �&��%�& 0 getitem getItem� ��$� o      �#�# 0 thekey theKey�$  �%  � Q     Z   k    D  P    ; k    :		 

 r     n     4    �"
�" 
cobj I    �!� �! 0 	_keyindex 	_keyIndex � o    �� 0 thekey theKey�  �    n    o   	 �� 0 _buckets    f    	 o      �� 0 	founditem 	foundItem � V    : k    5  Z   /�� =   # n    !  o    !�� 0 k    o    �� 0 	founditem 	foundItem o   ! "�� 0 thekey theKey L   & +!! n   & *"#" o   ' )�� 0 v  # o   & '�� 0 	founditem 	foundItem�  �   $�$ r   0 5%&% n   0 3'(' o   1 3�� 0 nextitem nextItem( o   0 1�� 0 	founditem 	foundItem& o      �� 0 	founditem 	foundItem�   >   )*) o    �� 0 	founditem 	foundItem* m    �
� 
msng�   �+
� conscase+ �,
� consdiac, �-
� conshyph- �
.
�
 conspunc. �	�
�	 conswhit�   ��
� consnume�   /�/ R   < D�01
� .ascrerr ****      � ****0 m   B C22 �33  I t e m   n o t   f o u n d .1 �45
� 
errn4 m   > ?���@5 �6� 
� 
erob6 o   @ A���� 0 thekey theKey�   �   R      ��78
�� .ascrerr ****      � ****7 o      ���� 0 etext eText8 ��9:
�� 
errn9 o      ���� 0 enumber eNumber: ��;<
�� 
erob; o      ���� 0 efrom eFrom< ��=��
�� 
errt= o      ���� 
0 eto eTo��   I   L Z��>���� 
0 _error  > ?@? m   M PAA �BB  g e t I t e m@ CDC o   P Q���� 0 etext eTextD EFE o   Q R���� 0 enumber eNumberF GHG o   R S���� 0 efrom eFromH I��I o   S T���� 
0 eto eTo��  ��  � JKJ l     ��������  ��  ��  K LML i  : =NON I      ��P���� 0 containsitem containsItemP Q��Q o      ���� 0 thekey theKey��  ��  O Q     RSTR k    UU VWV I    	��X���� 0 getitem getItemX Y��Y o    ���� 0 thekey theKey��  ��  W Z��Z L   
 [[ m   
 ��
�� boovtrue��  S R      ����\
�� .ascrerr ****      � ****��  \ ��]��
�� 
errn] d      ^^ m      �������  T L    __ m    ��
�� boovfalsM `a` l     ��������  ��  ��  a bcb l     ��������  ��  ��  c ded l     ��������  ��  ��  e fgf i  > Ahih I      �������� &0 objectdescription objectDescription��  ��  i L     
jj b     	klk b     mnm m     oo �pp 0 � d i c t i o n a r y   c o l l e c t i o n   (n o    ���� 
0 _count  l m    qq �rr    i t e m s ) �g sts l     ��������  ��  ��  t uvu i  B Ewxw I      �������� 0 
copyobject 
copyObject��  ��  x Q     �yz{y k    �|| }~} r    
� I   ������
�� .Typ:DicOnull��� ��� null��  ��  � o      ���� 0 	newobject 	newObject~ ��� Z    �������� ?    ��� o    ���� 
0 _count  � m    ����  � k    ��� ��� l   +���� Z   +������� >     ��� n    ��� 1    ��
�� 
leng� n   ��� o    ���� 0 _buckets  �  f    � n    ��� 1    ��
�� 
leng� n   ��� o    ���� 0 _buckets  � o    ���� 0 	newobject 	newObject� R   # '�����
�� .ascrerr ****      � ****� m   % &�� ��� 0 M i s m a t c h e d   b u c k e t   l i s t s .��  ��  ��  � � � sanity check as this copyObject() implementation requires all bucket lists to be same length, and will need revised if growable bucket lists are supported in future   � ���J   s a n i t y   c h e c k   a s   t h i s   c o p y O b j e c t ( )   i m p l e m e n t a t i o n   r e q u i r e s   a l l   b u c k e t   l i s t s   t o   b e   s a m e   l e n g t h ,   a n d   w i l l   n e e d   r e v i s e d   i f   g r o w a b l e   b u c k e t   l i s t s   a r e   s u p p o r t e d   i n   f u t u r e� ���� Y   , ��������� k   ; ��� ��� r   ; C��� n   ; A��� 4   > A���
�� 
cobj� o   ? @���� 0 i  � n  ; >��� o   < >���� 0 _buckets  �  f   ; <� o      ���� 0 	oldbucket 	oldBucket� ���� Z   D �������� >  D G��� o   D E���� 0 	oldbucket 	oldBucket� m   E F��
�� 
msng� l  J ����� k   J ��� ��� r   J X��� K   J V�� ������ 0 k  � n  K N��� o   L N���� 0 k  � o   K L���� 0 	oldbucket 	oldBucket� ������ 0 v  � n  O R��� o   P R���� 0 v  � o   O P���� 0 	oldbucket 	oldBucket� ������� 0 nextitem nextItem� m   S T��
�� 
msng��  � o      ���� 0 	newbucket 	newBucket� ��� r   Y a��� o   Y Z���� 0 	newbucket 	newBucket� n      ��� 4   ] `���
�� 
cobj� o   ^ _���� 0 i  � n  Z ]��� o   [ ]���� 0 _buckets  � o   Z [���� 0 	newobject 	newObject� ���� V   b ���� k   l ��� ��� r   l q��� n   l o��� o   m o���� 0 nextitem nextItem� o   l m���� 0 	oldbucket 	oldBucket� o      ���� 0 	oldbucket 	oldBucket� ��� r   r ���� K   r ~�� ������ 0 k  � n  s v��� o   t v���� 0 k  � o   s t���� 0 	oldbucket 	oldBucket� ������ 0 v  � n  w z��� o   x z���� 0 v  � o   w x���� 0 	oldbucket 	oldBucket� ������� 0 nextitem nextItem� m   { |��
�� 
msng��  � o      ���� 0 tmp  � ��� r   � ���� o   � ����� 0 tmp  � n     ��� o   � ����� 0 nextitem nextItem� o   � ����� 0 	newbucket 	newBucket� ���� r   � ���� o   � ����� 0 tmp  � o      ���� 0 	newbucket 	newBucket��  � >  f k��� n   f i��� o   g i���� 0 nextitem nextItem� o   f g���� 0 	oldbucket 	oldBucket� m   i j��
�� 
msng��  � _ Y shallow copy the linked list and add it new newObject's bucket list at the same position   � ��� �   s h a l l o w   c o p y   t h e   l i n k e d   l i s t   a n d   a d d   i t   n e w   n e w O b j e c t ' s   b u c k e t   l i s t   a t   t h e   s a m e   p o s i t i o n��  ��  ��  �� 0 i  � m   / 0���� � n   0 6��� 1   3 5��
�� 
leng� n  0 3��� o   1 3���� 0 _buckets  �  f   0 1��  ��  ��  ��  � ���� L   � ��� o   � ����� 0 	newobject 	newObject��  z R      ����
�� .ascrerr ****      � ****� o      �� 0 etext eText� �~��
�~ 
errn� o      �}�} 0 enumber eNumber� �|��
�| 
erob� o      �{�{ 0 efrom eFrom� �z��y
�z 
errt� o      �x�x 
0 eto eTo�y  { I   � ��w��v�w 
0 _error  � � � m   � � �  c o p y O b j e c t   o   � ��u�u 0 etext eText  o   � ��t�t 0 enumber eNumber  o   � ��s�s 0 efrom eFrom 	�r	 o   � ��q�q 
0 eto eTo�r  �v  v 

 l     �p�o�n�p  �o  �n    l     �m�l�k�m  �l  �k    l     �j�i�h�j  �i  �h    i  F I I      �g�f�g 0 adddictionary addDictionary �e o      �d�d $0 dictionaryobject dictionaryObject�e  �f   Q    X k   F  Z   C�c�b ?    
 n    !  I    �a�`�_�a 0 
countitems 
countItems�`  �_  ! o    �^�^ $0 dictionaryobject dictionaryObject m    	�]�]   k   ?"" #$# l   #%&'% Z   #()�\�[( >    *+* n    ,-, 1    �Z
�Z 
leng- n   ./. o    �Y�Y 0 _buckets  /  f    + n    010 1    �X
�X 
leng1 n   232 o    �W�W 0 _buckets  3 o    �V�V $0 dictionaryobject dictionaryObject) R    �U4�T
�U .ascrerr ****      � ****4 m    55 �66 0 M i s m a t c h e d   b u c k e t   l i s t s .�T  �\  �[  &   sanity check, as above   ' �77 .   s a n i t y   c h e c k ,   a s   a b o v e$ 8�S8 P   $?9:;9 Y   )><�R=>�Q< k   89?? @A@ r   8 @BCB n   8 >DED 4   ; >�PF
�P 
cobjF o   < =�O�O 0 i  E n  8 ;GHG o   9 ;�N�N 0 _buckets  H o   8 9�M�M $0 dictionaryobject dictionaryObjectC o      �L�L 0 otherbucket otherBucketA I�KI Z   A9JK�J�IJ >  A DLML o   A B�H�H 0 otherbucket otherBucketM m   B C�G
�G 
msngK l  G5NOPN k   G5QQ RSR r   G OTUT n   G MVWV 4   J M�FX
�F 
cobjX o   K L�E�E 0 i  W n  G JYZY o   H J�D�D 0 _buckets  Z  f   G HU o      �C�C 0 mybucket myBucketS [�B[ Z   P5\]�A^\ =  P S_`_ o   P Q�@�@ 0 mybucket myBucket` m   Q R�?
�? 
msng] l  V �abca k   V �dd efe r   V dghg K   V bii �>jk�> 0 k  j n  W Zlml o   X Z�=�= 0 k  m o   W X�<�< 0 otherbucket otherBucketk �;no�; 0 v  n n  [ ^pqp o   \ ^�:�: 0 v  q o   [ \�9�9 0 otherbucket otherBucketo �8r�7�8 0 nextitem nextItemr m   _ `�6
�6 
msng�7  h o      �5�5 0 mybucket myBucketf sts r   e ruvu [   e lwxw o   e j�4�4 
0 _count  x m   j k�3�3 v o      �2�2 
0 _count  t yzy r   s {{|{ o   s t�1�1 0 mybucket myBucket| n      }~} 4   w z�0
�0 
cobj o   x y�/�/ 0 i  ~ n  t w��� o   u w�.�. 0 _buckets  �  f   t uz ��-� V   | ���� k   � ��� ��� r   � ���� n   � ���� o   � ��,�, 0 nextitem nextItem� o   � ��+�+ 0 otherbucket otherBucket� o      �*�* 0 otherbucket otherBucket� ��� r   � ���� K   � ��� �)���) 0 k  � n  � ���� o   � ��(�( 0 k  � o   � ��'�' 0 otherbucket otherBucket� �&���& 0 v  � n  � ���� o   � ��%�% 0 v  � o   � ��$�$ 0 otherbucket otherBucket� �#��"�# 0 nextitem nextItem� m   � ��!
�! 
msng�"  � o      � �  0 tmp  � ��� r   � ���� [   � ���� o   � ��� 
0 _count  � m   � ��� � o      �� 
0 _count  � ��� r   � ���� o   � ��� 0 tmp  � n     ��� o   � ��� 0 nextitem nextItem� o   � ��� 0 mybucket myBucket� ��� r   � ���� o   � ��� 0 tmp  � o      �� 0 mybucket myBucket�  � >  � ���� n   � ���� o   � ��� 0 nextitem nextItem� o   � ��� 0 otherbucket otherBucket� m   � ��
� 
msng�-  b   �by shallow copy   c ��� "   & b y   s h a l l o w   c o p y�A  ^ l  �5���� V   �5��� k   �0�� ��� r   � ���� o   � ��� 0 mybucket myBucket� o      �� 0 tmp  � ��� T   �*�� k   �%�� ��� Z   ������ =  � ���� n  � ���� o   � ��� 0 k  � o   � ��� 0 tmp  � n  � ���� o   � ��� 0 k  � o   � ��� 0 otherbucket otherBucket� l  � ����� k   � ��� ��� r   � ���� n  � ���� J   � ��� ��� o   � ��� 0 k  � ��� o   � ��
�
 0 v  �  � o   � ��	�	 0 otherbucket otherBucket� n     ��� J   � ��� ��� o   � ��� 0 k  � ��� o   � ��� 0 v  �  � o   � ��� 0 tmp  � ���  S   � ��  �   replace   � ���    r e p l a c e� ��� =  � ���� n  � ���� o   � ��� 0 nextitem nextItem� o   � ��� 0 tmp  � m   � ��
� 
msng� �� � l  ����� k   ��� ��� r   ���� K   ��� ������ 0 k  � n  � ���� o   � ����� 0 k  � o   � ����� 0 otherbucket otherBucket� ������ 0 v  � n  ��� o  ���� 0 v  � o   ���� 0 otherbucket otherBucket� ������� 0 nextitem nextItem� m  ��
�� 
msng��  � n     ��� o  
���� 0 nextitem nextItem� o  ���� 0 tmp  � ��� r  ��� [  ��� o  ���� 
0 _count  � m  ���� � o      ���� 
0 _count  � ����  S  ��  �   append   � ���    a p p e n d�   �  �  ��  r   % n  # o  !#���� 0 nextitem nextItem o   !���� 0 tmp   o      ���� 0 tmp  ��  � �� r  +0 n  +.	 o  ,.���� 0 nextitem nextItem	 o  +,���� 0 otherbucket otherBucket o      ���� 0 otherbucket otherBucket��  � >  � �

 o   � ����� 0 otherbucket otherBucket m   � ���
�� 
msng� 9 3 �by merging into this dictionary's existing bucket   � � f   & b y   m e r g i n g   i n t o   t h i s   d i c t i o n a r y ' s   e x i s t i n g   b u c k e t�B  O * $ transfer other dictionary's bucket�   P � H   t r a n s f e r   o t h e r   d i c t i o n a r y ' s   b u c k e t &�J  �I  �K  �R 0 i  = m   , -���� > n   - 3 1   0 2��
�� 
leng n  - 0 o   . 0���� 0 _buckets   o   - .���� $0 dictionaryobject dictionaryObject�Q  : ��
�� conscase ��
�� consdiac ��
�� conshyph ��
�� conspunc ����
�� conswhit��  ; ����
�� consnume��  �S  �c  �b   �� L  DF����  ��   R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   I  NX������ 
0 _error     m  OP!! �""  a d d D i c t i o n a r y  #$# o  PQ���� 0 etext eText$ %&% o  QR���� 0 enumber eNumber& '(' o  RS���� 0 efrom eFrom( )��) o  ST���� 
0 eto eTo��  ��   *+* l     ��������  ��  ��  + ,-, l     ��������  ��  ��  - ./. l     ��������  ��  ��  / 010 i  J M232 I      ��4���� $0 addkeysandvalues addKeysAndValues4 5��5 o      ���� 0 keyvaluelist keyValueList��  ��  3 l    �6786 Q     �9:;9 k    �<< =>= Z   ?@����? =    ABA l   C����C I   ��DE
�� .corecnte****       ****D J    FF G��G o    ���� 0 keyvaluelist keyValueList��  E ��H��
�� 
koclH m    ��
�� 
list��  ��  ��  B m    ����  @ R    ��IJ
�� .ascrerr ****      � ****I m    KK �LL 6 N o t   a   v a l i d   k e y - v a l u e   l i s t .J ��MN
�� 
errnM m    �����\N ��O��
�� 
erobO o    ���� 0 keyvaluelist keyValueList��  ��  ��  > PQP h    %��R�� 0 
listobject 
listObjectR j     ��S�� 
0 _list_  S o     ���� 0 keyvaluelist keyValueListQ TUT X   & �V��WV k   8 �XX YZY r   8 =[\[ n  8 ;]^] 1   9 ;��
�� 
pcnt^ o   8 9���� 0 aref aRef\ o      ���� 0 keyvalue keyValueZ _��_ Q   > �`ab` k   A qcc ded Z  A cfg����f G   A Vhih =   A Ljkj l  A Jl����l I  A J��mn
�� .corecnte****       ****m J   A Doo p��p o   A B���� 0 keyvalue keyValue��  n ��q��
�� 
koclq m   E F��
�� 
list��  ��  ��  k m   J K����  i >   O Trsr n  O Rtut 1   P R��
�� 
lengu o   O P���� 0 keyvalue keyValues m   R S���� g R   Y _����v
�� .ascrerr ****      � ****��  v ��w��
�� 
errnw m   [ \�����\��  ��  ��  e x��x I   d q��y���� 0 additem addItemy z{z n  e i|}| 4   f i��~
�� 
cobj~ m   g h���� } o   e f���� 0 keyvalue keyValue{ �� n  i m��� 4   j m���
�� 
cobj� m   k l���� � o   i j���� 0 keyvalue keyValue��  ��  ��  a R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� o      ���� 0 n  ��  b R   y �����
�� .ascrerr ****      � ****� m    ��� ��� 6 N o t   a   v a l i d   k e y - v a l u e   p a i r .� ���
� 
errn� o   { |�~�~ 0 n  � �}��|
�} 
erob� o   } ~�{�{ 0 aref aRef�|  ��  �� 0 aref aRefW n  ) ,��� o   * ,�z�z 
0 _list_  � o   ) *�y�y 0 
listobject 
listObjectU ��x� L   � ��w�w  �x  : R      �v��
�v .ascrerr ****      � ****� o      �u�u 0 etext eText� �t��
�t 
errn� o      �s�s 0 enumber eNumber� �r��
�r 
erob� o      �q�q 0 efrom eFrom� �p��o
�p 
errt� o      �n�n 
0 eto eTo�o  ; I   � ��m��l�m 
0 _error  � ��� m   � ��� ���   a d d K e y s A n d V a l u e s� ��� o   � ��k�k 0 etext eText� ��� o   � ��j�j 0 enumber eNumber� ��� o   � ��i�i 0 efrom eFrom� ��h� o   � ��g�g 
0 eto eTo�h  �l  7 %  list of form {{KEY,VALUE},...}   8 ��� >   l i s t   o f   f o r m   { { K E Y , V A L U E } , . . . }1 ��� l     �f�e�d�f  �e  �d  � ��� i  N Q��� I      �c�b�a�c $0 getkeysandvalues getKeysAndValues�b  �a  � k     K�� ��� h     �`��` 0 
listobject 
listObject� j     �_��_ 
0 _list_  � J     �^�^  � ��� X    E��]�� k    @�� ��� r    ��� n   ��� 1    �\
�\ 
pcnt� o    �[�[ 0 	bucketref 	bucketRef� o      �Z�Z 0 mybucket myBucket� ��Y� V     @��� k   ( ;�� ��� r   ( 5��� J   ( 0�� ��� n  ( +��� o   ) +�X�X 0 k  � o   ( )�W�W 0 mybucket myBucket� ��V� n  + .��� o   , .�U�U 0 v  � o   + ,�T�T 0 mybucket myBucket�V  � n      ���  ;   3 4� n  0 3��� o   1 3�S�S 
0 _list_  � o   0 1�R�R 0 
listobject 
listObject� ��Q� r   6 ;��� n  6 9��� o   7 9�P�P 0 nextitem nextItem� o   6 7�O�O 0 mybucket myBucket� o      �N�N 0 mybucket myBucket�Q  � >  $ '��� o   $ %�M�M 0 mybucket myBucket� m   % &�L
�L 
msng�Y  �] 0 	bucketref 	bucketRef� n   ��� o    �K�K 0 _buckets  �  f    � ��J� L   F K�� n  F J��� o   G I�I�I 
0 _list_  � o   F G�H�H 0 
listobject 
listObject�J  � ��� l     �G�F�E�G  �F  �E  � ��� i  R U��� I      �D�C�B�D 0 getkeys getKeys�C  �B  � k     F�� ��� h     �A��A 0 
listobject 
listObject� j     �@��@ 
0 _list_  � J     �?�?  � ��� X    @��>�� k    ;�� ��� r    ��� n   ��� 1    �=
�= 
pcnt� o    �<�< 0 	bucketref 	bucketRef� o      �;�; 0 mybucket myBucket� ��:� V     ;��� k   ( 6�� ��� r   ( 0��� n  ( +��� o   ) +�9�9 0 k  � o   ( )�8�8 0 mybucket myBucket� n      ���  ;   . /� n  + .��� o   , .�7�7 
0 _list_  � o   + ,�6�6 0 
listobject 
listObject� ��5� r   1 6� � n  1 4 o   2 4�4�4 0 nextitem nextItem o   1 2�3�3 0 mybucket myBucket  o      �2�2 0 mybucket myBucket�5  � >  $ ' o   $ %�1�1 0 mybucket myBucket m   % &�0
�0 
msng�:  �> 0 	bucketref 	bucketRef� n    o    �/�/ 0 _buckets    f    � �. L   A F n  A E	
	 o   B D�-�- 
0 _list_  
 o   A B�,�, 0 
listobject 
listObject�.  �  l     �+�*�)�+  �*  �)    i  V Y I      �(�'�&�( 0 	getvalues 	getValues�'  �&   k     F  h     �%�% 0 
listobject 
listObject j     �$�$ 
0 _list_   J     �#�#    X    @�" k    ;  r     n     1    �!
�! 
pcnt  o    � �  0 	bucketref 	bucketRef o      �� 0 mybucket myBucket !�! V     ;"#" k   ( 6$$ %&% r   ( 0'(' n  ( +)*) o   ) +�� 0 v  * o   ( )�� 0 mybucket myBucket( n      +,+  ;   . /, n  + .-.- o   , .�� 
0 _list_  . o   + ,�� 0 
listobject 
listObject& /�/ r   1 6010 n  1 4232 o   2 4�� 0 nextitem nextItem3 o   1 2�� 0 mybucket myBucket1 o      �� 0 mybucket myBucket�  # >  $ '454 o   $ %�� 0 mybucket myBucket5 m   % &�
� 
msng�  �" 0 	bucketref 	bucketRef n   676 o    �� 0 _buckets  7  f     8�8 L   A F99 n  A E:;: o   B D�� 
0 _list_  ; o   A B�� 0 
listobject 
listObject�   <�< l     ����  �  �  �  ��   � � { key-value collection, analogous to NSMutableDictionary (note: keys must be text, or objects that reliably coerce to text)	    � �== �   k e y - v a l u e   c o l l e c t i o n ,   a n a l o g o u s   t o   N S M u t a b l e D i c t i o n a r y   ( n o t e :   k e y s   m u s t   b e   t e x t ,   o r   o b j e c t s   t h a t   r e l i a b l y   c o e r c e   t o   t e x t ) 	 � >?> l     ��
�	�  �
  �	  ? @A@ l     ����  �  �  A BCB i   DED I     ���
� .Typ:StaOnull��� ��� null�  �  E l    FGHF h     �I� "0 stackcollection StackCollectionI k      JJ KLK l     �� ���  �   ��  L MNM j     ��O�� 	0 _head  O m     ��
�� 
msngN PQP j    ��R�� 
0 _count  R m    ����  Q STS l     ��������  ��  ��  T UVU i   	WXW I      ��Y���� 
0 _error  Y Z[Z o      ���� 0 handlername handlerName[ \]\ o      ���� 0 etext eText] ^_^ o      ���� 0 enumber eNumber_ `a` o      ���� 0 efrom eFroma b��b o      ���� 
0 eto eTo��  ��  X n    cdc I    ��e���� $0 throwmethoderror throwMethodErrore fgf m    hh �ii  O b j e c t sg jkj m    ll �mm  S t a c k C o l l e c t i o nk non o    ���� 0 handlername handlerNameo pqp o    	���� 0 etext eTextq rsr o   	 
���� 0 enumber eNumbers tut o   
 ���� 0 efrom eFromu v��v o    ���� 
0 eto eTo��  ��  d o     ���� 0 _support  V wxw l     ��������  ��  ��  x yzy i  
 {|{ I      �������� 0 
countitems 
countItems��  ��  | L     }} o     ���� 
0 _count  z ~~ l     ��������  ��  ��   ��� i   ��� I      ������� 0 additem addItem� ���� o      ���� 0 thevalue theValue��  ��  � k     !�� ��� l     ������  � . ( add a new value to the top of the stack   � ��� P   a d d   a   n e w   v a l u e   t o   t h e   t o p   o f   t h e   s t a c k� ��� r     ��� K     
�� ������ 0 v  � o    ���� 0 thevalue theValue� ������� 0 nextitem nextItem� o    ���� 	0 _head  ��  � o      ���� 	0 _head  � ��� r    ��� [    ��� o    ���� 
0 _count  � m    ���� � o      ���� 
0 _count  � ���� L    !����  ��  � ��� l     ��������  ��  ��  � ��� i   ��� I      �������� 0 
removeitem 
removeItem��  ��  � l    R���� Q     R���� k    @�� ��� Z   ������� =   
��� o    ���� 	0 _head  � m    	��
�� 
msng� R    ����
�� .ascrerr ****      � ****� m    �� ���  S t a c k   i s   e m p t y .� �����
�� 
errn� m    �����@��  ��  ��  � ��� r    !��� n    ��� o    ���� 0 v  � o    ���� 	0 _head  � o      ���� 0 thevalue theValue� ��� r   " /��� n   " )��� o   ' )���� 0 nextitem nextItem� o   " '���� 	0 _head  � o      ���� 	0 _head  � ��� r   0 =��� \   0 7��� o   0 5���� 
0 _count  � m   5 6���� � o      ���� 
0 _count  � ���� L   > @�� o   > ?���� 0 thevalue theValue��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   H R������� 
0 _error  � ��� m   I J�� ���  r e m o v e I t e m� ��� o   J K���� 0 etext eText� ��� o   K L���� 0 enumber eNumber� ��� o   L M���� 0 efrom eFrom� ���� o   M N���� 
0 eto eTo��  ��  � * $ remove and return the topmost value   � ��� H   r e m o v e   a n d   r e t u r n   t h e   t o p m o s t   v a l u e� ��� l     ��������  ��  ��  � ��� i   ��� I      ��������  0 deleteallitems deleteAllItems��  ��  � k     �� ��� r     ��� m     ��
�� 
msng� o      ���� 	0 _head  � ��� r    ��� m    	����  � o      ���� 
0 _count  � ���� L    ����  ��  � ��� l     ��������  ��  ��  � ��� i   ��� I      �������� 0 getitem getItem��  ��  � l    3���� Q     3���� k    !�� ��� Z   ������� =   
��� o    ���� 	0 _head  � m    	��
�� 
msng� R    ����
�� .ascrerr ****      � ****� m       �  S t a c k   i s   e m p t y .� ����
�� 
errn m    �����@��  ��  ��  � �� L    ! n      o    ���� 0 v   o    ���� 	0 _head  ��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��	

�� 
errn	 o      ���� 0 enumber eNumber
 ��
�� 
erob o      ���� 0 efrom eFrom ���
�� 
errt o      �~�~ 
0 eto eTo�  � I   ) 3�}�|�} 
0 _error    m   * + �  g e t I t e m  o   + ,�{�{ 0 etext eText  o   , -�z�z 0 enumber eNumber  o   - .�y�y 0 efrom eFrom �x o   . /�w�w 
0 eto eTo�x  �|  � 3 - return the topmost value without removing it   � � Z   r e t u r n   t h e   t o p m o s t   v a l u e   w i t h o u t   r e m o v i n g   i t�  l     �v�u�t�v  �u  �t    i   !  I      �s�r�q�s &0 objectdescription objectDescription�r  �q    L     
!! b     	"#" b     $%$ m     && �'' & � s t a c k   c o l l e c t i o n   (% o    �p�p 
0 _count  # m    (( �))    i t e m s ) � *+* l     �o�n�m�o  �n  �m  + ,-, i  " %./. I      �l�k�j�l 0 
copyobject 
copyObject�k  �j  / k     i00 121 r     343 I    �i�h�g
�i .Typ:StaOnull��� ��� null�h  �g  4 o      �f�f 0 	newobject 	newObject2 565 Z    f78�e�d7 ?    9:9 o    �c�c 
0 _count  : m    �b�b  8 k    b;; <=< r    >?> o    �a�a 
0 _count  ? n     @A@ o    �`�` 
0 _count  A o    �_�_ 0 	newobject 	newObject= BCB r    *DED K    (FF �^GH�^ 0 v  G n   $IJI o   " $�]�] 0 v  J o    "�\�\ 	0 _head  H �[K�Z�[ 0 nextitem nextItemK m   % &�Y
�Y 
msng�Z  E o      �X�X 0 newhead newHeadC LML r   + 0NON o   + ,�W�W 0 newhead newHeadO n     PQP o   - /�V�V 	0 _head  Q o   , -�U�U 0 	newobject 	newObjectM RSR r   1 :TUT n  1 8VWV o   6 8�T�T 0 nextitem nextItemW o   1 6�S�S 	0 _head  U o      �R�R 0 oldhead oldHeadS X�QX V   ; bYZY k   C ][[ \]\ r   C M^_^ K   C K`` �Pab�P 0 v  a n  D Gcdc o   E G�O�O 0 v  d o   D E�N�N 0 oldhead oldHeadb �Me�L�M 0 nextitem nextIteme m   H I�K
�K 
msng�L  _ o      �J�J 0 tmp  ] fgf r   N Shih o   N O�I�I 0 tmp  i n     jkj o   P R�H�H 0 nextitem nextItemk o   O P�G�G 0 newhead newHeadg lml r   T Wnon o   T U�F�F 0 tmp  o o      �E�E 0 newhead newHeadm p�Dp r   X ]qrq n  X [sts o   Y [�C�C 0 nextitem nextItemt o   X Y�B�B 0 oldhead oldHeadr o      �A�A 0 oldhead oldHead�D  Z >  ? Buvu o   ? @�@�@ 0 oldhead oldHeadv m   @ A�?
�? 
msng�Q  �e  �d  6 w�>w L   g ixx o   g h�=�= 0 	newobject 	newObject�>  - y�<y l     �;�:�9�;  �:  �9  �<  G !  Last-In-First-Out sequence   H �zz 6   L a s t - I n - F i r s t - O u t   s e q u e n c eC {|{ l     �8�7�6�8  �7  �6  | }~} l     �5�4�3�5  �4  �3  ~ � i   ��� I     �2�1�0
�2 .Typ:QueOnull��� ��� null�1  �0  � l    ���� h     �/��/ "0 queuecollection QueueCollection� k      �� ��� l     �.�-�,�.  �-  �,  � ��� j     �+��+ 	0 _back  � m     �*
�* 
msng� ��� j    �)��) 
0 _front  � m    �(
�( 
msng� ��� j    �'��' 
0 _count  � m    �&�&  � ��� l     �%�$�#�%  �$  �#  � ��� i  	 ��� I      �"��!�" 
0 _error  � ��� o      � �  0 handlername handlerName� ��� o      �� 0 etext eText� ��� o      �� 0 enumber eNumber� ��� o      �� 0 efrom eFrom� ��� o      �� 
0 eto eTo�  �!  � n    ��� I    ���� $0 throwmethoderror throwMethodError� ��� m    �� ���  O b j e c t s� ��� m    �� ���  Q u e u e C o l l e c t i o n� ��� o    �� 0 handlername handlerName� ��� o    	�� 0 etext eText� ��� o   	 
�� 0 enumber eNumber� ��� o   
 �� 0 efrom eFrom� ��� o    �� 
0 eto eTo�  �  � o     �� 0 _support  � ��� l     ����  �  �  � ��� i   ��� I      ���� 0 
countitems 
countItems�  �  � L     �� o     �� 
0 _count  � ��� l     �
�	��
  �	  �  � ��� i   ��� I      ���� 0 additem addItem� ��� o      �� 0 thevalue theValue�  �  � k     S�� ��� l     ����  � / ) add a new value to the back of the queue   � ��� R   a d d   a   n e w   v a l u e   t o   t h e   b a c k   o f   t h e   q u e u e� ��� r     ��� K     �� ���� 0 v  � o    �� 0 thevalue theValue� � ����  0 nextitem nextItem� m    ��
�� 
msng��  � o      ���� 0 nextitem nextItem� ��� Z  	  ������� >  	 ��� o   	 ���� 	0 _back  � m    ��
�� 
msng� r    ��� o    ���� 0 nextitem nextItem� n      ��� o    ���� 0 nextitem nextItem� o    ���� 	0 _back  ��  ��  � ��� r   ! (��� o   ! "���� 0 nextitem nextItem� o      ���� 	0 _back  � ��� Z  ) B������� =  ) 0��� o   ) .���� 
0 _front  � m   . /��
�� 
msng� r   3 >��� o   3 8���� 	0 _back  � o      ���� 
0 _front  ��  ��  � ��� r   C P��� [   C J��� o   C H���� 
0 _count  � m   H I���� � o      ���� 
0 _count  � ���� L   Q S����  ��  � ��� l     ��������  ��  ��  � ��� i   ��� I      �������� 0 
removeitem 
removeItem��  ��  � l    h���� Q     h���� k    V�� ��� Z    ����  =   
 o    ���� 
0 _front   m    	��
�� 
msng R    ��
�� .ascrerr ****      � **** m     �  Q u e u e   i s   e m p t y . ����
�� 
errn m    �����@��  ��  ��  � 	
	 r    ! n     o    ���� 0 v   o    ���� 
0 _front   o      ���� 0 thevalue theValue
  r   " / n   " ) o   ' )���� 0 nextitem nextItem o   " '���� 
0 _front   o      ���� 
0 _front    Z  0 E���� =  0 7 o   0 5���� 
0 _front   m   5 6��
�� 
msng r   : A m   : ;��
�� 
msng o      ���� 	0 _back  ��  ��    r   F S  \   F M!"! o   F K���� 
0 _count  " m   K L����   o      ���� 
0 _count   #��# L   T V$$ o   T U���� 0 thevalue theValue��  � R      ��%&
�� .ascrerr ****      � ****% o      ���� 0 etext eText& ��'(
�� 
errn' o      ���� 0 enumber eNumber( ��)*
�� 
erob) o      ���� 0 efrom eFrom* ��+��
�� 
errt+ o      ���� 
0 eto eTo��  � I   ^ h��,���� 
0 _error  , -.- m   _ `// �00  r e m o v e I t e m. 121 o   ` a���� 0 etext eText2 343 o   a b���� 0 enumber eNumber4 565 o   b c���� 0 efrom eFrom6 7��7 o   c d���� 
0 eto eTo��  ��  � < 6 remove and return the value at the front of the queue   � �88 l   r e m o v e   a n d   r e t u r n   t h e   v a l u e   a t   t h e   f r o n t   o f   t h e   q u e u e� 9:9 l     ��������  ��  ��  : ;<; i   =>= I      ��������  0 deleteallitems deleteAllItems��  ��  > k     ?? @A@ r     BCB m     ��
�� 
msngC o      ���� 	0 _back  A DED r    FGF m    	��
�� 
msngG o      ���� 
0 _front  E HIH r    JKJ m    ����  K o      ���� 
0 _count  I L��L L    ����  ��  < MNM l     ��������  ��  ��  N OPO i    QRQ I      �������� 0 getitem getItem��  ��  R l    3STUS Q     3VWXV k    !YY Z[Z Z   \]����\ =   
^_^ o    ���� 
0 _front  _ m    	��
�� 
msng] R    ��`a
�� .ascrerr ****      � ****` m    bb �cc  Q u e u e   i s   e m p t y .a ��d��
�� 
errnd m    �����@��  ��  ��  [ e��e L    !ff n     ghg o    ���� 0 v  h o    ���� 
0 _front  ��  W R      ��ij
�� .ascrerr ****      � ****i o      ���� 0 etext eTextj ��kl
�� 
errnk o      ���� 0 enumber eNumberl ��mn
�� 
erobm o      ���� 0 efrom eFromn ��o��
�� 
errto o      ���� 
0 eto eTo��  X I   ) 3��p���� 
0 _error  p qrq m   * +ss �tt  g e t I t e mr uvu o   + ,���� 0 etext eTextv wxw o   , -���� 0 enumber eNumberx yzy o   - .���� 0 efrom eFromz {��{ o   . /���� 
0 eto eTo��  ��  T E ? return the value at the front of the queue without removing it   U �|| ~   r e t u r n   t h e   v a l u e   a t   t h e   f r o n t   o f   t h e   q u e u e   w i t h o u t   r e m o v i n g   i tP }~} l     ��������  ��  ��  ~ � i  ! $��� I      �������� &0 objectdescription objectDescription��  ��  � L     
�� b     	��� b     ��� m     �� ��� & � q u e u e   c o l l e c t i o n   (� o    ���� 
0 _count  � m    �� ���    i t e m s ) �� ��� l     ��������  ��  ��  � ��� i  % (��� I      ����~�� 0 
copyobject 
copyObject�  �~  � k     o�� ��� r     ��� I    �}�|�{
�} .Typ:QueOnull��� ��� null�|  �{  � o      �z�z 0 	newobject 	newObject� ��� Z    l���y�x� ?    ��� o    �w�w 
0 _count  � m    �v�v  � k    h�� ��� r    ��� o    �u�u 
0 _count  � n     ��� o    �t�t 
0 _count  � o    �s�s 0 	newobject 	newObject� ��� r    *��� K    (�� �r���r 0 v  � n   $��� o   " $�q�q 0 v  � o    "�p�p 
0 _front  � �o��n�o 0 nextitem nextItem� m   % &�m
�m 
msng�n  � o      �l�l 0 newfront newFront� ��� r   + 0��� o   + ,�k�k 0 newfront newFront� n     ��� o   - /�j�j 
0 _front  � o   , -�i�i 0 	newobject 	newObject� ��� r   1 :��� n  1 8��� o   6 8�h�h 0 nextitem nextItem� o   1 6�g�g 
0 _front  � o      �f�f 0 oldfront oldFront� ��� V   ; b��� k   C ]�� ��� r   C M��� K   C K�� �e���e 0 v  � n  D G��� o   E G�d�d 0 v  � o   D E�c�c 0 oldfront oldFront� �b��a�b 0 nextitem nextItem� m   H I�`
�` 
msng�a  � o      �_�_ 0 tmp  � ��� r   N S��� o   N O�^�^ 0 tmp  � n     ��� o   P R�]�] 0 nextitem nextItem� o   O P�\�\ 0 newfront newFront� ��� r   T W��� o   T U�[�[ 0 tmp  � o      �Z�Z 0 newfront newFront� ��Y� r   X ]��� n  X [��� o   Y [�X�X 0 nextitem nextItem� o   X Y�W�W 0 oldfront oldFront� o      �V�V 0 oldfront oldFront�Y  � >  ? B��� o   ? @�U�U 0 oldfront oldFront� m   @ A�T
�T 
msng� ��S� r   c h��� o   c d�R�R 0 newfront newFront� n     ��� o   e g�Q�Q 	0 _back  � o   d e�P�P 0 	newobject 	newObject�S  �y  �x  � ��O� L   m o�� o   m n�N�N 0 	newobject 	newObject�O  � ��M� l     �L�K�J�L  �K  �J  �M  � "  First-In-First-Out sequence   � ��� 8   F i r s t - I n - F i r s t - O u t   s e q u e n c e� ��� l     �I�H�G�I  �H  �G  � ��� l     �F�E�D�F  �E  �D  � ��C� l     �B�A�@�B  �A  �@  �C       �?��������?  � �>�=�<�;�:�9�> 0 _support  �= 
0 _error  �<  0 _makeemptylist _makeEmptyList
�; .Typ:DicOnull��� ��� null
�: .Typ:StaOnull��� ��� null
�9 .Typ:QueOnull��� ��� null� ��   �8 "
�8 
scpt� �7 *�6�5���4�7 
0 _error  �6 �3��3 �  �2�1�0�/�.�2 0 handlername handlerName�1 0 etext eText�0 0 enumber eNumber�/ 0 efrom eFrom�. 
0 eto eTo�5  � �-�,�+�*�)�- 0 handlername handlerName�, 0 etext eText�+ 0 enumber eNumber�* 0 efrom eFrom�) 
0 eto eTo�  :�(�'�( �' &0 throwcommanderror throwCommandError�4 b   ࠡ����+ � �& X�%�$���#�&  0 _makeemptylist _makeEmptyList�% �"��" �  �!�! 0 n  �$  � � ��  0 n  � 0 l  � �
� 
msng�# "�kvE�O h�k��%E�O�l"E�[OY��O�� � ������
� .Typ:DicOnull��� ��� null�  �  � �� ,0 dictionarycollection DictionaryCollection� � ��� ,0 dictionarycollection DictionaryCollection� �������
� .ascrinit****      � ****� k     Y��  ���  ���  ���  �	 	   �		  �		 �		 �		 V		 �		 �		 L		 f				 u	
	
 		 0		 �		 �		 ��  �  �  � ���������
�	��������� 
� 
pimr� 0 _buckets  � 	0 _size  � 
0 _count  � 
0 _error  � 0 	_keyindex 	_keyIndex� 0 
countitems 
countItems� 0 additem addItem�
 0 
removeitem 
removeItem�	  0 deleteallitems deleteAllItems� 0 getitem getItem� 0 containsitem containsItem� &0 objectdescription objectDescription� 0 
copyobject 
copyObject� 0 adddictionary addDictionary� $0 addkeysandvalues addKeysAndValues� $0 getkeysandvalues getKeysAndValues� 0 getkeys getKeys�  0 	getvalues 	getValues� ���� �������������															
�� 
cobj
�� 
frmk�� ��  0 _makeemptylist _makeEmptyList�� 0 _buckets  
�� 
leng�� 	0 _size  �� 
0 _count  	 �� �����		���� 
0 _error  �� ��	 �� 	   ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  	 ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo	  � ������� �� $0 throwmethoderror throwMethodError�� b   �ᠡ����+ 	 �� �����	!	"���� 0 	_keyindex 	_keyIndex�� ��	#�� 	#  ���� 0 thekey theKey��  	! �������� 0 thekey theKey�� 0 hashnum hashNum�� 0 divnum divNum	" ��������������������������������m�������������	$�������
�� 
kocl
�� 
obj 
�� .corecnte****       ****
�� 
list
�� 
bool
�� 
reco
�� 
scpt
�� 
errn���\
�� 
type
�� 
pcls
�� 
enum�� 0 
asnsobject 
asNSObject�� 0 typecodevalue typeCodeValue
�� 
long
�� 
doub��  J�
�� 
ctxt�� ,0 asnormalizednsstring asNormalizedNSString�� 0 hash  �� ��  	$ ������
�� 
errn���\��  ���Y
�� 
erob�� �� �kv��l j
 �kv��l j�&
 �kv��l j�&
 �kv��l j�& )��lhY hO���mv��,kv b   �k+ j+ E�Y x��lv��,kv C�E�O�k#E�O�j �k�!E�Y hO�j 	�'E�Y hO�a  �a  E�Y hY b   �a &k+ j+ E�O�a  �a "E�Y hO�b  #kW X  )�a a �a a 	 �������	%	&���� 0 
countitems 
countItems��  ��  	%  	&  �� b  	 �������	'	(���� 0 additem addItem�� ��	)�� 	)  ������ 0 thekey theKey�� 0 thevalue theValue��  	' 	�������������������� 0 thekey theKey�� 0 thevalue theValue�� 0 keyindex keyIndex�� 0 	founditem 	foundItem�� 0 oldvalue oldValue�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo	( ��������������������	*K������ 0 	_keyindex 	_keyIndex�� 0 _buckets  
�� 
cobj
�� 
msng�� 0 k  �� 0 v  �� 0 nextitem nextItem�� �� 0 etext eText	* ����	+
�� 
errn�� 0 enumber eNumber	+ ����	,
�� 
erob�� 0 efrom eFrom	, ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � �*�k+  E�O�EQ�O)�,�/E�O��  %�����)�,�/FOb  kEc  OhY hO�� i ehZ��,�  %��,E�O��lvE[�k/��,FZ[�l/��,FZOhY hO��,�  "�������,FOb  kEc  OhY hO��,E�[OY��VW X 
 *쥦���+ 	 ��Y����	-	.���� 0 
removeitem 
removeItem�� ��	/�� 	/  ���� 0 thekey theKey��  	- 
���������������������� 0 thekey theKey�� 0 keyindex keyIndex�� 0 	founditem 	foundItem�� 0 previtem prevItem�� 0 foundkey foundKey�� 0 thevalue theValue�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo	. ������rs�������������������	0���~�� 0 	_keyindex 	_keyIndex�� 0 _buckets  
�� 
cobj
�� 
msng�� 0 k  �� 0 v  �� 0 nextitem nextItem
�� 
errn���@
�� 
erob�� �� 0 etext eText	0 �}�|	1
�} 
errn�| 0 enumber eNumber	1 �{�z	2
�{ 
erob�z 0 efrom eFrom	2 �y�x�w
�y 
errt�x 
0 eto eTo�w  � �~ 
0 _error  �� � �*�k+  E�O)�,�/E�O�� _�E�O Wh����,E�O��  6��,E�O��  ��,)�,�/FY 	��,��,FOb  kEc  O�Y hO�E�O��,E�[OY��VO)�����W X  *a ����a + 	 �v��u�t	3	4�s�v  0 deleteallitems deleteAllItems�u  �t  	3  	4 �r�q�p�o�r �q  0 _makeemptylist _makeEmptyList�p 0 _buckets  
�o 
leng�s "*�k+ )�,FO)�,�,Ec  OjEc  Oh	 �n��m�l	5	6�k�n 0 getitem getItem�m �j	7�j 	7  �i�i 0 thekey theKey�l  	5 �h�g�f�e�d�c�h 0 thekey theKey�g 0 	founditem 	foundItem�f 0 etext eText�e 0 enumber eNumber�d 0 efrom eFrom�c 
0 eto eTo	6 �b�a�`�_�^�]�\�[�Z�Y�X2�W	8A�V�U�b 0 _buckets  
�a 
cobj�` 0 	_keyindex 	_keyIndex
�_ 
msng�^ 0 k  �] 0 v  �\ 0 nextitem nextItem
�[ 
errn�Z�@
�Y 
erob�X �W 0 etext eText	8 �T�S	9
�T 
errn�S 0 enumber eNumber	9 �R�Q	:
�R 
erob�Q 0 efrom eFrom	: �P�O�N
�P 
errt�O 
0 eto eTo�N  �V �U 
0 _error  �k [ F�� 5)�,�*�k+ /E�O #h����,�  
��,EY hO��,E�[OY��VO)�����W X  *a ����a + 	 �MO�L�K	;	<�J�M 0 containsitem containsItem�L �I	=�I 	=  �H�H 0 thekey theKey�K  	; �G�G 0 thekey theKey	< �F�E	>�F 0 getitem getItem�E  	> �D�C�B
�D 
errn�C�@�B  �J  *�k+  OeW 	X  f	 �Ai�@�?	?	@�>�A &0 objectdescription objectDescription�@  �?  	?  	@ oq�> �b  %�%	 �=x�<�;	A	B�:�= 0 
copyobject 
copyObject�<  �;  	A 	�9�8�7�6�5�4�3�2�1�9 0 	newobject 	newObject�8 0 i  �7 0 	oldbucket 	oldBucket�6 0 	newbucket 	newBucket�5 0 tmp  �4 0 etext eText�3 0 enumber eNumber�2 0 efrom eFrom�1 
0 eto eTo	B �0�/�.��-�,�+�*�)�(�'	C�&�%
�0 .Typ:DicOnull��� ��� null�/ 0 _buckets  
�. 
leng
�- 
cobj
�, 
msng�+ 0 k  �* 0 v  �) 0 nextitem nextItem�( �' 0 etext eText	C �$�#	D
�$ 
errn�# 0 enumber eNumber	D �"�!	E
�" 
erob�! 0 efrom eFrom	E � ��
�  
errt� 
0 eto eTo�  �& �% 
0 _error  �: � �*j  E�Ob  j �)�,�,��,�, 	)j�Y hO kk)�,�,Ekh )�,�/E�O�� J��,��,���E�O���,�/FO ,h��,���,E�O��,��,���E�O���,FO�E�[OY��Y h[OY��Y hO�W X 
 *쥦���+ 	 ���	F	G�� 0 adddictionary addDictionary� �	H� 	H  �� $0 dictionaryobject dictionaryObject�  	F 	���������� $0 dictionaryobject dictionaryObject� 0 i  � 0 otherbucket otherBucket� 0 mybucket myBucket� 0 tmp  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo	G ���5:;��
�	����	I!��� 0 
countitems 
countItems� 0 _buckets  
� 
leng
� 
cobj
�
 
msng�	 0 k  � 0 v  � 0 nextitem nextItem� � 0 etext eText	I ��	J
� 
errn� 0 enumber eNumber	J � ��	K
�  
erob�� 0 efrom eFrom	K ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  �YH�j+  j7)�,�,��,�, 	)j�Y hO��k��,�,Ekh ��,�/E�O�� �)�,�/E�O��  f��,��,���E�Ob  kEc  O�)�,�/FO :h��,���,E�O��,��,���E�Ob  kEc  O���,FO�E�[OY��Y } zh���E�O chZ��,��,   �[�,\[�,\Zlv�[�,\[�,\ZlvFOY .��,�  %��,��,�����,FOb  kEc  OY hO��,E�[OY��O��,E�[OY��Y h[OY��VY hOhW X  *���+ 	 ��3����	L	M���� $0 addkeysandvalues addKeysAndValues�� ��	N�� 	N  ���� 0 keyvaluelist keyValueList��  	L 	�������������������� 0 keyvaluelist keyValueList�� 0 
listobject 
listObject�� 0 aref aRef�� 0 keyvalue keyValue�� 0 n  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo	M ��������������K��R	O��������������	P���	Q�����
�� 
kocl
�� 
list
�� .corecnte****       ****
�� 
errn���\
�� 
erob�� �� 0 
listobject 
listObject	O ��	R����	S	T��
�� .ascrinit****      � ****	R k     	U	U R����  ��  ��  	S ���� 
0 _list_  	T ���� 
0 _list_  �� b   ��� 
0 _list_  
�� 
cobj
�� 
pcnt
�� 
leng
�� 
bool�� 0 additem addItem��  	P ������
�� 
errn�� 0 n  ��  �� 0 etext eText	Q ����	V
�� 
errn�� 0 enumber eNumber	V ����	W
�� 
erob�� 0 efrom eFrom	W ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � ��kv��l j  )�����Y hO��K 
S�O a��,[��l kh ��,E�O 5�kv��l j 
 	��,l�& )��lhY hO*��k/��l/l+ W X  )���a [OY��OhW X  *a ����a + 	 �������	X	Y���� $0 getkeysandvalues getKeysAndValues��  ��  	X �������� 0 
listobject 
listObject�� 0 	bucketref 	bucketRef�� 0 mybucket myBucket	Y ���	Z���������������������� 0 
listobject 
listObject	Z ��	[����	\	]��
�� .ascrinit****      � ****	[ k     	^	^ �����  ��  ��  	\ ���� 
0 _list_  	] ���� 
0 _list_  �� jv��� 0 _buckets  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
msng�� 0 k  �� 0 v  �� 
0 _list_  �� 0 nextitem nextItem�� L��K S�O <)�,[��l kh ��,E�O h����,��,lv��,6FO��,E�[OY��[OY��O��,E	 �������	_	`���� 0 getkeys getKeys��  ��  	_ �������� 0 
listobject 
listObject�� 0 	bucketref 	bucketRef�� 0 mybucket myBucket	` ���	a�������������������� 0 
listobject 
listObject	a ��	b����	c	d��
�� .ascrinit****      � ****	b k     	e	e �����  ��  ��  	c ���� 
0 _list_  	d ���� 
0 _list_  �� jv��� 0 _buckets  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
msng�� 0 k  �� 
0 _list_  �� 0 nextitem nextItem�� G��K S�O 7)�,[��l kh ��,E�O h����,��,6FO��,E�[OY��[OY��O��,E	 ������	f	g���� 0 	getvalues 	getValues��  ��  	f �������� 0 
listobject 
listObject�� 0 	bucketref 	bucketRef�� 0 mybucket myBucket	g ��	h�������������������� 0 
listobject 
listObject	h ��	i����	j	k��
�� .ascrinit****      � ****	i k     	l	l ����  ��  ��  	j ���� 
0 _list_  	k ���� 
0 _list_  �� jv��� 0 _buckets  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
msng�� 0 v  �� 
0 _list_  �� 0 nextitem nextItem�� G��K S�O 7)�,[��l kh ��,E�O h����,��,6FO��,E�[OY��[OY��O��,E� Z�*��/lkv�*�k+ �O)�,�,E�Oj�OL 	OL 
OL OL OL OL OL OL OL OL OL OL OL OL OL � ��K S�� ��E��~	m	n�}
�� .Typ:StaOnull��� ��� null�  �~  	m �|�| "0 stackcollection StackCollection	n �{I	o�{ "0 stackcollection StackCollection	o �z	p�y�x	q	r�w
�z .ascrinit****      � ****	p k     %	s	s M	t	t P	u	u U	v	v y	w	w �	x	x �	y	y �	z	z �	{	{ 	|	| ,�v�v  �y  �x  	q 
�u�t�s�r�q�p�o�n�m�l�u 	0 _head  �t 
0 _count  �s 
0 _error  �r 0 
countitems 
countItems�q 0 additem addItem�p 0 
removeitem 
removeItem�o  0 deleteallitems deleteAllItems�n 0 getitem getItem�m &0 objectdescription objectDescription�l 0 
copyobject 
copyObject	r �k�j�i	}	~		�	�	�	�	�
�k 
msng�j 	0 _head  �i 
0 _count  	} �hX�g�f	�	��e�h 
0 _error  �g �d	��d 	�  �c�b�a�`�_�c 0 handlername handlerName�b 0 etext eText�a 0 enumber eNumber�` 0 efrom eFrom�_ 
0 eto eTo�f  	� �^�]�\�[�Z�^ 0 handlername handlerName�] 0 etext eText�\ 0 enumber eNumber�[ 0 efrom eFrom�Z 
0 eto eTo	� hl�Y�X�Y �X $0 throwmethoderror throwMethodError�e b   �ᠡ����+ 	~ �W|�V�U	�	��T�W 0 
countitems 
countItems�V  �U  	�  	�  �T b  	 �S��R�Q	�	��P�S 0 additem addItem�R �O	��O 	�  �N�N 0 thevalue theValue�Q  	� �M�M 0 thevalue theValue	� �L�K�J�L 0 v  �K 0 nextitem nextItem�J �P "��b   �Ec   Ob  kEc  Oh	� �I��H�G	�	��F�I 0 
removeitem 
removeItem�H  �G  	� �E�D�C�B�A�E 0 thevalue theValue�D 0 etext eText�C 0 enumber eNumber�B 0 efrom eFrom�A 
0 eto eTo	� �@�?�>��=�<�;	���:�9
�@ 
msng
�? 
errn�>�@�= 0 v  �< 0 nextitem nextItem�; 0 etext eText	� �8�7	�
�8 
errn�7 0 enumber eNumber	� �6�5	�
�6 
erob�5 0 efrom eFrom	� �4�3�2
�4 
errt�3 
0 eto eTo�2  �: �9 
0 _error  �F S Bb   �  )��l�Y hOb   �,E�Ob   �,Ec   Ob  kEc  O�W X  *衢���+ 
	� �1��0�/	�	��.�1  0 deleteallitems deleteAllItems�0  �/  	�  	� �-
�- 
msng�. �Ec   OjEc  Oh	� �,��+�*	�	��)�, 0 getitem getItem�+  �*  	� �(�'�&�%�( 0 etext eText�' 0 enumber eNumber�& 0 efrom eFrom�% 
0 eto eTo	� 
�$�#�" �!� 	���
�$ 
msng
�# 
errn�"�@�! 0 v  �  0 etext eText	� ��	�
� 
errn� 0 enumber eNumber	� ��	�
� 
erob� 0 efrom eFrom	� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �) 4 #b   �  )��l�Y hOb   �,EW X  *砡���+ 		� � ��	�	��� &0 objectdescription objectDescription�  �  	�  	� &(� �b  %�%	� �/��	�	��� 0 
copyobject 
copyObject�  �  	� ����� 0 	newobject 	newObject� 0 newhead newHead� 0 oldhead oldHead� 0 tmp  	� �
�	�����
�
 .Typ:StaOnull��� ��� null�	 
0 _count  � 0 v  � 0 nextitem nextItem
� 
msng� � 	0 _head  � j*j  E�Ob  j Ub  ��,FO�b   �,���E�O���,FOb   �,E�O &h����,���E�O���,FO�E�O��,E�[OY��Y hO��w &�Oj�OL OL OL OL OL OL OL 	OL 
�} ��K S�� ����	�	�� 
� .Typ:QueOnull��� ��� null�  �  	� ���� "0 queuecollection QueueCollection	� ���	��� "0 queuecollection QueueCollection	� ��	�����	�	���
�� .ascrinit****      � ****	� k     (	�	� �	�	� �	�	� �	�	� �	�	� �	�	� �	�	� �	�	� ;	�	� O	�	� 	�	� �����  ��  ��  	� ������������������������ 	0 _back  �� 
0 _front  �� 
0 _count  �� 
0 _error  �� 0 
countitems 
countItems�� 0 additem addItem�� 0 
removeitem 
removeItem��  0 deleteallitems deleteAllItems�� 0 getitem getItem�� &0 objectdescription objectDescription�� 0 
copyobject 
copyObject	� ��������	�	�	�	�	�	�	�	�
�� 
msng�� 	0 _back  �� 
0 _front  �� 
0 _count  	� �������	�	����� 
0 _error  �� ��	��� 	�  ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  	� ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo	� �������� �� $0 throwmethoderror throwMethodError�� b   �ᠡ����+ 	� �������	�	����� 0 
countitems 
countItems��  ��  	�  	�  �� b  	� �������	�	����� 0 additem addItem�� ��	��� 	�  ���� 0 thevalue theValue��  	� ������ 0 thevalue theValue�� 0 nextitem nextItem	� ���������� 0 v  �� 0 nextitem nextItem
�� 
msng�� �� T����E�Ob   � �b   �,FY hO�Ec   Ob  �  b   Ec  Y hOb  kEc  Oh	� �������	�	����� 0 
removeitem 
removeItem��  ��  	� ������������ 0 thevalue theValue�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo	� ������������	�/����
�� 
msng
�� 
errn���@�� 0 v  �� 0 nextitem nextItem�� 0 etext eText	� ����	�
�� 
errn�� 0 enumber eNumber	� ����	�
�� 
erob�� 0 efrom eFrom	� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� i Xb  �  )��l�Y hOb  �,E�Ob  �,Ec  Ob  �  �Ec   Y hOb  kEc  O�W X  *衢���+ 
	� ��>����	�	�����  0 deleteallitems deleteAllItems��  ��  	�  	� ��
�� 
msng�� �Ec   O�Ec  OjEc  Oh	� ��R����	�	����� 0 getitem getItem��  ��  	� ���������� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo	� 
������b����	�s����
�� 
msng
�� 
errn���@�� 0 v  �� 0 etext eText	� ����	�
�� 
errn�� 0 enumber eNumber	� ����	�
�� 
erob�� 0 efrom eFrom	� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� 4 #b  �  )��l�Y hOb  �,EW X  *砡���+ 		� �������	�	����� &0 objectdescription objectDescription��  ��  	�  	� ���� �b  %�%	� �������	�	����� 0 
copyobject 
copyObject��  ��  	� ���������� 0 	newobject 	newObject�� 0 newfront newFront�� 0 oldfront oldFront�� 0 tmp  	� ����������������
�� .Typ:QueOnull��� ��� null�� 
0 _count  �� 0 v  �� 0 nextitem nextItem
�� 
msng�� �� 
0 _front  �� 	0 _back  �� p*j  E�Ob  j [b  ��,FO�b  �,���E�O���,FOb  �,E�O &h����,���E�O���,FO�E�O��,E�[OY��O���,FY hO��� )�O�Oj�OL OL OL OL OL OL 	OL 
OL �  ��K S� ascr  ��ޭ