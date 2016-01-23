FasdUAS 1.101.10   ��   ��    k             l      ��  ��   qk DateLib -- make, parse, and format dates and date strings

Caution:

- AppleScript's date objects are mutable(!), so any time a new date object is needed, either construct it from scratch using ASOC's `(NSDate's date...()) as date`, Standard Additions' `current date` command, or `copy _defaultDate to newDate` and work on the *copy*. NEVER use, modify, or return _defaultDate (or any other retained date object) directly, as allowing a shared mutable object to escape from this library and run loose around users' programs is a guaranteed recipe for chaos and disaster. (It's bad enough when lists and records do this, but dates don't look like mutable collections so users are even less likely to realize they contain shareable state.)

TO DO: 

- should `convert record to date` implement optional `with/without rollover allowed` parameter to determine if out-of-range values should be allowed to rollover or not (default: error if rollover detected) check for any out-of-range properties, as AS will silently roll over (Q. what about leap-seconds?) TBH, probably be simpler and safer to range-check year+month+hours+minutes (all those ranges are fixed, so as long as the rec's properties are anywhere within those ranges they're ok), and comparison-check the day (allowing some flexibility in the event that a leap second nudges it over to the next day), and finally check the seconds isn't obviously invalid (e.g. -1,70)

- should `convert` handlers implement optional `using [ISO8601 format/RFC822 format/AppleScript format/etc]` parameter? or just stick to ISO8601, and tell user to use FormatLib when working with other formats? also, `convert X to Y`, while explicit, is tedious; any better naming? `parse date`/`format date` are nice and terse, if merging this functionality into those (or `convert ISO8601 to date`, similar to `convert hexadecimal to number`?)

- put all parsing/formatting (number, date, general) into a single 'FormatLib'?; note that formatting should accept either template text or constants for standard formats - `default` (`long datetime`? i.e. AppleScript's standard, localized representation), (also `long date`, `long time`, `short date`, �?), `ISO8601` ('YYYY-MM-DDTHH:MM:SS'; what about choice of separator? 'T' or space? maybe also have `ISO8601 date and time` so user can choose? or even take a list of constants which will appear whitespace-separated?), `ISO8601 date`, `ISO8601 time`, etc. Will also need to consider TZ handling; AS dates don't hold TZ info, so a separate optional TZ parameter would be needed for adjusting dates to local TZ when parsing/formatting

- what about timezone support? (obviously this is problematic as AS's date type and AEM's typeLongDateTime support current TZ only, but for general date manipulation tasks a script object wrapper, or (perhaps preferable from user's POV since it's transparent) a {class:date with timezone,time:...,timezone:...} record, could be defined that stores an arbitrary TZ in addition to standard date value); see also `time to GMT` in StandardAdditions (Q. would a `offset for timezone` command that returns difference between current tz and any other be more useful?); see also NSTimeZone

- naming convention? (`datetime` vs `make datetime` vs `new date` vs `date object`, etc?)

- what about adding optional `using current day/current time/OS X epoch/Unix epoch/classic Mac epoch` parameter to `datetime` for specifying default year/month/date/time (currently default values are hardcoded for OS X epoch)? also, what about optional `for first`, `for second`, etc. parameters for specifying first/second/third/fourth/fifth Monday/Tuesday/Wednesday/../Sunday in a month? 

- worth adding `month names` and `weekday names` accessors that return (copies of) _months and _weekdays? (minor convenience)

- see also NSFormattingContext... constants in NSFormatter.h for fine-tuning capitalization for standalone/start-of-sentence/in-sentence use
     � 	 	�   D a t e L i b   - -   m a k e ,   p a r s e ,   a n d   f o r m a t   d a t e s   a n d   d a t e   s t r i n g s 
 
 C a u t i o n : 
 
 -   A p p l e S c r i p t ' s   d a t e   o b j e c t s   a r e   m u t a b l e ( ! ) ,   s o   a n y   t i m e   a   n e w   d a t e   o b j e c t   i s   n e e d e d ,   e i t h e r   c o n s t r u c t   i t   f r o m   s c r a t c h   u s i n g   A S O C ' s   ` ( N S D a t e ' s   d a t e . . . ( ) )   a s   d a t e ` ,   S t a n d a r d   A d d i t i o n s '   ` c u r r e n t   d a t e `   c o m m a n d ,   o r   ` c o p y   _ d e f a u l t D a t e   t o   n e w D a t e `   a n d   w o r k   o n   t h e   * c o p y * .   N E V E R   u s e ,   m o d i f y ,   o r   r e t u r n   _ d e f a u l t D a t e   ( o r   a n y   o t h e r   r e t a i n e d   d a t e   o b j e c t )   d i r e c t l y ,   a s   a l l o w i n g   a   s h a r e d   m u t a b l e   o b j e c t   t o   e s c a p e   f r o m   t h i s   l i b r a r y   a n d   r u n   l o o s e   a r o u n d   u s e r s '   p r o g r a m s   i s   a   g u a r a n t e e d   r e c i p e   f o r   c h a o s   a n d   d i s a s t e r .   ( I t ' s   b a d   e n o u g h   w h e n   l i s t s   a n d   r e c o r d s   d o   t h i s ,   b u t   d a t e s   d o n ' t   l o o k   l i k e   m u t a b l e   c o l l e c t i o n s   s o   u s e r s   a r e   e v e n   l e s s   l i k e l y   t o   r e a l i z e   t h e y   c o n t a i n   s h a r e a b l e   s t a t e . ) 
 
 T O   D O :   
 
 -   s h o u l d   ` c o n v e r t   r e c o r d   t o   d a t e `   i m p l e m e n t   o p t i o n a l   ` w i t h / w i t h o u t   r o l l o v e r   a l l o w e d `   p a r a m e t e r   t o   d e t e r m i n e   i f   o u t - o f - r a n g e   v a l u e s   s h o u l d   b e   a l l o w e d   t o   r o l l o v e r   o r   n o t   ( d e f a u l t :   e r r o r   i f   r o l l o v e r   d e t e c t e d )   c h e c k   f o r   a n y   o u t - o f - r a n g e   p r o p e r t i e s ,   a s   A S   w i l l   s i l e n t l y   r o l l   o v e r   ( Q .   w h a t   a b o u t   l e a p - s e c o n d s ? )   T B H ,   p r o b a b l y   b e   s i m p l e r   a n d   s a f e r   t o   r a n g e - c h e c k   y e a r + m o n t h + h o u r s + m i n u t e s   ( a l l   t h o s e   r a n g e s   a r e   f i x e d ,   s o   a s   l o n g   a s   t h e   r e c ' s   p r o p e r t i e s   a r e   a n y w h e r e   w i t h i n   t h o s e   r a n g e s   t h e y ' r e   o k ) ,   a n d   c o m p a r i s o n - c h e c k   t h e   d a y   ( a l l o w i n g   s o m e   f l e x i b i l i t y   i n   t h e   e v e n t   t h a t   a   l e a p   s e c o n d   n u d g e s   i t   o v e r   t o   t h e   n e x t   d a y ) ,   a n d   f i n a l l y   c h e c k   t h e   s e c o n d s   i s n ' t   o b v i o u s l y   i n v a l i d   ( e . g .   - 1 , 7 0 ) 
 
 -   s h o u l d   ` c o n v e r t `   h a n d l e r s   i m p l e m e n t   o p t i o n a l   ` u s i n g   [ I S O 8 6 0 1   f o r m a t / R F C 8 2 2   f o r m a t / A p p l e S c r i p t   f o r m a t / e t c ] `   p a r a m e t e r ?   o r   j u s t   s t i c k   t o   I S O 8 6 0 1 ,   a n d   t e l l   u s e r   t o   u s e   F o r m a t L i b   w h e n   w o r k i n g   w i t h   o t h e r   f o r m a t s ?   a l s o ,   ` c o n v e r t   X   t o   Y ` ,   w h i l e   e x p l i c i t ,   i s   t e d i o u s ;   a n y   b e t t e r   n a m i n g ?   ` p a r s e   d a t e ` / ` f o r m a t   d a t e `   a r e   n i c e   a n d   t e r s e ,   i f   m e r g i n g   t h i s   f u n c t i o n a l i t y   i n t o   t h o s e   ( o r   ` c o n v e r t   I S O 8 6 0 1   t o   d a t e ` ,   s i m i l a r   t o   ` c o n v e r t   h e x a d e c i m a l   t o   n u m b e r ` ? )  
 
 -   p u t   a l l   p a r s i n g / f o r m a t t i n g   ( n u m b e r ,   d a t e ,   g e n e r a l )   i n t o   a   s i n g l e   ' F o r m a t L i b ' ? ;   n o t e   t h a t   f o r m a t t i n g   s h o u l d   a c c e p t   e i t h e r   t e m p l a t e   t e x t   o r   c o n s t a n t s   f o r   s t a n d a r d   f o r m a t s   -   ` d e f a u l t `   ( ` l o n g   d a t e t i m e ` ?   i . e .   A p p l e S c r i p t ' s   s t a n d a r d ,   l o c a l i z e d   r e p r e s e n t a t i o n ) ,   ( a l s o   ` l o n g   d a t e ` ,   ` l o n g   t i m e ` ,   ` s h o r t   d a t e ` ,   & ? ) ,   ` I S O 8 6 0 1 `   ( ' Y Y Y Y - M M - D D T H H : M M : S S ' ;   w h a t   a b o u t   c h o i c e   o f   s e p a r a t o r ?   ' T '   o r   s p a c e ?   m a y b e   a l s o   h a v e   ` I S O 8 6 0 1   d a t e   a n d   t i m e `   s o   u s e r   c a n   c h o o s e ?   o r   e v e n   t a k e   a   l i s t   o f   c o n s t a n t s   w h i c h   w i l l   a p p e a r   w h i t e s p a c e - s e p a r a t e d ? ) ,   ` I S O 8 6 0 1   d a t e ` ,   ` I S O 8 6 0 1   t i m e ` ,   e t c .   W i l l   a l s o   n e e d   t o   c o n s i d e r   T Z   h a n d l i n g ;   A S   d a t e s   d o n ' t   h o l d   T Z   i n f o ,   s o   a   s e p a r a t e   o p t i o n a l   T Z   p a r a m e t e r   w o u l d   b e   n e e d e d   f o r   a d j u s t i n g   d a t e s   t o   l o c a l   T Z   w h e n   p a r s i n g / f o r m a t t i n g 
 
 -   w h a t   a b o u t   t i m e z o n e   s u p p o r t ?   ( o b v i o u s l y   t h i s   i s   p r o b l e m a t i c   a s   A S ' s   d a t e   t y p e   a n d   A E M ' s   t y p e L o n g D a t e T i m e   s u p p o r t   c u r r e n t   T Z   o n l y ,   b u t   f o r   g e n e r a l   d a t e   m a n i p u l a t i o n   t a s k s   a   s c r i p t   o b j e c t   w r a p p e r ,   o r   ( p e r h a p s   p r e f e r a b l e   f r o m   u s e r ' s   P O V   s i n c e   i t ' s   t r a n s p a r e n t )   a   { c l a s s : d a t e   w i t h   t i m e z o n e , t i m e : . . . , t i m e z o n e : . . . }   r e c o r d ,   c o u l d   b e   d e f i n e d   t h a t   s t o r e s   a n   a r b i t r a r y   T Z   i n   a d d i t i o n   t o   s t a n d a r d   d a t e   v a l u e ) ;   s e e   a l s o   ` t i m e   t o   G M T `   i n   S t a n d a r d A d d i t i o n s   ( Q .   w o u l d   a   ` o f f s e t   f o r   t i m e z o n e `   c o m m a n d   t h a t   r e t u r n s   d i f f e r e n c e   b e t w e e n   c u r r e n t   t z   a n d   a n y   o t h e r   b e   m o r e   u s e f u l ? ) ;   s e e   a l s o   N S T i m e Z o n e 
 
 -   n a m i n g   c o n v e n t i o n ?   ( ` d a t e t i m e `   v s   ` m a k e   d a t e t i m e `   v s   ` n e w   d a t e `   v s   ` d a t e   o b j e c t ` ,   e t c ? ) 
 
 -   w h a t   a b o u t   a d d i n g   o p t i o n a l   ` u s i n g   c u r r e n t   d a y / c u r r e n t   t i m e / O S   X   e p o c h / U n i x   e p o c h / c l a s s i c   M a c   e p o c h `   p a r a m e t e r   t o   ` d a t e t i m e `   f o r   s p e c i f y i n g   d e f a u l t   y e a r / m o n t h / d a t e / t i m e   ( c u r r e n t l y   d e f a u l t   v a l u e s   a r e   h a r d c o d e d   f o r   O S   X   e p o c h ) ?   a l s o ,   w h a t   a b o u t   o p t i o n a l   ` f o r   f i r s t ` ,   ` f o r   s e c o n d ` ,   e t c .   p a r a m e t e r s   f o r   s p e c i f y i n g   f i r s t / s e c o n d / t h i r d / f o u r t h / f i f t h   M o n d a y / T u e s d a y / W e d n e s d a y / . . / S u n d a y   i n   a   m o n t h ?   
 
 -   w o r t h   a d d i n g   ` m o n t h   n a m e s `   a n d   ` w e e k d a y   n a m e s `   a c c e s s o r s   t h a t   r e t u r n   ( c o p i e s   o f )   _ m o n t h s   a n d   _ w e e k d a y s ?   ( m i n o r   c o n v e n i e n c e ) 
 
 -   s e e   a l s o   N S F o r m a t t i n g C o n t e x t . . .   c o n s t a n t s   i n   N S F o r m a t t e r . h   f o r   f i n e - t u n i n g   c a p i t a l i z a t i o n   f o r   s t a n d a l o n e / s t a r t - o f - s e n t e n c e / i n - s e n t e n c e   u s e 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �        s u p p o r t   ! " ! l     ��������  ��  ��   "  # $ # l      % & ' % j    �� (�� 0 _supportlib _supportLib ( N     ) ) 4    �� *
�� 
scpt * m     + + � , , " L i b r a r y S u p p o r t L i b & "  used for parameter checking    ' � - - 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g $  . / . l     ��������  ��  ��   /  0 1 0 i   ! 2 3 2 I      �� 4���� 
0 _error   4  5 6 5 o      ���� 0 handlername handlerName 6  7 8 7 o      ���� 0 etext eText 8  9 : 9 o      ���� 0 enumber eNumber :  ; < ; o      ���� 0 efrom eFrom <  =�� = o      ���� 
0 eto eTo��  ��   3 n     > ? > I    �� @���� &0 throwcommanderror throwCommandError @  A B A m     C C � D D  D a t e L i b B  E F E o    ���� 0 handlername handlerName F  G H G o    ���� 0 etext eText H  I J I o    	���� 0 enumber eNumber J  K L K o   	 
���� 0 efrom eFrom L  M�� M o   
 ���� 
0 eto eTo��  ��   ? o     ���� 0 _supportlib _supportLib 1  N O N l     ��������  ��  ��   O  P Q P l     ��������  ��  ��   Q  R S R l     ��������  ��  ��   S  T U T i  " % V W V I      �������� $0 _makedefaultdate _makeDefaultDate��  ��   W l    E X Y Z X O     E [ \ [ k    D ] ]  ^ _ ^ r    ) ` a ` J     b b  c d c m    	����� d  e f e m   	 
����  f  g�� g m   
 ���� ��   a J       h h  i j i n      k l k 1    ��
�� 
year l  g     j  m n m n      o p o m    ��
�� 
mnth p  g     n  q�� q n      r s r 1   % '��
�� 
day  s  g   $ %��   _  t u t l  * A v w x v r   * A y z y J   * . { {  | } | m   * +����  }  ~�� ~ m   + ,����  ��   z J          � � � n      � � � m   4 6��
�� 
mnth �  g   3 4 �  ��� � n      � � � 1   = ?��
�� 
time �  g   < =��   w=7 note: month property normally needs set twice as it may have rolled over to next month if date's original `day` property was greater than no. of days in the new month (it doesn't actually matter in this particular case as January always has 31 days, but it's included anyway as a cautionary reminder to others)    x � � �n   n o t e :   m o n t h   p r o p e r t y   n o r m a l l y   n e e d s   s e t   t w i c e   a s   i t   m a y   h a v e   r o l l e d   o v e r   t o   n e x t   m o n t h   i f   d a t e ' s   o r i g i n a l   ` d a y `   p r o p e r t y   w a s   g r e a t e r   t h a n   n o .   o f   d a y s   i n   t h e   n e w   m o n t h   ( i t   d o e s n ' t   a c t u a l l y   m a t t e r   i n   t h i s   p a r t i c u l a r   c a s e   a s   J a n u a r y   a l w a y s   h a s   3 1   d a y s ,   b u t   i t ' s   i n c l u d e d   a n y w a y   a s   a   c a u t i o n a r y   r e m i n d e r   t o   o t h e r s ) u  ��� � L   B D � �  g   B C��   \ l     ����� � I    ������
�� .misccurdldt    ��� null��  ��  ��  ��   Y � � kludge that avoids having to use AppleScript's `date "..."` specifier syntax in this code (which requires the string literal to be written in the host system's localized date format, making the source code non-portable)    Z � � ��   k l u d g e   t h a t   a v o i d s   h a v i n g   t o   u s e   A p p l e S c r i p t ' s   ` d a t e   " . . . " `   s p e c i f i e r   s y n t a x   i n   t h i s   c o d e   ( w h i c h   r e q u i r e s   t h e   s t r i n g   l i t e r a l   t o   b e   w r i t t e n   i n   t h e   h o s t   s y s t e m ' s   l o c a l i z e d   d a t e   f o r m a t ,   m a k i n g   t h e   s o u r c e   c o d e   n o n - p o r t a b l e ) U  � � � l     ��������  ��  ��   �  � � � l      � � � � j   & ,�� ��� 0 _defaultdate _defaultDate � I   & +�������� $0 _makedefaultdate _makeDefaultDate��  ��   � 1 + 1 January 2001, 00:00:00, i.e. Cocoa epoch    � � � � V   1   J a n u a r y   2 0 0 1 ,   0 0 : 0 0 : 0 0 ,   i . e .   C o c o a   e p o c h �  � � � l     ��������  ��  ��   �  � � � j   - L�� ��� 0 _months   � J   - K � �  � � � m   - .��
�� 
jan  �  � � � m   . /��
�� 
feb  �  � � � m   / 0��
�� 
mar  �  � � � m   0 1��
�� 
apr  �  � � � m   1 2��
�� 
may  �  � � � m   2 5��
�� 
jun  �  � � � m   5 8��
�� 
jul  �  � � � m   8 ;��
�� 
aug  �  � � � m   ; >��
�� 
sep  �  � � � m   > A��
�� 
oct  �  � � � m   A D��
�� 
nov  �  ��� � m   D G��
�� 
dec ��   �  � � � j   M g�� ��� 0 	_weekdays   � J   M f � �  � � � m   M P��
�� 
mon  �  � � � m   P S��
�� 
tue  �  � � � m   S V��
�� 
wed  �  � � � m   V Y��
�� 
thu  �  � � � m   Y \��
�� 
fri  �  � � � m   \ _��
�� 
sat  �  ��� � m   _ b��
�� 
sun ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   constants     � � � �    c o n s t a n t s   �  � � � l     ��������  ��  ��   �  � � � i  h k � � � I     ������
�� .Dat:Mthsnull��� ��� null��  ��   � l    	 � � � � L     	 � � n      � � � 2   ��
�� 
cobj � o     ���� 0 _months   � �  shallow copy list before returning it to ensure any changes the user might make to the returned list won't affect the original    � � � � �   s h a l l o w   c o p y   l i s t   b e f o r e   r e t u r n i n g   i t   t o   e n s u r e   a n y   c h a n g e s   t h e   u s e r   m i g h t   m a k e   t o   t h e   r e t u r n e d   l i s t   w o n ' t   a f f e c t   t h e   o r i g i n a l �  � � � l     ��������  ��  ��   �  � � � i  l o � � � I     ������
�� .Dat:Wkdsnull��� ��� null��  ��   � l    	 � � � � L     	 � � n      � � � 2   �
� 
cobj � o     �~�~ 0 	_weekdays   �   ditto    � � � �    d i t t o �  � � � l     �}�|�{�}  �|  �{   �  � � � l     �z�y�x�z  �y  �x   �  � � � l     �w � ��w   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �v � ��v   �   Date creation    � � � �    D a t e   c r e a t i o n �  � � � l     �u � ��u   �[U robust alternatives to `date TEXT` specifier for constructing date objects, (`date dateString` has serious portability and usability problems as it requires a precisely formatted *localized* date string): `datetime` takes a record of numeric year/month/day/etc values; `convert text to date` takes date text in a canonical format (ISO-8601)    � � � ��   r o b u s t   a l t e r n a t i v e s   t o   ` d a t e   T E X T `   s p e c i f i e r   f o r   c o n s t r u c t i n g   d a t e   o b j e c t s ,   ( ` d a t e   d a t e S t r i n g `   h a s   s e r i o u s   p o r t a b i l i t y   a n d   u s a b i l i t y   p r o b l e m s   a s   i t   r e q u i r e s   a   p r e c i s e l y   f o r m a t t e d   * l o c a l i z e d *   d a t e   s t r i n g ) :   ` d a t e t i m e `   t a k e s   a   r e c o r d   o f   n u m e r i c   y e a r / m o n t h / d a y / e t c   v a l u e s ;   ` c o n v e r t   t e x t   t o   d a t e `   t a k e s   d a t e   t e x t   i n   a   c a n o n i c a l   f o r m a t   ( I S O - 8 6 0 1 ) �  � � � l     �t�s�r�t  �s  �r   �    i  p s I      �q�p�o�q 20 _canonicaldateformatter _canonicalDateFormatter�p  �o   k     $  r      n    	
	 I    �n�m�l�n 0 init  �m  �l  
 n     I    �k�j�i�k 	0 alloc  �j  �i   n     o    �h�h "0 nsdateformatter NSDateFormatter m     �g
�g misccura o      �f�f 0 asocformatter asocFormatter  n    I    �e�d�e  0 setdateformat_ setDateFormat_ �c m     � 4 y y y y - M M - d d ' T ' H H : m m : s s Z Z Z Z Z�c  �d   o    �b�b 0 asocformatter asocFormatter  n   ! I    !�a�`�a 0 
setlocale_ 
setLocale_ �_ l   �^�] n    I    �\�[�Z�\ 0 systemlocale systemLocale�[  �Z   n    !  o    �Y�Y 0 nslocale NSLocale! m    �X
�X misccura�^  �]  �_  �`   o    �W�W 0 asocformatter asocFormatter "�V" L   " $## o   " #�U�U 0 asocformatter asocFormatter�V   $%$ l     �T�S�R�T  �S  �R  % &'& l     �Q�P�O�Q  �P  �O  ' ()( l     �N�M�L�N  �M  �L  ) *+* l     �K,-�K  , � � rename `compose date RECORD`/`decompose date DATE`? or `join date` (`build date`?), `split date`? or `new date`, `date properties`?   - �..   r e n a m e   ` c o m p o s e   d a t e   R E C O R D ` / ` d e c o m p o s e   d a t e   D A T E ` ?   o r   ` j o i n   d a t e `   ( ` b u i l d   d a t e ` ? ) ,   ` s p l i t   d a t e ` ?   o r   ` n e w   d a t e ` ,   ` d a t e   p r o p e r t i e s ` ?+ /0/ l     �J�I�H�J  �I  �H  0 121 i  t w343 I     �G5�F
�G .Dat:ReDanull��� ��� reco5 |�E�D6�C7�E  �D  6 o      �B�B  0 dateproperties dateProperties�C  7 l     8�A�@8 J      �?�?  �A  �@  �F  4 Q    9:;9 k   �<< =>= s    ?@? o    �>�> 0 _defaultdate _defaultDate@ o      �=�= 0 newdate newDate> ABA l   *CDEC r    *FGF l   (H�<�;H b    (IJI n   KLK I    �:M�9�: &0 asrecordparameter asRecordParameterM NON o    �8�8  0 dateproperties datePropertiesO P�7P m    QQ �RR  �7  �9  L o    �6�6 0 _supportlib _supportLibJ K    'SS �5TU
�5 
yearT m    �4�4�U �3VW
�3 
mnthV m    �2�2 W �1XY
�1 
day X m    �0�0 Y �/Z[
�/ 
hourZ m    �.�.  [ �-\]
�- 
min \ m     !�,�,  ] �+^_
�+ 
scnd^ m   " #�*�*  _ �)`�(
�) 
time` m   $ %�'
�' 
msng�(  �<  �;  G o      �&�& 0 rec  D @ : use the Cocoa epoch (1 January 2001, 00:00:00) as default   E �aa t   u s e   t h e   C o c o a   e p o c h   ( 1   J a n u a r y   2 0 0 1 ,   0 0 : 0 0 : 0 0 )   a s   d e f a u l tB bcb Q   + Xdefd r   . 7ghg c   . 3iji n  . 1klk 1   / 1�%
�% 
yearl o   . /�$�$ 0 rec  j m   1 2�#
�# 
longh n     mnm 1   4 6�"
�" 
yearn o   3 4�!�! 0 newdate newDatee R      � op
�  .ascrerr ****      � ****o o      �� 0 etext eTextp �q�
� 
errnq d      rr m      ����  f R   ? X�st
� .ascrerr ****      � ****s b   R Wuvu m   R Uww �xx 2 I n v a l i d    y e a r    p r o p e r t y :  v o   U V�� 0 etext eTextt �yz
� 
errny m   A D���Yz �{|
� 
erob{ l  G K}��} N   G K~~ n   G J� 1   H J�
� 
year� o   G H��  0 dateproperties dateProperties�  �  | ���
� 
errt� m   N O�
� 
long�  c ��� Z   Y ������ E  Y d��� o   Y ^�� 0 _months  � J   ^ c�� ��� n  ^ a��� m   _ a�
� 
mnth� o   ^ _�� 0 rec  �  � l  g n���� r   g n��� n  g j��� m   h j�

�
 
mnth� o   g h�	�	 0 rec  � n     ��� m   k m�
� 
mnth� o   j k�� 0 newdate newDate� unlike year/day/time properties, which require numbers, a date object's `month` property accepts either an integer or a month constant; however, it also happily accepts weekday constants which is obviously wrong, so make sure a given constant is a valid month before assigning it   � ���0   u n l i k e   y e a r / d a y / t i m e   p r o p e r t i e s ,   w h i c h   r e q u i r e   n u m b e r s ,   a   d a t e   o b j e c t ' s   ` m o n t h `   p r o p e r t y   a c c e p t s   e i t h e r   a n   i n t e g e r   o r   a   m o n t h   c o n s t a n t ;   h o w e v e r ,   i t   a l s o   h a p p i l y   a c c e p t s   w e e k d a y   c o n s t a n t s   w h i c h   i s   o b v i o u s l y   w r o n g ,   s o   m a k e   s u r e   a   g i v e n   c o n s t a n t   i s   a   v a l i d   m o n t h   b e f o r e   a s s i g n i n g   i t�  � l  q ����� Q   q ����� r   t }��� c   t y��� n  t w��� m   u w�
� 
mnth� o   t u�� 0 rec  � m   w x�
� 
long� n     ��� m   z |�
� 
mnth� o   y z�� 0 newdate newDate� R      ���
� .ascrerr ****      � ****� o      � �  0 etext eText� �����
�� 
errn� d      �� m      �������  � R   � �����
�� .ascrerr ****      � ****� b   � ���� m   � ��� ��� 4 I n v a l i d    m o n t h    p r o p e r t y :  � o   � ����� 0 etext eText� ����
�� 
errn� m   � ������Y� ����
�� 
erob� l  � ������� N   � ��� n   � ���� m   � ���
�� 
mnth� o   � �����  0 dateproperties dateProperties��  ��  � �����
�� 
errt� J   � ��� ��� m   � ���
�� 
enum� ���� m   � ���
�� 
long��  ��  � , & otherwise it must be an integer value   � ��� L   o t h e r w i s e   i t   m u s t   b e   a n   i n t e g e r   v a l u e� ��� Q   � ����� r   � ���� c   � ���� n  � ���� 1   � ���
�� 
day � o   � ����� 0 rec  � m   � ���
�� 
long� n     ��� 1   � ���
�� 
day � o   � ����� 0 newdate newDate� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� �����
�� 
errn� d      �� m      �������  � R   � �����
�� .ascrerr ****      � ****� b   � ���� m   � ��� ��� 0 I n v a l i d    d a y    p r o p e r t y :  � o   � ����� 0 etext eText� ����
�� 
errn� m   � ������Y� ����
�� 
erob� l  � ������� N   � ��� n   � ���� 1   � ���
�� 
day � o   � �����  0 dateproperties dateProperties��  ��  � �����
�� 
errt� m   � ���
�� 
long��  � ��� Z   �1������� F   ���� F   � ���� =   � ���� l  � ������� I  � �����
�� .corecnte****       ****� J   � ��� ���� n  � ���� m   � ���
�� 
mnth� o   � ����� 0 rec  ��  � �����
�� 
kocl� m   � ���
�� 
nmbr��  ��  ��  � m   � �����  � =   � ���� l  � ������� I  � �����
�� .corecnte****       ****� J   � ��� ���� n  � ���� m   � ���
�� 
mnth� o   � ����� 0 rec  ��  � �����
�� 
kocl� m   � ���
�� 
ctxt��  ��  ��  � m   � �����  � H   �
�� E  �	��� o   ����� 0 _months  � J  �� ���� n ��� m  ��
�� 
mnth� o  ���� 0 rec  ��  � l -   R  -��
�� .ascrerr ****      � **** m  ), � p I n v a l i d    m o n t h    p r o p e r t y   ( e x p e c t e d   i n t e g e r   o r   c o n s t a n t ) . ��
�� 
errn m  �����Y ��	

�� 
erob	 l ���� N   n   m  ��
�� 
mnth o  ����  0 dateproperties dateProperties��  ��  
 ����
�� 
errt J   &  m   #��
�� 
enum �� m  #$��
�� 
long��  ��   o i TO DO: revise this: first check for constant and cast if found, then try integer cast and error if fails    � �   T O   D O :   r e v i s e   t h i s :   f i r s t   c h e c k   f o r   c o n s t a n t   a n d   c a s t   i f   f o u n d ,   t h e n   t r y   i n t e g e r   c a s t   a n d   e r r o r   i f   f a i l s��  ��  �  Z  2��� = 27 n 25 1  35��
�� 
time o  23���� 0 rec   m  56��
�� 
msng k  :�   Q  :i!"#! r  =H$%$ [  =F&'& o  =>���� 0 newdate newDate' ]  >E()( l >?*����* 1  >?��
�� 
hour��  ��  ) l ?D+����+ c  ?D,-, n ?B./. 1  @B��
�� 
hour/ o  ?@���� 0 rec  - m  BC��
�� 
long��  ��  % o      ���� 0 newdate newDate" R      ��01
�� .ascrerr ****      � ****0 o      ���� 0 etext eText1 ��2��
�� 
errn2 d      33 m      �������  # R  Pi��45
�� .ascrerr ****      � ****4 b  ch676 m  cf88 �99 4 I n v a l i d    h o u r s    p r o p e r t y :  7 o  fg���� 0 etext eText5 ��:;
�� 
errn: m  RU�����Y; ��<=
�� 
erob< l X\>����> N  X\?? n  X[@A@ 1  Y[��
�� 
hourA o  XY����  0 dateproperties dateProperties��  ��  = ��B��
�� 
errtB m  _`��
�� 
long��    CDC Q  j�EFGE r  mxHIH [  mvJKJ o  mn���� 0 newdate newDateK ]  nuLML l noN����N 1  no��
�� 
min ��  ��  M l otO����O c  otPQP n orRSR 1  pr��
�� 
min S o  op���� 0 rec  Q m  rs��
�� 
long��  ��  I o      ���� 0 newdate newDateF R      ��TU
�� .ascrerr ****      � ****T o      ���� 0 etext eTextU ��V��
�� 
errnV d      WW m      �������  G R  ����XY
�� .ascrerr ****      � ****X b  ��Z[Z m  ��\\ �]] 8 I n v a l i d    m i n u t e s    p r o p e r t y :  [ o  ������ 0 etext eTextY ��^_
�� 
errn^ m  �������Y_ �`a
� 
erob` l ��b�~�}b N  ��cc n  ��ded 1  ���|
�| 
min e o  ���{�{  0 dateproperties dateProperties�~  �}  a �zf�y
�z 
errtf m  ���x
�x 
long�y  D g�wg Q  ��hijh r  ��klk [  ��mnm o  ���v�v 0 newdate newDaten l ��o�u�to c  ��pqp n ��rsr m  ���s
�s 
scnds o  ���r�r 0 rec  q m  ���q
�q 
long�u  �t  l o      �p�p 0 newdate newDatei R      �otu
�o .ascrerr ****      � ****t o      �n�n 0 etext eTextu �mv�l
�m 
errnv d      ww m      �k�k��l  j R  ���jxy
�j .ascrerr ****      � ****x b  ��z{z m  ��|| �}} 8 I n v a l i d    s e c o n d s    p r o p e r t y :  { o  ���i�i 0 etext eTexty �h~
�h 
errn~ m  ���g�g�Y �f��
�f 
erob� l ����e�d� N  ���� n  ����� m  ���c
�c 
scnd� o  ���b�b  0 dateproperties dateProperties�e  �d  � �a��`
�a 
errt� m  ���_
�_ 
long�`  �w  ��   Q  ������ r  ����� c  ����� n ����� 1  ���^
�^ 
time� o  ���]�] 0 rec  � m  ���\
�\ 
long� n     ��� 1  ���[
�[ 
time� o  ���Z�Z 0 newdate newDate� R      �Y��
�Y .ascrerr ****      � ****� o      �X�X 0 etext eText� �W��V
�W 
errn� d      �� m      �U�U��V  � R  ���T��
�T .ascrerr ****      � ****� b  ����� m  ���� ��� 2 I n v a l i d    t i m e    p r o p e r t y :  � o  ���S�S 0 etext eText� �R��
�R 
errn� m  ���Q�Q�Y� �P��
�P 
erob� l ����O�N� N  ���� n  ����� 1  ���M
�M 
time� o  ���L�L  0 dateproperties dateProperties�O  �N  � �K��J
�K 
errt� m  ���I
�I 
long�J   ��H� L  ���� o  ���G�G 0 newdate newDate�H  : R      �F��
�F .ascrerr ****      � ****� o      �E�E 0 etext eText� �D��
�D 
errn� o      �C�C 0 enumber eNumber� �B��
�B 
erob� o      �A�A 0 efrom eFrom� �@��?
�@ 
errt� o      �>�> 
0 eto eTo�?  ; I  �=��<�= 
0 _error  � ��� m  �� ��� , c o n v e r t   r e c o r d   t o   d a t e� ��� o  �;�; 0 etext eText� ��� o  �:�: 0 enumber eNumber� ��� o  	�9�9 0 efrom eFrom� ��8� o  	
�7�7 
0 eto eTo�8  �<  2 ��� l     �6�5�4�6  �5  �4  � ��� l     �3�2�1�3  �2  �1  � ��� i  x {��� I     �0��/
�0 .Dat:DaRenull��� ��� ldt � |�.�-��,��.  �-  � o      �+�+ 0 thedate theDate�,  � l     ��*�)� m      �(
�( 
msng�*  �)  �/  � Q     ^���� k    H�� ��� Z     ���'�� =   ��� o    �&�& 0 thedate theDate� m    �%
�% 
msng� r   	 ��� o   	 �$�$ 0 _defaultdate _defaultDate� o      �#�# 0 thedate theDate�'  � r     ��� n   ��� I    �"��!�" "0 asdateparameter asDateParameter� ��� o    � �  0 thedate theDate� ��� m    �� ���  �  �!  � o    �� 0 _supportlib _supportLib� o      �� 0 thedate theDate� ��� L   ! H�� K   ! G�� ���
� 
year� n  " &��� 1   # %�
� 
year� o   " #�� 0 thedate theDate� ���
� 
mnth� c   ' ,��� n  ' *��� m   ( *�
� 
mnth� o   ' (�� 0 thedate theDate� m   * +�
� 
long� ���
� 
day � n  - 1��� 1   . 0�
� 
day � o   - .�� 0 thedate theDate� ���
� 
hour� _   2 7��� l  2 5���� n  2 5��� 1   3 5�
� 
time� o   2 3�� 0 thedate theDate�  �  � m   5 6��� ���
� 
min � `   8 ?��� _   8 =��� l  8 ;��
�	� n  8 ;��� 1   9 ;�
� 
time� o   8 9�� 0 thedate theDate�
  �	  � m   ; <�� <� m   = >�� <� ���
� 
scnd� `   @ E� � l  @ C�� n  @ C 1   A C� 
�  
time o   @ A���� 0 thedate theDate�  �    m   C D���� <�  �  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��	
�� 
erob o      ���� 0 efrom eFrom	 ��
��
�� 
errt
 o      ���� 
0 eto eTo��  � I   P ^������ 
0 _error    m   Q T � , c o n v e r t   d a t e   t o   r e c o r d  o   T U���� 0 etext eText  o   U V���� 0 enumber eNumber  o   V W���� 0 efrom eFrom �� o   W X���� 
0 eto eTo��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    l     ����    -----    � 
 - - - - -  !  l     ��������  ��  ��  ! "#" l     ��������  ��  ��  # $%$ i  | &'& I     ��(��
�� .Dat:TeDanull���     ctxt( o      ���� 0 thetext theText��  ' Q     G)*+) k    5,, -.- r    /0/ n   121 I    ��3���� "0 astextparameter asTextParameter3 454 o    	���� 0 thetext theText5 6��6 m   	 
77 �88  ��  ��  2 o    ���� 0 _supportlib _supportLib0 o      ���� 0 thetext theText. 9:9 r    ;<; l   =����= n   >?> I    ��@���� "0 datefromstring_ dateFromString_@ A��A o    ���� 0 thetext theText��  ��  ? I    �������� 20 _canonicaldateformatter _canonicalDateFormatter��  ��  ��  ��  < o      ���� 0 thedate theDate: BCB Z   0DE����D =   !FGF o    ���� 0 thedate theDateG m     ��
�� 
msngE R   $ ,��HI
�� .ascrerr ****      � ****H m   * +JJ �KK X I n v a l i d   d a t e   t e x t   ( e x p e c t e d   I S O 8 6 0 1   f o r m a t ) .I ��LM
�� 
errnL m   & '�����YM ��N��
�� 
erobN o   ( )���� 0 thetext theText��  ��  ��  C O��O L   1 5PP c   1 4QRQ o   1 2���� 0 thedate theDateR m   2 3��
�� 
ldt ��  * R      ��ST
�� .ascrerr ****      � ****S o      ���� 0 etext eTextT ��UV
�� 
errnU o      ���� 0 enumber eNumberV ��WX
�� 
erobW o      ���� 0 efrom eFromX ��Y��
�� 
errtY o      ���� 
0 eto eTo��  + I   = G��Z���� 
0 _error  Z [\[ m   > ?]] �^^ ( c o n v e r t   t e x t   t o   d a t e\ _`_ o   ? @���� 0 etext eText` aba o   @ A���� 0 enumber eNumberb cdc o   A B���� 0 efrom eFromd e��e o   B C���� 
0 eto eTo��  ��  % fgf l     ��������  ��  ��  g hih l     ��������  ��  ��  i jkj i  � �lml I     ��n��
�� .Dat:DaTenull���     ldt n o      ���� 0 thedate theDate��  m l    0opqo Q     0rstr k    uu vwv r    xyx n   z{z I    ��|���� "0 asdateparameter asDateParameter| }~} o    	���� 0 thedate theDate~ �� m   	 
�� ���  ��  ��  { o    ���� 0 _supportlib _supportLiby o      ���� 0 thedate theDatew ���� L    �� c    ��� l   ������ n   ��� I    ������� "0 stringfromdate_ stringFromDate_� ���� o    ���� 0 thedate theDate��  ��  � I    �������� 20 _canonicaldateformatter _canonicalDateFormatter��  ��  ��  ��  � m    ��
�� 
ctxt��  s R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  t I   & 0������� 
0 _error  � ��� m   ' (�� ��� ( c o n v e r t   d a t e   t o   t e x t� ��� o   ( )���� 0 etext eText� ��� o   ) *���� 0 enumber eNumber� ��� o   * +���� 0 efrom eFrom� ���� o   + ,���� 
0 eto eTo��  ��  p � � for timezone timezoneNameOrOffset : (missing value) -- TO DO: implement `for timezone` parameter (AS's date type doesn't support TZ data/operations itself, so always uses current locale, but users may want to format date for other locales)   q ����   f o r   t i m e z o n e   t i m e z o n e N a m e O r O f f s e t   :   ( m i s s i n g   v a l u e )   - -   T O   D O :   i m p l e m e n t   ` f o r   t i m e z o n e `   p a r a m e t e r   ( A S ' s   d a t e   t y p e   d o e s n ' t   s u p p o r t   T Z   d a t a / o p e r a t i o n s   i t s e l f ,   s o   a l w a y s   u s e s   c u r r e n t   l o c a l e ,   b u t   u s e r s   m a y   w a n t   t o   f o r m a t   d a t e   f o r   o t h e r   l o c a l e s )k ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       �����������������  � �~�}�|�{�z�y�x�w�v�u�t�s�r�q
�~ 
pimr�} 0 _supportlib _supportLib�| 
0 _error  �{ $0 _makedefaultdate _makeDefaultDate�z 0 _defaultdate _defaultDate�y 0 _months  �x 0 	_weekdays  
�w .Dat:Mthsnull��� ��� null
�v .Dat:Wkdsnull��� ��� null�u 20 _canonicaldateformatter _canonicalDateFormatter
�t .Dat:ReDanull��� ��� reco
�s .Dat:DaRenull��� ��� ldt 
�r .Dat:TeDanull���     ctxt
�q .Dat:DaTenull���     ldt � �p��p �  ��� �o��n
�o 
cobj� ��   �m 
�m 
frmk�n  � �l��k
�l 
cobj� ��   �j
�j 
osax�k  � ��   �i +
�i 
scpt� �h 3�g�f���e�h 
0 _error  �g �d��d �  �c�b�a�`�_�c 0 handlername handlerName�b 0 etext eText�a 0 enumber eNumber�` 0 efrom eFrom�_ 
0 eto eTo�f  � �^�]�\�[�Z�^ 0 handlername handlerName�] 0 etext eText�\ 0 enumber eNumber�[ 0 efrom eFrom�Z 
0 eto eTo�  C�Y�X�Y �X &0 throwcommanderror throwCommandError�e b  ࠡ����+ � �W W�V�U���T�W $0 _makedefaultdate _makeDefaultDate�V  �U  �  � �S�R�Q�P�O�N�M
�S .misccurdldt    ��� null�R�
�Q 
cobj
�P 
year
�O 
mnth
�N 
day 
�M 
time�T F*j   >�kkmvE[�k/*�,FZ[�l/*�,FZ[�m/*�,FZOkjlvE[�k/*�,FZ[�l/*�,FZO*U� ldt     �uy � �L��L �  �K�J�I�H�G�F�E�D�C�B�A�@
�K 
jan 
�J 
feb 
�I 
mar 
�H 
apr 
�G 
may 
�F 
jun 
�E 
jul 
�D 
aug 
�C 
sep 
�B 
oct 
�A 
nov 
�@ 
dec � �?��? �  �>�=�<�;�:�9�8
�> 
mon 
�= 
tue 
�< 
wed 
�; 
thu 
�: 
fri 
�9 
sat 
�8 
sun � �7 ��6�5���4
�7 .Dat:Mthsnull��� ��� null�6  �5  �  � �3
�3 
cobj�4 
b  �-E� �2 ��1�0���/
�2 .Dat:Wkdsnull��� ��� null�1  �0  �  � �.
�. 
cobj�/ 
b  �-E� �-�,�+���*�- 20 _canonicaldateformatter _canonicalDateFormatter�,  �+  � �)�) 0 asocformatter asocFormatter� 	�(�'�&�%�$�#�"�!
�( misccura�' "0 nsdateformatter NSDateFormatter�& 	0 alloc  �% 0 init  �$  0 setdateformat_ setDateFormat_�# 0 nslocale NSLocale�" 0 systemlocale systemLocale�! 0 
setlocale_ 
setLocale_�* %��,j+ j+ E�O��k+ O���,j+ k+ O�� � 4�����
�  .Dat:ReDanull��� ��� reco� {����  0 dateproperties dateProperties�  �  �  � ��������  0 dateproperties dateProperties� 0 newdate newDate� 0 rec  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� &Q���������
�	���������w� ������������8\|�������� &0 asrecordparameter asRecordParameter
� 
year��
� 
mnth
� 
day 
� 
hour
� 
min 
� 
scnd
�
 
time
�	 
msng� 
� 
long� 0 etext eText� ������
�� 
errn���\��  
� 
errn��Y
� 
erob
� 
errt� 
�  
enum
�� 
kocl
�� 
nmbr
�� .corecnte****       ****
�� 
ctxt
�� 
bool� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��b  EQ�Ob  ��l+ ���k�k�j�j�j���%E�O ��,�&��,FW  X  )�a a ��,a �a a �%Ob  ��,kv ��,��,FY 4 ��,�&��,FW %X  )�a a ��,a a �lva a �%O ��,�&��,FW  X  )�a a ��,a �a a �%O��,kva a l j 	 ��,kva a l j a &	 b  ��,kva & !)�a a ��,a a �lva a Y hO��,�  � �Ƣ�,�& E�W  X  )�a a ��,a �a a �%O �Ǣ�,�& E�W  X  )�a a ��,a �a a �%O ���,�&E�W  X  )�a a ��,a �a a  �%Y / ��,�&��,FW  X  )�a a ��,a �a a !�%O�W X  "*a #����a $+ %� �����������
�� .Dat:DaRenull��� ��� ldt �� {�������� 0 thedate theDate��  
�� 
msng��  � ������������ 0 thedate theDate�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ����������������������������������
�� 
msng�� "0 asdateparameter asDateParameter
�� 
year
�� 
mnth
�� 
long
�� 
day 
�� 
hour
�� 
time��
�� 
min �� <
�� 
scnd�� �� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� _ J��  b  E�Y b  ��l+ E�O��,E��,�&��,E��,�"��,�"�#��,�#�W X  *a ����a + � ��'��������
�� .Dat:TeDanull���     ctxt�� 0 thetext theText��  � �������������� 0 thetext theText�� 0 thedate theDate�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� 7����������������J�����]������ "0 astextparameter asTextParameter�� 20 _canonicaldateformatter _canonicalDateFormatter�� "0 datefromstring_ dateFromString_
�� 
msng
�� 
errn���Y
�� 
erob�� 
�� 
ldt �� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� H 7b  ��l+ E�O*j+ �k+ E�O��  )�����Y hO��&W X  *������+ � ��m��������
�� .Dat:DaTenull���     ldt �� 0 thedate theDate��  � ������������ 0 thedate theDate�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� 
������������������� "0 asdateparameter asDateParameter�� 20 _canonicaldateformatter _canonicalDateFormatter�� "0 stringfromdate_ stringFromDate_
�� 
ctxt�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� 1  b  ��l+ E�O*j+ �k+ �&W X  *硢���+ 	 ascr  ��ޭ