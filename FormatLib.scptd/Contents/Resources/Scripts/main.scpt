FasdUAS 1.101.10   ��   ��    k             l      ��  ��    FormatLib -- parse and format AppleScript values

Notes:

- NSNumberFormatters, NSDateFormatters, etc. (like all other ASOC objects) shouldn't be retained in library (or script objects returned by it) as that breaks store script/save/autosave (caveat: if there is a significant performance difference between creating a formatter once and reusing it vs creating it each time, DateFormatterObjects could be returned as an _alternative_ to using `parse date`/`format date` handlers where user really needs the extra speed; however, documentation would need to state clearly that returned object contains ASOC data so can cause autosave, etc. to fail)


TO DO:

- when choosing command names: 

	1. normally use `verb noun` names, except where handler is idempotent and safe and essentially acts as a read-only property, in which case use `noun` name
	
	2. avoid using standard AS verbs as it's difficult for parser and reader to determine how ambiguous names such as `make date` should parse - as a single command, or as a standard `make` command with standard `date` symbol as its direct parameter (`set`/`copy`/`get` may be exceptions to this, as they are language keywords so can be easily distinguished)
	
	3. use at least two white space-separated words to reduce risk of clashing with other keywords/user identifiers

-- not convinced this module is justified: the conversion options for dates and numbers could be folded into those modules' existing `convert...` handlers; the `convert [object] to text` could go into TextLib; the JSON stuff into WebLib (Q. what about Base64 conversion?); another possibility would be to move everything into Parsing and Formatting Text suite in TextLib - maybe best to try an experimental branch, moving `parse/format date/number` commands into date and number libraries; `format text`, `literal representation`, and `available locales` into TextLib, and see how that goes -- BTW, another option is to put 'synonym' commands in DateLib and MathLib that call through to `parse date` and `parse number` without additional arguments (or at least claim to); e.g. `decimal number/text`, `ISO8601 date/text`; might also consider merging `convert record to date` and `convert text to date` into `create date` (which'd eliminate the fuss in DateLib, since `ISO8601 text` and `date properties` commands would then act much like properties)



- add optional parameter to `format number` for specifying decimal places and padding? these are common tasks, so accept e.g. a record containing one or more of: [maximum] decimal places, minimum decimal places, rounding method, minimum integral places

- should `convert text to date/number` in DateLib and NumberLib be folded into `parse date/number` etc as the default behavior when no other is specified? or should parse/format use current locale by default, in which case they need to be kept separate? (another possibility would be to rework as `canonical date/number/text` commands)


- note that `format object` is problematic to implement for some types, as it'll require an AE handler-based implementation to convert some types (e.g. records, references) as ASOC can't convert script objects to NSAppleEventDescriptors, so there's no way to call OSAKit directly (FWIW, writing a script object to temp file via `store script` and reading that into OSALanguage would probably work, but would be slow and humiliatingly hacky); a custom OSAX/event handler wouldn't need to do much: just take a script object (which `format object` would create as a portable wrapper for theData), execute it (the script would just return a value), and get source code (and/or human-readable representation) of the result

- not sure about formatting type class and symbol constants (IIRC, AS only binds application info to reference objects, not type/constant objects, in which case only terms defined in AS's own dictionary will format as keywords and the rest will format using raw chevron syntax unless the appropriate app's terminology is forcibly loaded into AS interpreter at runtime (e.g. using `run script` trickery, or when running scripts in SE)


- what, if any, localization info (via NSLocale) might be relevant/useful to AS users?


- what about NSByteCountFormatter, NSDateComponentsFormatter, NSDateIntervalFormatter, NSEnergyFormatter, NSMassFormatter, NSLengthFormatter, MKDistanceFormatter?

     � 	 	".   F o r m a t L i b   - -   p a r s e   a n d   f o r m a t   A p p l e S c r i p t   v a l u e s 
 
 N o t e s : 
 
 -   N S N u m b e r F o r m a t t e r s ,   N S D a t e F o r m a t t e r s ,   e t c .   ( l i k e   a l l   o t h e r   A S O C   o b j e c t s )   s h o u l d n ' t   b e   r e t a i n e d   i n   l i b r a r y   ( o r   s c r i p t   o b j e c t s   r e t u r n e d   b y   i t )   a s   t h a t   b r e a k s   s t o r e   s c r i p t / s a v e / a u t o s a v e   ( c a v e a t :   i f   t h e r e   i s   a   s i g n i f i c a n t   p e r f o r m a n c e   d i f f e r e n c e   b e t w e e n   c r e a t i n g   a   f o r m a t t e r   o n c e   a n d   r e u s i n g   i t   v s   c r e a t i n g   i t   e a c h   t i m e ,   D a t e F o r m a t t e r O b j e c t s   c o u l d   b e   r e t u r n e d   a s   a n   _ a l t e r n a t i v e _   t o   u s i n g   ` p a r s e   d a t e ` / ` f o r m a t   d a t e `   h a n d l e r s   w h e r e   u s e r   r e a l l y   n e e d s   t h e   e x t r a   s p e e d ;   h o w e v e r ,   d o c u m e n t a t i o n   w o u l d   n e e d   t o   s t a t e   c l e a r l y   t h a t   r e t u r n e d   o b j e c t   c o n t a i n s   A S O C   d a t a   s o   c a n   c a u s e   a u t o s a v e ,   e t c .   t o   f a i l ) 
 
 
 T O   D O : 
 
 -   w h e n   c h o o s i n g   c o m m a n d   n a m e s :   
 
 	 1 .   n o r m a l l y   u s e   ` v e r b   n o u n `   n a m e s ,   e x c e p t   w h e r e   h a n d l e r   i s   i d e m p o t e n t   a n d   s a f e   a n d   e s s e n t i a l l y   a c t s   a s   a   r e a d - o n l y   p r o p e r t y ,   i n   w h i c h   c a s e   u s e   ` n o u n `   n a m e 
 	 
 	 2 .   a v o i d   u s i n g   s t a n d a r d   A S   v e r b s   a s   i t ' s   d i f f i c u l t   f o r   p a r s e r   a n d   r e a d e r   t o   d e t e r m i n e   h o w   a m b i g u o u s   n a m e s   s u c h   a s   ` m a k e   d a t e `   s h o u l d   p a r s e   -   a s   a   s i n g l e   c o m m a n d ,   o r   a s   a   s t a n d a r d   ` m a k e `   c o m m a n d   w i t h   s t a n d a r d   ` d a t e `   s y m b o l   a s   i t s   d i r e c t   p a r a m e t e r   ( ` s e t ` / ` c o p y ` / ` g e t `   m a y   b e   e x c e p t i o n s   t o   t h i s ,   a s   t h e y   a r e   l a n g u a g e   k e y w o r d s   s o   c a n   b e   e a s i l y   d i s t i n g u i s h e d ) 
 	 
 	 3 .   u s e   a t   l e a s t   t w o   w h i t e   s p a c e - s e p a r a t e d   w o r d s   t o   r e d u c e   r i s k   o f   c l a s h i n g   w i t h   o t h e r   k e y w o r d s / u s e r   i d e n t i f i e r s 
 
 - -   n o t   c o n v i n c e d   t h i s   m o d u l e   i s   j u s t i f i e d :   t h e   c o n v e r s i o n   o p t i o n s   f o r   d a t e s   a n d   n u m b e r s   c o u l d   b e   f o l d e d   i n t o   t h o s e   m o d u l e s '   e x i s t i n g   ` c o n v e r t . . . `   h a n d l e r s ;   t h e   ` c o n v e r t   [ o b j e c t ]   t o   t e x t `   c o u l d   g o   i n t o   T e x t L i b ;   t h e   J S O N   s t u f f   i n t o   W e b L i b   ( Q .   w h a t   a b o u t   B a s e 6 4   c o n v e r s i o n ? ) ;   a n o t h e r   p o s s i b i l i t y   w o u l d   b e   t o   m o v e   e v e r y t h i n g   i n t o   P a r s i n g   a n d   F o r m a t t i n g   T e x t   s u i t e   i n   T e x t L i b   -   m a y b e   b e s t   t o   t r y   a n   e x p e r i m e n t a l   b r a n c h ,   m o v i n g   ` p a r s e / f o r m a t   d a t e / n u m b e r `   c o m m a n d s   i n t o   d a t e   a n d   n u m b e r   l i b r a r i e s ;   ` f o r m a t   t e x t ` ,   ` l i t e r a l   r e p r e s e n t a t i o n ` ,   a n d   ` a v a i l a b l e   l o c a l e s `   i n t o   T e x t L i b ,   a n d   s e e   h o w   t h a t   g o e s   - -   B T W ,   a n o t h e r   o p t i o n   i s   t o   p u t   ' s y n o n y m '   c o m m a n d s   i n   D a t e L i b   a n d   M a t h L i b   t h a t   c a l l   t h r o u g h   t o   ` p a r s e   d a t e `   a n d   ` p a r s e   n u m b e r `   w i t h o u t   a d d i t i o n a l   a r g u m e n t s   ( o r   a t   l e a s t   c l a i m   t o ) ;   e . g .   ` d e c i m a l   n u m b e r / t e x t ` ,   ` I S O 8 6 0 1   d a t e / t e x t ` ;   m i g h t   a l s o   c o n s i d e r   m e r g i n g   ` c o n v e r t   r e c o r d   t o   d a t e `   a n d   ` c o n v e r t   t e x t   t o   d a t e `   i n t o   ` c r e a t e   d a t e `   ( w h i c h ' d   e l i m i n a t e   t h e   f u s s   i n   D a t e L i b ,   s i n c e   ` I S O 8 6 0 1   t e x t `   a n d   ` d a t e   p r o p e r t i e s `   c o m m a n d s   w o u l d   t h e n   a c t   m u c h   l i k e   p r o p e r t i e s ) 
 
 
 
 -   a d d   o p t i o n a l   p a r a m e t e r   t o   ` f o r m a t   n u m b e r `   f o r   s p e c i f y i n g   d e c i m a l   p l a c e s   a n d   p a d d i n g ?   t h e s e   a r e   c o m m o n   t a s k s ,   s o   a c c e p t   e . g .   a   r e c o r d   c o n t a i n i n g   o n e   o r   m o r e   o f :   [ m a x i m u m ]   d e c i m a l   p l a c e s ,   m i n i m u m   d e c i m a l   p l a c e s ,   r o u n d i n g   m e t h o d ,   m i n i m u m   i n t e g r a l   p l a c e s 
 
 -   s h o u l d   ` c o n v e r t   t e x t   t o   d a t e / n u m b e r `   i n   D a t e L i b   a n d   N u m b e r L i b   b e   f o l d e d   i n t o   ` p a r s e   d a t e / n u m b e r `   e t c   a s   t h e   d e f a u l t   b e h a v i o r   w h e n   n o   o t h e r   i s   s p e c i f i e d ?   o r   s h o u l d   p a r s e / f o r m a t   u s e   c u r r e n t   l o c a l e   b y   d e f a u l t ,   i n   w h i c h   c a s e   t h e y   n e e d   t o   b e   k e p t   s e p a r a t e ?   ( a n o t h e r   p o s s i b i l i t y   w o u l d   b e   t o   r e w o r k   a s   ` c a n o n i c a l   d a t e / n u m b e r / t e x t `   c o m m a n d s ) 
 
 
 -   n o t e   t h a t   ` f o r m a t   o b j e c t `   i s   p r o b l e m a t i c   t o   i m p l e m e n t   f o r   s o m e   t y p e s ,   a s   i t ' l l   r e q u i r e   a n   A E   h a n d l e r - b a s e d   i m p l e m e n t a t i o n   t o   c o n v e r t   s o m e   t y p e s   ( e . g .   r e c o r d s ,   r e f e r e n c e s )   a s   A S O C   c a n ' t   c o n v e r t   s c r i p t   o b j e c t s   t o   N S A p p l e E v e n t D e s c r i p t o r s ,   s o   t h e r e ' s   n o   w a y   t o   c a l l   O S A K i t   d i r e c t l y   ( F W I W ,   w r i t i n g   a   s c r i p t   o b j e c t   t o   t e m p   f i l e   v i a   ` s t o r e   s c r i p t `   a n d   r e a d i n g   t h a t   i n t o   O S A L a n g u a g e   w o u l d   p r o b a b l y   w o r k ,   b u t   w o u l d   b e   s l o w   a n d   h u m i l i a t i n g l y   h a c k y ) ;   a   c u s t o m   O S A X / e v e n t   h a n d l e r   w o u l d n ' t   n e e d   t o   d o   m u c h :   j u s t   t a k e   a   s c r i p t   o b j e c t   ( w h i c h   ` f o r m a t   o b j e c t `   w o u l d   c r e a t e   a s   a   p o r t a b l e   w r a p p e r   f o r   t h e D a t a ) ,   e x e c u t e   i t   ( t h e   s c r i p t   w o u l d   j u s t   r e t u r n   a   v a l u e ) ,   a n d   g e t   s o u r c e   c o d e   ( a n d / o r   h u m a n - r e a d a b l e   r e p r e s e n t a t i o n )   o f   t h e   r e s u l t 
 
 -   n o t   s u r e   a b o u t   f o r m a t t i n g   t y p e   c l a s s   a n d   s y m b o l   c o n s t a n t s   ( I I R C ,   A S   o n l y   b i n d s   a p p l i c a t i o n   i n f o   t o   r e f e r e n c e   o b j e c t s ,   n o t   t y p e / c o n s t a n t   o b j e c t s ,   i n   w h i c h   c a s e   o n l y   t e r m s   d e f i n e d   i n   A S ' s   o w n   d i c t i o n a r y   w i l l   f o r m a t   a s   k e y w o r d s   a n d   t h e   r e s t   w i l l   f o r m a t   u s i n g   r a w   c h e v r o n   s y n t a x   u n l e s s   t h e   a p p r o p r i a t e   a p p ' s   t e r m i n o l o g y   i s   f o r c i b l y   l o a d e d   i n t o   A S   i n t e r p r e t e r   a t   r u n t i m e   ( e . g .   u s i n g   ` r u n   s c r i p t `   t r i c k e r y ,   o r   w h e n   r u n n i n g   s c r i p t s   i n   S E ) 
 
 
 -   w h a t ,   i f   a n y ,   l o c a l i z a t i o n   i n f o   ( v i a   N S L o c a l e )   m i g h t   b e   r e l e v a n t / u s e f u l   t o   A S   u s e r s ? 
 
 
 -   w h a t   a b o u t   N S B y t e C o u n t F o r m a t t e r ,   N S D a t e C o m p o n e n t s F o r m a t t e r ,   N S D a t e I n t e r v a l F o r m a t t e r ,   N S E n e r g y F o r m a t t e r ,   N S M a s s F o r m a t t e r ,   N S L e n g t h F o r m a t t e r ,   M K D i s t a n c e F o r m a t t e r ? 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �      s u p p o r t     !   l     ��������  ��  ��   !  " # " l      $ % & $ j    �� '�� 0 _supportlib _supportLib ' N     ( ( 4    �� )
�� 
scpt ) m     * * � + + " L i b r a r y S u p p o r t L i b % "  used for parameter checking    & � , , 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g #  - . - l     ��������  ��  ��   .  / 0 / l     ��������  ��  ��   0  1 2 1 i    3 4 3 I      �� 5���� 
0 _error   5  6 7 6 o      ���� 0 handlername handlerName 7  8 9 8 o      ���� 0 etext eText 9  : ; : o      ���� 0 enumber eNumber ;  < = < o      ���� 0 efrom eFrom =  >�� > o      ���� 
0 eto eTo��  ��   4 n     ? @ ? I    �� A���� &0 throwcommanderror throwCommandError A  B C B m     D D � E E  F o r m a t L i b C  F G F o    ���� 0 handlername handlerName G  H I H o    ���� 0 etext eText I  J K J o    	���� 0 enumber eNumber K  L M L o   	 
���� 0 efrom eFrom M  N�� N o   
 ���� 
0 eto eTo��  ��   @ o     ���� 0 _supportlib _supportLib 2  O P O l     ��������  ��  ��   P  Q R Q l     ��������  ��  ��   R  S T S l     �� U V��   U J D--------------------------------------------------------------------    V � W W � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - T  X Y X l     �� Z [��   Z�� locale support -- TO DO: what other functionality should be exposed to user? if there's much more, consider moving to its own library (UtilitiesLib?); bear in mind that NSLocale instances and other Cocoa objects generally shouldn't be returned to user as ASOC objects cause problems for autosave, script persistence, etc; instead, use localeIdentifier strings and convert to/from NSLocale at point of use    [ � \ \*   l o c a l e   s u p p o r t   - -   T O   D O :   w h a t   o t h e r   f u n c t i o n a l i t y   s h o u l d   b e   e x p o s e d   t o   u s e r ?   i f   t h e r e ' s   m u c h   m o r e ,   c o n s i d e r   m o v i n g   t o   i t s   o w n   l i b r a r y   ( U t i l i t i e s L i b ? ) ;   b e a r   i n   m i n d   t h a t   N S L o c a l e   i n s t a n c e s   a n d   o t h e r   C o c o a   o b j e c t s   g e n e r a l l y   s h o u l d n ' t   b e   r e t u r n e d   t o   u s e r   a s   A S O C   o b j e c t s   c a u s e   p r o b l e m s   f o r   a u t o s a v e ,   s c r i p t   p e r s i s t e n c e ,   e t c ;   i n s t e a d ,   u s e   l o c a l e I d e n t i f i e r   s t r i n g s   a n d   c o n v e r t   t o / f r o m   N S L o c a l e   a t   p o i n t   o f   u s e Y  ] ^ ] l     ��������  ��  ��   ^  _ ` _ i    a b a I     ������
�� .Fmt:LLocnull��� ��� null��  ��   b l     c d e c L      f f c      g h g l     i���� i n     j k j I    �� l���� 60 sortedarrayusingselector_ sortedArrayUsingSelector_ l  m�� m m     n n � o o  c o m p a r e :��  ��   k n     p q p I    �������� 80 availablelocaleidentifiers availableLocaleIdentifiers��  ��   q n     r s r o    ���� 0 nslocale NSLocale s m     ��
�� misccura��  ��   h m    ��
�� 
list d , &> {"af", "af_NA", "af_ZA", "agq", ...}    e � t t L >   { " a f " ,   " a f _ N A " ,   " a f _ Z A " ,   " a g q " ,   . . . } `  u v u l     ��������  ��  ��   v  w x w i    y z y I     ������
�� .Fmt:CLocnull��� ��� null��  ��   z L      { { c      | } | l     ~���� ~ n      �  I    �������� $0 localeidentifier localeIdentifier��  ��   � n     � � � I    �������� 0 currentlocale currentLocale��  ��   � n     � � � o    ���� 0 nslocale NSLocale � m     ��
�� misccura��  ��   } m    ��
�� 
ctxt x  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   numbers    � � � �    n u m b e r s �  � � � l     ��������  ��  ��   �  � � � i   ! � � � I      �� ����� ,0 _makenumberformatter _makeNumberFormatter �  � � � o      ���� 0 formatstyle formatStyle �  ��� � o      ���� 0 
localecode 
localeCode��  ��   � k     � � �  � � � r      � � � n     � � � I    �������� 0 init  ��  ��   � n     � � � I    �������� 	0 alloc  ��  ��   � n     � � � o    ���� &0 nsnumberformatter NSNumberFormatter � m     ��
�� misccura � o      ���� 0 asocformatter asocFormatter �  � � � Z    � � � � � � =    � � � o    ���� 0 formatstyle formatStyle � m    ��
�� FNStFNS0 � l    � � � � n    � � � I    �� ����� "0 setnumberstyle_ setNumberStyle_ �  ��� � l    ����� � n    � � � o    ���� 40 nsnumberformatternostyle NSNumberFormatterNoStyle � m    ��
�� misccura��  ��  ��  ��   � o    ���� 0 asocformatter asocFormatter � � � TO DO: why does NSNumberFormatterNoStyle omit decimal places? address that, or seriously consider using NSNumberFormatterScientificStyle, or some combination of that and NSNumberFormatterDecimalStyle (minus thousands separators) as default    � � � ��   T O   D O :   w h y   d o e s   N S N u m b e r F o r m a t t e r N o S t y l e   o m i t   d e c i m a l   p l a c e s ?   a d d r e s s   t h a t ,   o r   s e r i o u s l y   c o n s i d e r   u s i n g   N S N u m b e r F o r m a t t e r S c i e n t i f i c S t y l e ,   o r   s o m e   c o m b i n a t i o n   o f   t h a t   a n d   N S N u m b e r F o r m a t t e r D e c i m a l S t y l e   ( m i n u s   t h o u s a n d s   s e p a r a t o r s )   a s   d e f a u l t �  � � � =   " � � � o     ���� 0 formatstyle formatStyle � m     !��
�� FNStFNS1 �  � � � l  % - � � � � n  % - � � � I   & -�� ����� "0 setnumberstyle_ setNumberStyle_ �  ��� � l  & ) ����� � n  & ) � � � o   ' )�� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle � m   & '�~
�~ misccura��  ��  ��  ��   � o   % &�}�} 0 asocformatter asocFormatter � - ' uses thousands separators, no exponent    � � � � N   u s e s   t h o u s a n d s   s e p a r a t o r s ,   n o   e x p o n e n t �  � � � =  0 3 � � � o   0 1�|�| 0 formatstyle formatStyle � m   1 2�{
�{ FNStFNS2 �  � � � l  6 > � � � � n  6 > � � � I   7 >�z ��y�z "0 setnumberstyle_ setNumberStyle_ �  ��x � l  7 : ��w�v � n  7 : � � � o   8 :�u�u @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle � m   7 8�t
�t misccura�w  �v  �x  �y   � o   6 7�s�s 0 asocformatter asocFormatter �   adds currency symbol    � � � � *   a d d s   c u r r e n c y   s y m b o l �  � � � =  A D � � � o   A B�r�r 0 formatstyle formatStyle � m   B C�q
�q FNStFNS3 �  � � � l  G O � � � � n  G O � � � I   H O�p ��o�p "0 setnumberstyle_ setNumberStyle_ �  ��n � l  H K ��m�l � n  H K � � � o   I K�k�k >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle � m   H I�j
�j misccura�m  �l  �n  �o   � o   G H�i�i 0 asocformatter asocFormatter � ( " multiplies by 100 and appends '%'    � � � � D   m u l t i p l i e s   b y   1 0 0   a n d   a p p e n d s   ' % ' �  � � � =  R U � � � o   R S�h�h 0 formatstyle formatStyle � m   S T�g
�g FNStFNS4 �  � � � l  X ` � � � � n  X ` � � � I   Y `�f ��e�f "0 setnumberstyle_ setNumberStyle_ �  ��d � l  Y \ ��c�b � n  Y \ � � � o   Z \�a�a D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle � m   Y Z�`
�` misccura�c  �b  �d  �e   � o   X Y�_�_ 0 asocformatter asocFormatter �   uses exponent notation    � � � � .   u s e s   e x p o n e n t   n o t a t i o n �  �  � =  c f o   c d�^�^ 0 formatstyle formatStyle m   d e�]
�] FNStFNS5  �\ l  i s n  i s I   j s�[	�Z�[ "0 setnumberstyle_ setNumberStyle_	 
�Y
 l  j o�X�W n  j o o   k o�V�V @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle m   j k�U
�U misccura�X  �W  �Y  �Z   o   i j�T�T 0 asocformatter asocFormatter   uses words    �    u s e s   w o r d s�\   � R   v ��S
�S .ascrerr ****      � **** m   � � � b I n v a l i d    i n    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) . �R
�R 
errn m   z }�Q�Q�Y �P
�P 
erob o   � ��O�O 0 formatstyle formatStyle �N�M
�N 
errt m   � ��L
�L 
enum�M   �  n  � � I   � ��K�J�K 0 
setlocale_ 
setLocale_ �I l  � ��H�G n  � �  I   � ��F!�E�F &0 aslocaleparameter asLocaleParameter! "#" o   � ��D�D 0 
localecode 
localeCode# $�C$ m   � �%% �&&  f o r   l o c a l e�C  �E    o   � ��B�B 0 _supportlib _supportLib�H  �G  �I  �J   o   � ��A�A 0 asocformatter asocFormatter '�@' L   � �(( o   � ��?�? 0 asocformatter asocFormatter�@   � )*) l     �>�=�<�>  �=  �<  * +,+ l     �;�:�9�;  �:  �9  , -.- l     �8�7�6�8  �7  �6  . /0/ i  " %121 I     �534
�5 .Fmt:FNumnull���     nmbr3 o      �4�4 0 	thenumber 	theNumber4 �356
�3 
Usin5 |�2�17�08�2  �1  7 o      �/�/ 0 formatstyle formatStyle�0  8 l     9�.�-9 m      �,
�, FNStFNS0�.  �-  6 �+:�*
�+ 
Loca: |�)�(;�'<�)  �(  ; o      �&�& 0 
localecode 
localeCode�'  < l     =�%�$= m      �#
�# 
msng�%  �$  �*  2 l    M>?@> k     MAA BCB l      �"DE�"  Dzt -setRoundingMode:
		NSNumberFormatterRoundCeiling
		NSNumberFormatterRoundFloor
		NSNumberFormatterRoundDown -- toward zero
		NSNumberFormatterRoundUp -- away from zero (aka `as taught in school`)
		NSNumberFormatterRoundHalfEven
		NSNumberFormatterRoundHalfDown -- note that `round number` currently doesn't support half-down and half-up
		NSNumberFormatterRoundHalfUp
	   E �FF�   - s e t R o u n d i n g M o d e : 
 	 	 N S N u m b e r F o r m a t t e r R o u n d C e i l i n g 
 	 	 N S N u m b e r F o r m a t t e r R o u n d F l o o r 
 	 	 N S N u m b e r F o r m a t t e r R o u n d D o w n   - -   t o w a r d   z e r o 
 	 	 N S N u m b e r F o r m a t t e r R o u n d U p   - -   a w a y   f r o m   z e r o   ( a k a   ` a s   t a u g h t   i n   s c h o o l ` ) 
 	 	 N S N u m b e r F o r m a t t e r R o u n d H a l f E v e n 
 	 	 N S N u m b e r F o r m a t t e r R o u n d H a l f D o w n   - -   n o t e   t h a t   ` r o u n d   n u m b e r `   c u r r e n t l y   d o e s n ' t   s u p p o r t   h a l f - d o w n   a n d   h a l f - u p 
 	 	 N S N u m b e r F o r m a t t e r R o u n d H a l f U p 
 	C G�!G Q     MHIJH k    ;KK LML r    NON n   PQP I    � R��  &0 asnumberparameter asNumberParameterR STS o    	�� 0 	thenumber 	theNumberT U�U m   	 
VV �WW  �  �  Q o    �� 0 _supportlib _supportLibO o      �� 0 	thenumber 	theNumberM XYX r    Z[Z I    �\�� ,0 _makenumberformatter _makeNumberFormatter\ ]^] o    �� 0 formatstyle formatStyle^ _�_ o    �� 0 
localecode 
localeCode�  �  [ o      �� 0 asocformatter asocFormatterY `a` r    #bcb n   !ded I    !�f�� &0 stringfromnumber_ stringFromNumber_f g�g o    �� 0 	thenumber 	theNumber�  �  e o    �� 0 asocformatter asocFormatterc o      �� 0 
asocstring 
asocStringa hih l  $ 6jklj Z  $ 6mn��m =  $ 'opo o   $ %�� 0 
asocstring 
asocStringp m   % &�
� 
msngn R   * 2�
qr
�
 .ascrerr ****      � ****q m   0 1ss �tt $ A n   e r r o r   o c c u r r e d .r �	uv
�	 
errnu m   , -���Yv �w�
� 
erobw o   . /�� 0 	thenumber 	theNumber�  �  �  k n h shouldn't fail, but -stringFromNumber:'s return type isn't declared as non-nullable so check to be sure   l �xx �   s h o u l d n ' t   f a i l ,   b u t   - s t r i n g F r o m N u m b e r : ' s   r e t u r n   t y p e   i s n ' t   d e c l a r e d   a s   n o n - n u l l a b l e   s o   c h e c k   t o   b e   s u r ei y�y L   7 ;zz c   7 :{|{ o   7 8�� 0 
asocstring 
asocString| m   8 9�
� 
ctxt�  I R      �}~
� .ascrerr ****      � ****} o      � �  0 etext eText~ ���
�� 
errn o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  J I   C M������� 
0 _error  � ��� m   D E�� ���  f o r m a t   n u m b e r� ��� o   E F���� 0 etext eText� ��� o   F G���� 0 enumber eNumber� ��� o   G H���� 0 efrom eFrom� ���� o   H I���� 
0 eto eTo��  ��  �!  ? E ? TO DO: optional param for specifying places, padding, rounding   @ ��� ~   T O   D O :   o p t i o n a l   p a r a m   f o r   s p e c i f y i n g   p l a c e s ,   p a d d i n g ,   r o u n d i n g0 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  & )��� I     ����
�� .Fmt:PNumnull���     ctxt� o      ���� 0 thetext theText� ����
�� 
Usin� |����������  ��  � o      ���� 0 formatstyle formatStyle��  � l     ������ m      ��
�� FNStFNS0��  ��  � �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q     ����� k    ��� ��� r    ��� n   ��� I    ������� &0 stringwithstring_ stringWithString_� ���� l   ������ n   ��� I    ������� "0 astextparameter asTextParameter� ��� o    ���� 0 thetext theText� ���� m    �� ���  ��  ��  � o    ���� 0 _supportlib _supportLib��  ��  ��  ��  � n   ��� o    ���� 0 nsstring NSString� m    ��
�� misccura� o      ���� 0 asoctext asocText� ��� r    !��� I    ������� ,0 _makenumberformatter _makeNumberFormatter� ��� o    ���� 0 formatstyle formatStyle� ���� o    ���� 0 
localecode 
localeCode��  ��  � o      ���� 0 asocformatter asocFormatter� ��� r   " *��� n  " (��� I   # (������� &0 numberfromstring_ numberFromString_� ���� o   # $���� 0 thetext theText��  ��  � o   " #���� 0 asocformatter asocFormatter� o      ���� 0 
asocnumber 
asocNumber� ��� Z   + �������� =  + .��� o   + ,���� 0 
asocnumber 
asocNumber� m   , -��
�� 
msng� k   1 ��� ��� Z   1 ������ =  1 4��� o   1 2���� 0 formatstyle formatStyle� m   2 3��
�� FNStFNS0� r   7 :��� m   7 8�� ��� 
 p l a i n� o      ���� 0 
formatname 
formatName� ��� =  = @��� o   = >���� 0 formatstyle formatStyle� m   > ?��
�� FNStFNS1� ��� r   C F��� m   C D�� ���  d e c i m a l� o      ���� 0 
formatname 
formatName� ��� =  I L��� o   I J���� 0 formatstyle formatStyle� m   J K��
�� FNStFNS2� ��� r   O R��� m   O P�� ���  c u r r e n c y� o      ���� 0 
formatname 
formatName� ��� =  U X��� o   U V���� 0 formatstyle formatStyle� m   V W��
�� FNStFNS3� ��� r   [ ^��� m   [ \�� ���  p e r c e n t� o      ���� 0 
formatname 
formatName� ��� =  a f��� o   a b���� 0 formatstyle formatStyle� m   b e��
�� FNStFNS4�    r   i n m   i l �  s c i e n t i f i c o      ���� 0 
formatname 
formatName  =  q v	 o   q r���� 0 formatstyle formatStyle	 m   r u��
�� FNStFNS5 
��
 r   y ~ m   y | �  w o r d o      ���� 0 
formatname 
formatName��  � r   � � b   � � b   � � m   � � �   o   � ����� 0 formatstyle formatStyle m   � � �   o      ���� 0 
formatname 
formatName�  r   � � c   � � n  � �  I   � ��������� $0 localeidentifier localeIdentifier��  ��    n  � �!"! I   � ��������� 
0 locale  ��  ��  " o   � ����� 0 asocformatter asocFormatter m   � ���
�� 
ctxt o      ���� $0 localeidentifier localeIdentifier #$# Z   � �%&��'% =   � �()( n  � �*+* 1   � ���
�� 
leng+ o   � ����� $0 localeidentifier localeIdentifier) m   � �����  & r   � �,-, m   � �.. �//  s t a n d a r d- o      ���� $0 localeidentifier localeIdentifier��  ' r   � �010 b   � �232 b   � �454 m   � �66 �77  5 o   � ����� $0 localeidentifier localeIdentifier3 m   � �88 �99  1 o      ���� $0 localeidentifier localeIdentifier$ :��: R   � ���;<
�� .ascrerr ****      � ****; l  � �=����= b   � �>?> b   � �@A@ b   � �BCB b   � �DED m   � �FF �GG \ T e x t   i s   n o t   i n   t h e   c o r r e c t   f o r m a t   ( e x p e c t e d   a  E o   � ����� 0 
formatname 
formatNameC m   � �HH �II 4 - f o r m a t t e d   n u m b e r   f o r   t h e  A o   � ����� $0 localeidentifier localeIdentifier? m   � �JJ �KK    l o c a l e ) .��  ��  < ��LM
�� 
errnL m   � ������YM ��N��
�� 
erobN o   � ����� 0 thetext theText��  ��  ��  ��  � OPO l  � ���������  ��  ��  P Q��Q L   � �RR c   � �STS o   � ����� 0 
asocnumber 
asocNumberT m   � ���
�� 
****��  � R      ��UV
�� .ascrerr ****      � ****U o      ���� 0 etext eTextV ��WX
�� 
errnW o      ���� 0 enumber eNumberX ��YZ
�� 
erobY o      ���� 0 efrom eFromZ �[�~
� 
errt[ o      �}�} 
0 eto eTo�~  � I   � ��|\�{�| 
0 _error  \ ]^] m   � �__ �``  p a r s e   n u m b e r^ aba o   � ��z�z 0 etext eTextb cdc o   � ��y�y 0 enumber eNumberd efe o   � ��x�x 0 efrom eFromf g�wg o   � ��v�v 
0 eto eTo�w  �{  � hih l     �u�t�s�u  �t  �s  i jkj l     �r�q�p�r  �q  �p  k lml l     �ono�o  n J D--------------------------------------------------------------------   o �pp � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -m qrq l     �nst�n  s   dates   t �uu    d a t e sr vwv l     �m�l�k�m  �l  �k  w xyx l     �jz{�j  z D > TO DO: defaults? ISO8601? (confirm locale never affects this)   { �|| |   T O   D O :   d e f a u l t s ?   I S O 8 6 0 1 ?   ( c o n f i r m   l o c a l e   n e v e r   a f f e c t s   t h i s )y }~} l     �i�h�g�i  �h  �g  ~ � i  * -��� I      �f��e�f 0 
_datestyle 
_dateStyle� ��� o      �d�d 0 	theformat 	theFormat� ��c� o      �b�b 0 formatstyles formatStyles�c  �e  � k     ��� ��� X     u��a�� k   I p�� ��� r   I `��� o   I J�`�` 0 aref aRef� J      �� ��� o      �_�_ 0 
formattype 
formatType� ��� o      �^�^ 0 isdate isDate� ��]� o      �\�\ 0 
asocoption 
asocOption�]  � ��[� Z  a p���Z�Y� =  a d��� o   a b�X�X 0 	theformat 	theFormat� o   b c�W�W 0 
formattype 
formatType� L   g l�� J   g k�� ��� o   g h�V�V 0 isdate isDate� ��U� o   h i�T�T 0 
asocoption 
asocOption�U  �Z  �Y  �[  �a 0 aref aRef� J    =�� ��� l 	  
��S�R� J    
�� ��� m    �Q
�Q FDStFDS1� ��� m    �P
�P boovtrue� ��O� n   ��� o    �N�N 60 nsdateformattershortstyle NSDateFormatterShortStyle� m    �M
�M misccura�O  �S  �R  � ��� l 	 
 ��L�K� J   
 �� ��� m   
 �J
�J FDStFDS2� ��� m    �I
�I boovtrue� ��H� n   ��� o    �G�G 80 nsdateformattermediumstyle NSDateFormatterMediumStyle� m    �F
�F misccura�H  �L  �K  � ��� l 	  ��E�D� J    �� ��� m    �C
�C FDStFDS3� ��� m    �B
�B boovtrue� ��A� n   ��� o    �@�@ 40 nsdateformatterlongstyle NSDateFormatterLongStyle� m    �?
�? misccura�A  �E  �D  � ��� l 	  ��>�=� J    �� ��� m    �<
�< FDStFDS4� ��� m    �;
�; boovtrue� ��:� n   ��� o    �9�9 40 nsdateformatterfullstyle NSDateFormatterFullStyle� m    �8
�8 misccura�:  �>  �=  � ��� l 	  &��7�6� J    &�� ��� m     �5
�5 FDStFDS6� ��� m     !�4
�4 boovfals� ��3� n  ! $��� o   " $�2�2 60 nsdateformattershortstyle NSDateFormatterShortStyle� m   ! "�1
�1 misccura�3  �7  �6  � ��� l 	 & -��0�/� J   & -�� ��� m   & '�.
�. FDStFDS7� ��� m   ' (�-
�- boovfals� ��,� n  ( +��� o   ) +�+�+ 80 nsdateformattermediumstyle NSDateFormatterMediumStyle� m   ( )�*
�* misccura�,  �0  �/  � ��� l 	 - 4��)�(� J   - 4�� ��� m   - .�'
�' FDStFDS8� ��� m   . /�&
�& boovfals� ��%� n  / 2��� o   0 2�$�$ 40 nsdateformatterlongstyle NSDateFormatterLongStyle� m   / 0�#
�# misccura�%  �)  �(  � ��"� l 	 4 ;��!� � J   4 ;�� ��� m   4 5�
� FDStFDS9� ��� m   5 6�
� boovfals� ��� n  6 9��� o   7 9�� 40 nsdateformatterfullstyle NSDateFormatterFullStyle� m   6 7�
� misccura�  �!  �   �"  � ��� R   v ����
� .ascrerr ****      � ****� m   � ��� ��� h I n v a l i d    u s i n g    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .� ���
� 
errn� m   z }���Y� � 
� 
erob  o   � ��� 0 formatstyles formatStyles ��
� 
errt m   � ��
� 
enum�  �  �  l     ����  �  �    l     ����  �  �    i  . 1	
	 I      ��
� (0 _makedateformatter _makeDateFormatter  o      �	�	 0 	theformat 	theFormat � o      �� 0 
localecode 
localeCode�  �
  
 k     �  r      n     I    ���� 0 init  �  �   n     I    ���� 	0 alloc  �  �   n     o    � �  "0 nsdateformatter NSDateFormatter m     ��
�� misccura o      ���� 0 asocformatter asocFormatter  Z    ��� =      l   !����! I   ��"#
�� .corecnte****       ****" J    $$ %��% o    ���� 0 	theformat 	theFormat��  # ��&��
�� 
kocl& m    ��
�� 
ctxt��  ��  ��    m    ����   l   �'()' k    �** +,+ r    (-.- n   &/0/ I   ! &��1���� "0 aslistparameter asListParameter1 2��2 o   ! "���� 0 	theformat 	theFormat��  ��  0 o    !���� 0 _supportlib _supportLib. o      ���� 0 formattypes formatTypes, 343 l  ) )��56��  5 ( " TO DO: check for `ISO8601 format`   6 �77 D   T O   D O :   c h e c k   f o r   ` I S O 8 6 0 1   f o r m a t `4 898 n  ) 1:;: I   * 1��<���� 0 setdatestyle_ setDateStyle_< =��= l  * ->����> n  * -?@? o   + -���� 00 nsdateformatternostyle NSDateFormatterNoStyle@ m   * +��
�� misccura��  ��  ��  ��  ; o   ) *���� 0 asocformatter asocFormatter9 ABA n  2 :CDC I   3 :��E���� 0 settimestyle_ setTimeStyle_E F��F l  3 6G����G n  3 6HIH o   4 6���� 00 nsdateformatternostyle NSDateFormatterNoStyleI m   3 4��
�� misccura��  ��  ��  ��  D o   2 3���� 0 asocformatter asocFormatterB JKJ r   ; NLML J   ; ?NN OPO m   ; <��
�� boovfalsP Q��Q m   < =��
�� boovfals��  M J      RR STS o      ���� 0 	isdateset 	isDateSetT U��U o      ���� 0 	istimeset 	isTimeSet��  K V��V X   O �W��XW k   _ �YY Z[Z r   _ w\]\ I      ��^���� 0 
_datestyle 
_dateStyle^ _`_ n  ` caba 1   a c��
�� 
pcntb o   ` a���� 0 aref aRef` c��c o   c d���� 0 	theformat 	theFormat��  ��  ] J      dd efe o      ���� 0 isdate isDatef g��g o      ���� 0 
asocoption 
asocOption��  [ h��h Z   x �ij��ki o   x y���� 0 isdate isDatej k   | �ll mnm Z  | �op����o o   | }���� 0 	isdateset 	isDateSetp R   � ���qr
�� .ascrerr ****      � ****q m   � �ss �tt d I n v a l i d    u s i n g    p a r a m e t e r   ( t o o   m a n y   d a t e   f o r m a t s ) .r ��uv
�� 
errnu m   � ������Yv ��w��
�� 
erobw o   � ����� 0 formattypes formatTypes��  ��  ��  n xyx l  � �z����z n  � �{|{ I   � ���}���� 0 setdatestyle_ setDateStyle_} ~��~ o   � ����� 0 
asocoption 
asocOption��  ��  | o   � ����� 0 asocformatter asocFormatter��  ��  y �� r   � ���� m   � ���
�� boovtrue� o      ���� 0 	isdateset 	isDateSet��  ��  k k   � ��� ��� Z  � �������� o   � ����� 0 	istimeset 	isTimeSet� R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� d I n v a l i d    u s i n g    p a r a m e t e r   ( t o o   m a n y   t i m e   f o r m a t s ) .� ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 formattypes formatTypes��  ��  ��  � ��� l  � ������� n  � ���� I   � �������� 0 settimestyle_ setTimeStyle_� ���� o   � ����� 0 
asocoption 
asocOption��  ��  � o   � ����� 0 asocformatter asocFormatter��  ��  � ���� r   � ���� m   � ���
�� boovtrue� o      ���� 0 	istimeset 	isTimeSet��  ��  �� 0 aref aRefX o   R S���� 0 formattypes formatTypes��  ( < 6 use predefined date-style and/or time-style constants   ) ��� l   u s e   p r e d e f i n e d   d a t e - s t y l e   a n d / o r   t i m e - s t y l e   c o n s t a n t s��   l  � ����� n  � ���� I   � ��������  0 setdateformat_ setDateFormat_� ���� l  � ������� n  � ���� I   � �������� "0 astextparameter asTextParameter� ��� o   � ����� 0 	theformat 	theFormat� ���� m   � ��� ��� 
 u s i n g��  ��  � o   � ����� 0 _supportlib _supportLib��  ��  ��  ��  � o   � ����� 0 asocformatter asocFormatter�   use custom format string   � ��� 2   u s e   c u s t o m   f o r m a t   s t r i n g ��� n  � ���� I   � �������� 0 
setlocale_ 
setLocale_� ���� l  � ������� n  � ���� I   � �������� &0 aslocaleparameter asLocaleParameter� ��� o   � ����� 0 
localecode 
localeCode� ���� m   � ��� ���  f o r   l o c a l e��  ��  � o   � ����� 0 _supportlib _supportLib��  ��  ��  ��  � o   � ����� 0 asocformatter asocFormatter� ���� L   � ��� o   � ����� 0 asocformatter asocFormatter��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  2 5��� I     ����
�� .Fmt:FDatnull���     ldt � o      �� 0 thedate theDate� �~��
�~ 
Usin� |�}�|��{��}  �|  � o      �z�z 0 	theformat 	theFormat�{  � l     ��y�x� J      �� ��w� m      �v
�v FDStFDS1�w  �y  �x  � �u��t
�u 
Loca� |�s�r��q��s  �r  � o      �p�p 0 
localecode 
localeCode�q  � l     ��o�n� m      �m
�m 
msng�o  �n  �t  � k     6�� ��� l     �l���l  � � � TO DO: what about optional `in timezone` parameter to specify timezone to use? (AS dates always use host machine's timezone, so extra info is needed to format dates for any other tz)   � ���n   T O   D O :   w h a t   a b o u t   o p t i o n a l   ` i n   t i m e z o n e `   p a r a m e t e r   t o   s p e c i f y   t i m e z o n e   t o   u s e ?   ( A S   d a t e s   a l w a y s   u s e   h o s t   m a c h i n e ' s   t i m e z o n e ,   s o   e x t r a   i n f o   i s   n e e d e d   t o   f o r m a t   d a t e s   f o r   a n y   o t h e r   t z )� ��k� Q     6���� k    $�� ��� r    ��� n   ��� I    �j��i�j "0 asdateparameter asDateParameter� ��� o    	�h�h 0 thedate theDate� ��g� m   	 
�� ���  �g  �i  � o    �f�f 0 _supportlib _supportLib� o      �e�e 0 thedate theDate� ��� r    ��� I    �d��c�d (0 _makedateformatter _makeDateFormatter� ��� o    �b�b 0 	theformat 	theFormat� ��a� o    �`�` 0 
localecode 
localeCode�a  �c  � o      �_�_ 0 asocformatter asocFormatter� ��^� L    $�� c    #��� l   !��]�\� n   !��� I    !�[��Z�[ "0 stringfromdate_ stringFromDate_� ��Y� o    �X�X 0 thedate theDate�Y  �Z  � o    �W�W 0 asocformatter asocFormatter�]  �\  � m   ! "�V
�V 
ctxt�^  � R      �U��
�U .ascrerr ****      � ****� o      �T�T 0 etext eText� �S��
�S 
errn� o      �R�R 0 enumber eNumber� �Q��
�Q 
erob� o      �P�P 0 efrom eFrom� �O �N
�O 
errt  o      �M�M 
0 eto eTo�N  � I   , 6�L�K�L 
0 _error    m   - . �  f o r m a t   d a t e  o   . /�J�J 0 etext eText 	 o   / 0�I�I 0 enumber eNumber	 

 o   0 1�H�H 0 efrom eFrom �G o   1 2�F�F 
0 eto eTo�G  �K  �k  �  l     �E�D�C�E  �D  �C    l     �B�A�@�B  �A  �@    i  6 9 I     �?
�? .Fmt:PDatnull���     ctxt o      �>�> 0 thetext theText �=
�= 
Usin |�<�;�:�<  �;   o      �9�9 0 	theformat 	theFormat�:   l     �8�7 J       �6 m      �5
�5 FDStFDS1�6  �8  �7   �4�3
�4 
Loca |�2�1�0 �2  �1   o      �/�/ 0 
localecode 
localeCode�0    l     !�.�-! m      �,
�, 
msng�.  �-  �3   Q     �"#$" k    �%% &'& r    ()( n   *+* I    �+,�*�+ &0 stringwithstring_ stringWithString_, -�)- l   .�(�'. n   /0/ I    �&1�%�& "0 astextparameter asTextParameter1 232 o    �$�$ 0 thetext theText3 4�#4 m    55 �66  �#  �%  0 o    �"�" 0 _supportlib _supportLib�(  �'  �)  �*  + n   787 o    �!�! 0 nsstring NSString8 m    � 
�  misccura) o      �� 0 asoctext asocText' 9:9 r    !;<; I    �=�� (0 _makedateformatter _makeDateFormatter= >?> o    �� 0 	theformat 	theFormat? @�@ o    �� 0 
localecode 
localeCode�  �  < o      �� 0 asocformatter asocFormatter: ABA r   " *CDC n  " (EFE I   # (�G�� "0 datefromstring_ dateFromString_G H�H o   # $�� 0 thetext theText�  �  F o   " #�� 0 asocformatter asocFormatterD o      �� 0 asocdate asocDateB IJI Z   + yKL��K =  + .MNM o   + ,�� 0 asocdate asocDateN m   , -�
� 
msngL k   1 uOO PQP r   1 >RSR c   1 <TUT n  1 :VWV I   6 :���� $0 localeidentifier localeIdentifier�  �  W n  1 6XYX I   2 6��
�	� 
0 locale  �
  �	  Y o   1 2�� 0 asocformatter asocFormatterU m   : ;�
� 
ctxtS o      �� $0 localeidentifier localeIdentifierQ Z[Z Z   ? T\]�^\ =   ? D_`_ n  ? Baba 1   @ B�
� 
lengb o   ? @�� $0 localeidentifier localeIdentifier` m   B C��  ] r   G Jcdc m   G Hee �ff  s t a n d a r dd o      �� $0 localeidentifier localeIdentifier�  ^ r   M Tghg b   M Riji b   M Pklk m   M Nmm �nn  l o   N O� �  $0 localeidentifier localeIdentifierj m   P Qoo �pp  h o      ���� $0 localeidentifier localeIdentifier[ q��q R   U u��rs
�� .ascrerr ****      � ****r l  a tt����t b   a tuvu b   a pwxw b   a nyzy b   a j{|{ m   a d}} �~~ t T e x t   i s   n o t   i n   t h e   c o r r e c t   f o r m a t   ( e x p e c t e d   d a t e   t e x t   i n   | l  d i���� n  d i��� I   e i�������� 0 
dateformat 
dateFormat��  ��  � o   d e���� 0 asocformatter asocFormatter��  ��  z m   j m�� ��� "    f o r m a t   f o r   t h e  x o   n o���� $0 localeidentifier localeIdentifierv m   p s�� ���    l o c a l e . )��  ��  s ����
�� 
errn� m   W Z�����Y� �����
�� 
erob� o   ] ^���� 0 thetext theText��  ��  �  �  J ��� l   z z������  ���
		-- note: -getObjectValue:forString:range:error: would be preferable to -dateFromString: as it returns an error description; however, it only parses the string as far as it can so the caller must check the returned range to determine if the entire string was consumed and raise its own error if not, but this currently isn't possible in ASOC as it only supports `in` and `out` arguments, not `inout` (OTOH, Cocoa-generated error messages often aren't much better than generic ones, so it's not a massive loss)		set {didSucceed, asocDate, theError} to asocFormatter's getObjectValue:(specifier) forString:asocText range:({location:0, |length|:asocText's |length|()}) |error|:(specifier)		if not didSucceed then			...			error ((theError's localizedDescription() as text) & " (Expected date text in �" & (asocFormatter's dateFormat()) & "� format for the " & localeIdentifier & " locale.)") number -1703 from theText		end if
		   � ���F 
 	 	 - -   n o t e :   - g e t O b j e c t V a l u e : f o r S t r i n g : r a n g e : e r r o r :   w o u l d   b e   p r e f e r a b l e   t o   - d a t e F r o m S t r i n g :   a s   i t   r e t u r n s   a n   e r r o r   d e s c r i p t i o n ;   h o w e v e r ,   i t   o n l y   p a r s e s   t h e   s t r i n g   a s   f a r   a s   i t   c a n   s o   t h e   c a l l e r   m u s t   c h e c k   t h e   r e t u r n e d   r a n g e   t o   d e t e r m i n e   i f   t h e   e n t i r e   s t r i n g   w a s   c o n s u m e d   a n d   r a i s e   i t s   o w n   e r r o r   i f   n o t ,   b u t   t h i s   c u r r e n t l y   i s n ' t   p o s s i b l e   i n   A S O C   a s   i t   o n l y   s u p p o r t s   ` i n `   a n d   ` o u t `   a r g u m e n t s ,   n o t   ` i n o u t `   ( O T O H ,   C o c o a - g e n e r a t e d   e r r o r   m e s s a g e s   o f t e n   a r e n ' t   m u c h   b e t t e r   t h a n   g e n e r i c   o n e s ,   s o   i t ' s   n o t   a   m a s s i v e   l o s s )  	 	 s e t   { d i d S u c c e e d ,   a s o c D a t e ,   t h e E r r o r }   t o   a s o c F o r m a t t e r ' s   g e t O b j e c t V a l u e : ( s p e c i f i e r )   f o r S t r i n g : a s o c T e x t   r a n g e : ( { l o c a t i o n : 0 ,   | l e n g t h | : a s o c T e x t ' s   | l e n g t h | ( ) } )   | e r r o r | : ( s p e c i f i e r )  	 	 i f   n o t   d i d S u c c e e d   t h e n  	 	 	 . . .  	 	 	 e r r o r   ( ( t h e E r r o r ' s   l o c a l i z e d D e s c r i p t i o n ( )   a s   t e x t )   &   "   ( E x p e c t e d   d a t e   t e x t   i n    "   &   ( a s o c F o r m a t t e r ' s   d a t e F o r m a t ( ) )   &   "    f o r m a t   f o r   t h e   "   &   l o c a l e I d e n t i f i e r   &   "   l o c a l e . ) " )   n u m b e r   - 1 7 0 3   f r o m   t h e T e x t  	 	 e n d   i f 
 	 	� ���� l  z ����� L   z ��� c   z ��� o   z {���� 0 asocdate asocDate� m   { ~��
�� 
ldt � � � note that AS dates don't include timezone info, so resulting date object always uses host machine's current tz, regardless of what tz theText used, adjusting the date object's time appropriately   � ����   n o t e   t h a t   A S   d a t e s   d o n ' t   i n c l u d e   t i m e z o n e   i n f o ,   s o   r e s u l t i n g   d a t e   o b j e c t   a l w a y s   u s e s   h o s t   m a c h i n e ' s   c u r r e n t   t z ,   r e g a r d l e s s   o f   w h a t   t z   t h e T e x t   u s e d ,   a d j u s t i n g   t h e   d a t e   o b j e c t ' s   t i m e   a p p r o p r i a t e l y��  # R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  $ I   � �������� 
0 _error  � ��� m   � ��� ���  p a r s e   d a t e� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   JSON   � ��� 
   J S O N� ��� l     ��������  ��  ��  � ��� i  : =��� I     ����
�� .Fmt:FJSNnull���     ****� o      ���� 0 
jsonobject 
jsonObject� �����
�� 
PrPr� |����������  ��  � o      ���� "0 isprettyprinted isPrettyPrinted��  � l     ������ m      ��
�� boovfals��  ��  ��  � Q     ����� k    ��� ��� Z    ������ n   ��� I    ������� (0 asbooleanparameter asBooleanParameter� ��� o    	���� "0 isprettyprinted isPrettyPrinted� ���� m   	 
�� ��� " e x t r a   w h i t e   s p a c e��  ��  � o    ���� 0 _supportlib _supportLib� r    ��� n   ��� o    ���� 80 nsjsonwritingprettyprinted NSJSONWritingPrettyPrinted� m    ��
�� misccura� o      ���� 0 writeoptions writeOptions��  � r    ��� m    ����  � o      ���� 0 writeoptions writeOptions� ��� Z    5������� H    &�� l   %������ n   %��� I     %������� (0 isvalidjsonobject_ isValidJSONObject_� ���� o     !���� 0 
jsonobject 
jsonObject��  ��  � n    ��� o     ���� *0 nsjsonserialization NSJSONSerialization� m    ��
�� misccura��  ��  � R   ) 1����
�� .ascrerr ****      � ****� m   / 0�� ��� z C a n  t   c o n v e r t   o b j e c t   t o   J S O N   ( f o u n d   u n s u p p o r t e d   o b j e c t   t y p e ) .� ����
�� 
errn� m   + ,�����Y� �����
�� 
erob� o   - .���� 0 
jsonobject 
jsonObject��  ��  ��  � ��� r   6 O��� n  6 @��� I   9 @������� F0 !datawithjsonobject_options_error_ !dataWithJSONObject_options_error_� ��� o   9 :���� 0 
jsonobject 
jsonObject� ��� o   : ;���� 0 writeoptions writeOptions� ���� l  ; <������ m   ; <��
�� 
obj ��  ��  ��  ��  � n  6 9��� o   7 9���� *0 nsjsonserialization NSJSONSerialization� m   6 7��
�� misccura� J      �� ��� o      ���� 0 thedata theData� ���� o      ���� 0 theerror theError��  �    Z  P l���� =  P S o   P Q���� 0 thedata theData m   Q R��
�� 
msng R   V h��
�� .ascrerr ****      � **** b   \ g	 b   \ c

 m   \ ] � : C a n  t   c o n v e r t   o b j e c t   t o   J S O N ( n  ] b I   ^ b�������� ,0 localizeddescription localizedDescription��  ��   o   ] ^���� 0 theerror theError	 m   c f �  ) . ��
�� 
errn m   X Y�����Y ����
�� 
erob o   Z [���� 0 
jsonobject 
jsonObject��  ��  ��   �� L   m � c   m � l  m ����� n  m � I   v ������� 00 initwithdata_encoding_ initWithData_encoding_  o   v w���� 0 thedata theData �� l  w | ����  n  w |!"! o   x |���� ,0 nsutf8stringencoding NSUTF8StringEncoding" m   w x��
�� misccura��  ��  ��  ��   n  m v#$# I   r v�������� 	0 alloc  ��  ��  $ n  m r%&% o   n r���� 0 nsstring NSString& m   m n�
� misccura��  ��   m   � ��~
�~ 
ctxt��  � R      �}'(
�} .ascrerr ****      � ****' o      �|�| 0 etext eText( �{)*
�{ 
errn) o      �z�z 0 enumber eNumber* �y+,
�y 
erob+ o      �x�x 0 efrom eFrom, �w-�v
�w 
errt- o      �u�u 
0 eto eTo�v  � I   � ��t.�s�t 
0 _error  . /0/ m   � �11 �22  f o r m a t   J S O N0 343 o   � ��r�r 0 etext eText4 565 o   � ��q�q 0 enumber eNumber6 787 o   � ��p�p 0 efrom eFrom8 9�o9 o   � ��n�n 
0 eto eTo�o  �s  � :;: l     �m�l�k�m  �l  �k  ; <=< l     �j�i�h�j  �i  �h  = >?> i  > A@A@ I     �gBC
�g .Fmt:PJSNnull���     ctxtB o      �f�f 0 jsontext jsonTextC �eD�d
�e 
FragD |�c�bE�aF�c  �b  E o      �`�` *0 arefragmentsallowed areFragmentsAllowed�a  F l     G�_�^G m      �]
�] boovfals�_  �^  �d  A Q     �HIJH k    �KK LML r    NON n   PQP I    �\R�[�\ "0 astextparameter asTextParameterR STS o    	�Z�Z 0 jsontext jsonTextT U�YU m   	 
VV �WW  �Y  �[  Q o    �X�X 0 _supportlib _supportLibO o      �W�W 0 jsontext jsonTextM XYX Z    *Z[�V\Z n   ]^] I    �U_�T�U (0 asbooleanparameter asBooleanParameter_ `a` o    �S�S *0 arefragmentsallowed areFragmentsAlloweda b�Rb m    cc �dd $ a l l o w i n g   f r a g m e n t s�R  �T  ^ o    �Q�Q 0 _supportlib _supportLib[ r    $efe n   "ghg o     "�P�P :0 nsjsonreadingallowfragments NSJSONReadingAllowFragmentsh m     �O
�O misccuraf o      �N�N 0 readoptions readOptions�V  \ r   ' *iji m   ' (�M�M  j o      �L�L 0 readoptions readOptionsY klk r   + <mnm n  + :opo I   3 :�Kq�J�K (0 datausingencoding_ dataUsingEncoding_q r�Ir l  3 6s�H�Gs n  3 6tut o   4 6�F�F ,0 nsutf8stringencoding NSUTF8StringEncodingu m   3 4�E
�E misccura�H  �G  �I  �J  p l  + 3v�D�Cv n  + 3wxw I   . 3�By�A�B &0 stringwithstring_ stringWithString_y z�@z o   . /�?�? 0 jsontext jsonText�@  �A  x n  + .{|{ o   , .�>�> 0 nsstring NSString| m   + ,�=
�= misccura�D  �C  n o      �<�< 0 thedata theDatal }~} r   = V� n  = G��� I   @ G�;��:�; F0 !jsonobjectwithdata_options_error_ !JSONObjectWithData_options_error_� ��� o   @ A�9�9 0 thedata theData� ��� o   A B�8�8 0 readoptions readOptions� ��7� l  B C��6�5� m   B C�4
�4 
obj �6  �5  �7  �:  � n  = @��� o   > @�3�3 *0 nsjsonserialization NSJSONSerialization� m   = >�2
�2 misccura� J      �� ��� o      �1�1 0 
jsonobject 
jsonObject� ��0� o      �/�/ 0 theerror theError�0  ~ ��� Z  W {���.�-� =  W Z��� o   W X�,�, 0 
jsonobject 
jsonObject� m   X Y�+
�+ 
msng� R   ] w�*��
�* .ascrerr ****      � ****� b   i v��� b   i r��� m   i l�� ���   N o t   v a l i d   J S O N   (� n  l q��� I   m q�)�(�'�) ,0 localizeddescription localizedDescription�(  �'  � o   l m�&�& 0 theerror theError� m   r u�� ���  ) .� �%��
�% 
errn� m   _ b�$�$�Y� �#��"
�# 
erob� o   e f�!�! 0 jsontext jsonText�"  �.  �-  � �� � L   | ��� c   | ���� o   | }�� 0 
jsonobject 
jsonObject� m   } ��
� 
****�   I R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  J I   � ����� 
0 _error  � ��� m   � ��� ���  p a r s e   J S O N� ��� o   � ��� 0 etext eText� ��� o   � ��� 0 enumber eNumber� ��� o   � ��� 0 efrom eFrom� ��� o   � ��� 
0 eto eTo�  �  ? ��� l     ����  �  �  � ��� l     �
�	��
  �	  �  � ��� l     ����  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ����  �   general   � ���    g e n e r a l� ��� l     ����  �  �  � ��� i  B E��� I     ���
� .Fmt:FLitnull��� ��� null�  � � ���
�  
For_� o      ���� 0 thevalue theValue��  � l   N���� k    N�� ��� l     ������  ��� note that most value types can be rendered using vanilla code; only specifiers and records have to be rendered via OSA APIs; values should be rendered in human-readable form (text isn't quoted, lists are concatentated as comma-separated items, dates and numbers using default AS coercions, etc) - user can use `literal representation`, `format number/date`, etc. to format values differently (avoids need for complex template parsing)   � ���f   n o t e   t h a t   m o s t   v a l u e   t y p e s   c a n   b e   r e n d e r e d   u s i n g   v a n i l l a   c o d e ;   o n l y   s p e c i f i e r s   a n d   r e c o r d s   h a v e   t o   b e   r e n d e r e d   v i a   O S A   A P I s ;   v a l u e s   s h o u l d   b e   r e n d e r e d   i n   h u m a n - r e a d a b l e   f o r m   ( t e x t   i s n ' t   q u o t e d ,   l i s t s   a r e   c o n c a t e n t a t e d   a s   c o m m a - s e p a r a t e d   i t e m s ,   d a t e s   a n d   n u m b e r s   u s i n g   d e f a u l t   A S   c o e r c i o n s ,   e t c )   -   u s e r   c a n   u s e   ` l i t e r a l   r e p r e s e n t a t i o n ` ,   ` f o r m a t   n u m b e r / d a t e ` ,   e t c .   t o   f o r m a t   v a l u e s   d i f f e r e n t l y   ( a v o i d s   n e e d   f o r   c o m p l e x   t e m p l a t e   p a r s i n g )� ��� l     ������  ��� rendering arbitrary AS values requires wrapping the value in a script object (to preserve context info such as an object specifier's target application), converting that script to a typeScript descriptor (e.g. by packing it into an Apple event and sending it to a previously installed AE handler), passing that object to OSALoad and executing it to return the value as a new OSAID which can then be rendered via OSADisplay   � ���N   r e n d e r i n g   a r b i t r a r y   A S   v a l u e s   r e q u i r e s   w r a p p i n g   t h e   v a l u e   i n   a   s c r i p t   o b j e c t   ( t o   p r e s e r v e   c o n t e x t   i n f o   s u c h   a s   a n   o b j e c t   s p e c i f i e r ' s   t a r g e t   a p p l i c a t i o n ) ,   c o n v e r t i n g   t h a t   s c r i p t   t o   a   t y p e S c r i p t   d e s c r i p t o r   ( e . g .   b y   p a c k i n g   i t   i n t o   a n   A p p l e   e v e n t   a n d   s e n d i n g   i t   t o   a   p r e v i o u s l y   i n s t a l l e d   A E   h a n d l e r ) ,   p a s s i n g   t h a t   o b j e c t   t o   O S A L o a d   a n d   e x e c u t i n g   i t   t o   r e t u r n   t h e   v a l u e   a s   a   n e w   O S A I D   w h i c h   c a n   t h e n   b e   r e n d e r e d   v i a   O S A D i s p l a y� ���� Q    N���� k   8�� ��� l   ������  � � z caution: AS types that can have overridden `class` properties (specifiers, records, etc) must be handled as special cases   � ��� �   c a u t i o n :   A S   t y p e s   t h a t   c a n   h a v e   o v e r r i d d e n   ` c l a s s `   p r o p e r t i e s   ( s p e c i f i e r s ,   r e c o r d s ,   e t c )   m u s t   b e   h a n d l e d   a s   s p e c i a l   c a s e s� ��� Z    �������� F    .��� F    ��� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 thevalue theValue��  � �����
�� 
kocl� m    ��
�� 
obj ��  ��  ��  � l 
  ������ m    ����  ��  ��  � =    ��� l   ������ I   ����
�� .corecnte****       ****� J       �� o    ���� 0 thevalue theValue��  � ����
�� 
kocl m    ��
�� 
capp��  ��  ��  � l 
  ���� m    ����  ��  ��  � =   ! , l  ! *���� I  ! *��
�� .corecnte****       **** J   ! $		 
��
 o   ! "���� 0 thevalue theValue��   ����
�� 
kocl m   % &��
�� 
reco��  ��  ��   m   * +����  � Z   1 � >   1 < l  1 :���� I  1 :��
�� .corecnte****       **** J   1 4 �� o   1 2���� 0 thevalue theValue��   ����
�� 
kocl m   5 6��
�� 
scpt��  ��  ��   m   : ;����   l  ? T Q   ? T L   B J b   B I  b   B G!"! m   B C## �$$  � s c r i p t  " l  C F%����% n  C F&'& 1   D F��
�� 
pnam' o   C D���� 0 thevalue theValue��  ��    m   G H(( �))  � R      ������
�� .ascrerr ****      � ****��  ��   L   R T** m   R S++ �,,  � s c r i p t �GA script objects are currently displayed as "�script[NAME]�" (displaying script objects as source code is a separate task and should be done via OSAKit/osadecompile); TO DO: support informal 'description' protocol, speculatively calling `theValue's objectDescription()` and returning result if it's a non-empty text value?    �--�   s c r i p t   o b j e c t s   a r e   c u r r e n t l y   d i s p l a y e d   a s   " � s c r i p t [ N A M E ] � "   ( d i s p l a y i n g   s c r i p t   o b j e c t s   a s   s o u r c e   c o d e   i s   a   s e p a r a t e   t a s k   a n d   s h o u l d   b e   d o n e   v i a   O S A K i t / o s a d e c o m p i l e ) ;   T O   D O :   s u p p o r t   i n f o r m a l   ' d e s c r i p t i o n '   p r o t o c o l ,   s p e c u l a t i v e l y   c a l l i n g   ` t h e V a l u e ' s   o b j e c t D e s c r i p t i o n ( ) `   a n d   r e t u r n i n g   r e s u l t   i f   i t ' s   a   n o n - e m p t y   t e x t   v a l u e ? ./. =  W Z010 m   W X��
�� 
pcls1 m   X Y��
�� 
ctxt/ 232 k   ] �44 565 r   ] d787 n  ] b9:9 1   ^ b��
�� 
txdl: 1   ] ^��
�� 
ascr8 o      ���� 0 oldtids oldTIDs6 ;<; r   e n=>= m   e h?? �@@  \> n     ABA 1   i m��
�� 
txdlB 1   h i��
�� 
ascr< CDC r   o vEFE n   o tGHG 2  p t��
�� 
citmH o   o p���� 0 thevalue theValueF o      ���� 0 	textitems 	textItemsD IJI r   w �KLK m   w zMM �NN  \ \L n     OPO 1   { ��
�� 
txdlP 1   z {��
�� 
ascrJ QRQ r   � �STS c   � �UVU o   � ����� 0 	textitems 	textItemsV m   � ���
�� 
ctxtT o      ���� 0 thevalue theValueR WXW r   � �YZY m   � �[[ �\\  "Z n     ]^] 1   � ���
�� 
txdl^ 1   � ���
�� 
ascrX _`_ r   � �aba n   � �cdc 2  � ���
�� 
citmd o   � ����� 0 thevalue theValueb o      ���� 0 	textitems 	textItems` efe r   � �ghg m   � �ii �jj  \ "h n     klk 1   � ���
�� 
txdll 1   � ���
�� 
ascrf mnm r   � �opo c   � �qrq o   � ����� 0 	textitems 	textItemsr m   � ���
�� 
ctxtp o      ���� 0 thevalue theValuen sts r   � �uvu o   � ����� 0 oldtids oldTIDsv n     wxw 1   � ���
�� 
txdlx 1   � ���
�� 
ascrt y��y L   � �zz b   � �{|{ b   � �}~} m   � � ���  "~ o   � ����� 0 thevalue theValue| m   � ��� ���  "��  3 ��� =  � ���� m   � ���
�� 
pcls� m   � ���
�� 
rdat� ���� l  � ����� L   � ��� m   � ��� ���  � T O D O �� p j TO DO: should be able to format �data ...� via NSAppleEventDescriptor, avoiding need to go through OSAKit   � ��� �   T O   D O :   s h o u l d   b e   a b l e   t o   f o r m a t   � d a t a   . . . �   v i a   N S A p p l e E v e n t D e s c r i p t o r ,   a v o i d i n g   n e e d   t o   g o   t h r o u g h   O S A K i t��   Q   � ����� L   � ��� c   � ���� o   � ����� 0 thevalue theValue� m   � ���
�� 
ctxt� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � l  � �������  �   fall through   � ���    f a l l   t h r o u g h��  ��  � ��� l  � �������  � O I if it's an ASOC object specifier, use object's description, if available   � ��� �   i f   i t ' s   a n   A S O C   o b j e c t   s p e c i f i e r ,   u s e   o b j e c t ' s   d e s c r i p t i o n ,   i f   a v a i l a b l e� ��� Z   �3������� F   � ���� >   � ���� l  � ������� I  � �����
�� .corecnte****       ****� J   � ��� ���� o   � ����� 0 thevalue theValue��  � �����
�� 
kocl� m   � ���
�� 
obj ��  ��  ��  � m   � �����  � =  � ���� n  � ���� m   � ���
�� 
want� l  � ������� c   � ���� o   � ����� 0 thevalue theValue� m   � ���
�� 
reco��  ��  � m   � ���
�� 
ocid� l  /���� Q   /���� L  �� b  ��� b  ��� m  �� ���  �� l ������ c  ��� n ��� I  �������� 0 description  ��  ��  � o  ���� 0 thevalue theValue� m  ��
�� 
ctxt��  ��  � m  �� ���  �� R      ������
�� .ascrerr ****      � ****��  ��  � l /���� l /���� L  /�� b  .��� m  �� ���   � c l a s s   o c i d �   i d  � l -������ I -�����
�� .Fmt:FLitnull��� ��� null��  � ���~
� 
For_� l ")��}�|� n ")��� m  %)�{
�{ 
seld� l "%��z�y� c  "%��� o  "#�x�x 0 thevalue theValue� m  #$�w
�w 
reco�z  �y  �}  �|  �~  ��  ��  � � � would be better to get correct representation generated by OSAKit, but AS doesn't allow ASOC specifiers to travel so string-munging it is   � ���   w o u l d   b e   b e t t e r   t o   g e t   c o r r e c t   r e p r e s e n t a t i o n   g e n e r a t e d   b y   O S A K i t ,   b u t   A S   d o e s n ' t   a l l o w   A S O C   s p e c i f i e r s   t o   t r a v e l   s o   s t r i n g - m u n g i n g   i t   i s� V P otherwise use raw ASOC object specifier syntax (not ideal, but will have to do)   � ��� �   o t h e r w i s e   u s e   r a w   A S O C   o b j e c t   s p e c i f i e r   s y n t a x   ( n o t   i d e a l ,   b u t   w i l l   h a v e   t o   d o )� 7 1  (see TypesLib's `check type` handler for notes)   � ��� b     ( s e e   T y p e s L i b ' s   ` c h e c k   t y p e `   h a n d l e r   f o r   n o t e s )��  ��  � ��� l 44�v���v  �hb TO DO: there's a problem here if value is a record containing ASOC specifiers, as there's no practical way to examine the record's properties without sending it to an AE handler, and AS will throw an error; suspect the only practical option is to throw another error that describes the problem, or return "�record�" to indicate object is unrepresentable   � ����   T O   D O :   t h e r e ' s   a   p r o b l e m   h e r e   i f   v a l u e   i s   a   r e c o r d   c o n t a i n i n g   A S O C   s p e c i f i e r s ,   a s   t h e r e ' s   n o   p r a c t i c a l   w a y   t o   e x a m i n e   t h e   r e c o r d ' s   p r o p e r t i e s   w i t h o u t   s e n d i n g   i t   t o   a n   A E   h a n d l e r ,   a n d   A S   w i l l   t h r o w   a n   e r r o r ;   s u s p e c t   t h e   o n l y   p r a c t i c a l   o p t i o n   i s   t o   t h r o w   a n o t h e r   e r r o r   t h a t   d e s c r i b e s   t h e   p r o b l e m ,   o r   r e t u r n   " � r e c o r d � "   t o   i n d i c a t e   o b j e c t   i s   u n r e p r e s e n t a b l e� ��u� l 48���� L  48�� m  47�� ���  � T O D O �� #  format value via OSAKit APIs   � ��� :   f o r m a t   v a l u e   v i a   O S A K i t   A P I s�u  � R      �t��
�t .ascrerr ****      � ****� o      �s�s 0 etext eText� �r��
�r 
errn� o      �q�q 0 enumber eNumber� �p��
�p 
erob� o      �o�o 0 efrom eFrom� �n��m
�n 
errt� o      �l�l 
0 eto eTo�m  � l @N���� I  @N�k��j�k 
0 _error  � ��� m  AD�� ��� , l i t e r a l   r e p r e s e n t a t i o n� ��� o  DE�i�i 0 etext eText� ��� o  EF�h�h 0 enumber eNumber�    o  FG�g�g 0 efrom eFrom �f o  GH�e�e 
0 eto eTo�f  �j  � 8 2 note: this handler should never fail, caveat bugs   � � d   n o t e :   t h i s   h a n d l e r   s h o u l d   n e v e r   f a i l ,   c a v e a t   b u g s��  � � � TO DO: how practical to include a pretty printing option? (not too hard for lists, huge pain for records) -- Q. if moving `format text` to TextLib, should this also move there or should it go in TypesLib instead?   � ��   T O   D O :   h o w   p r a c t i c a l   t o   i n c l u d e   a   p r e t t y   p r i n t i n g   o p t i o n ?   ( n o t   t o o   h a r d   f o r   l i s t s ,   h u g e   p a i n   f o r   r e c o r d s )   - -   Q .   i f   m o v i n g   ` f o r m a t   t e x t `   t o   T e x t L i b ,   s h o u l d   t h i s   a l s o   m o v e   t h e r e   o r   s h o u l d   i t   g o   i n   T y p e s L i b   i n s t e a d ?�  l     �d�c�b�d  �c  �b    l     �a�`�_�a  �`  �_   	
	 i  F I I     �^
�^ .Fmt:FTxtnull���     ctxt o      �]�] 0 templatetext templateText �\�[
�\ 
Usin o      �Z�Z 0 	thevalues 	theValues�[   k    3  l     �Y�Y   � � note: templateText uses same `$n` (where n=1-9) notation as `search text`'s replacement templates, with `\$` to escape as necessary ($ not followed by a digit will appear as-is)    �d   n o t e :   t e m p l a t e T e x t   u s e s   s a m e   ` $ n `   ( w h e r e   n = 1 - 9 )   n o t a t i o n   a s   ` s e a r c h   t e x t ` ' s   r e p l a c e m e n t   t e m p l a t e s ,   w i t h   ` \ $ `   t o   e s c a p e   a s   n e c e s s a r y   ( $   n o t   f o l l o w e d   b y   a   d i g i t   w i l l   a p p e a r   a s - i s ) �X Q    3 k     r     n     I    �W!�V�W "0 aslistparameter asListParameter! "�U" o    	�T�T 0 	thevalues 	theValues�U  �V    o    �S�S 0 _supportlib _supportLib o      �R�R 0 	thevalues 	theValues #$# r    %&% n   '(' I    �Q)�P�Q Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_) *+* m    ,, �--  \ \ . | \ $ [ 1 - 9 ]+ ./. m    �O�O  / 0�N0 l   1�M�L1 m    �K
�K 
msng�M  �L  �N  �P  ( n   232 o    �J�J *0 nsregularexpression NSRegularExpression3 m    �I
�I misccura& o      �H�H 
0 regexp  $ 454 r    '676 n   %898 I     %�G:�F�G &0 stringwithstring_ stringWithString_: ;�E; o     !�D�D 0 templatetext templateText�E  �F  9 n    <=< o     �C�C 0 nsstring NSString= m    �B
�B misccura7 o      �A�A 0 
asocstring 
asocString5 >?> r   ( 9@A@ l  ( 7B�@�?B n  ( 7CDC I   ) 7�>E�=�> @0 matchesinstring_options_range_ matchesInString_options_range_E FGF o   ) *�<�< 0 
asocstring 
asocStringG HIH m   * +�;�;  I J�:J J   + 3KK LML m   + ,�9�9  M N�8N n  , 1OPO I   - 1�7�6�5�7 
0 length  �6  �5  P o   , -�4�4 0 
asocstring 
asocString�8  �:  �=  D o   ( )�3�3 
0 regexp  �@  �?  A o      �2�2  0 asocmatcharray asocMatchArray? QRQ r   : >STS J   : <�1�1  T o      �0�0 0 resulttexts resultTextsR UVU r   ? BWXW m   ? @�/�/  X o      �.�. 0 
startindex 
startIndexV Y�-Y P   CZ[\Z k   H]] ^_^ Y   H �`�,ab�+` k   X �cc ded r   X efgf l  X ch�*�)h n  X ciji I   ^ c�(k�'�( 0 rangeatindex_ rangeAtIndex_k l�&l m   ^ _�%�%  �&  �'  j l  X ^m�$�#m n  X ^non I   Y ^�"p�!�"  0 objectatindex_ objectAtIndex_p q� q o   Y Z�� 0 i  �   �!  o o   X Y��  0 asocmatcharray asocMatchArray�$  �#  �*  �)  g o      �� 0 
matchrange 
matchRangee rsr r   f �tut c   f }vwv l  f yx��x n  f yyzy I   g y�{�� *0 substringwithrange_ substringWithRange_{ |�| K   g u}} �~� 0 location  ~ o   h i�� 0 
startindex 
startIndex ���� 
0 length  � l  j q���� \   j q��� l  j o���� n  j o��� I   k o���� 0 location  �  �  � o   j k�� 0 
matchrange 
matchRange�  �  � o   o p�� 0 
startindex 
startIndex�  �  �  �  �  z o   f g�
�
 0 
asocstring 
asocString�  �  w m   y |�	
�	 
ctxtu n      ���  ;   ~ � o   } ~�� 0 resulttexts resultTextss ��� r   � ���� c   � ���� l  � ����� n  � ���� I   � ����� *0 substringwithrange_ substringWithRange_� ��� o   � ��� 0 
matchrange 
matchRange�  �  � o   � ��� 0 
asocstring 
asocString�  �  � m   � �� 
�  
ctxt� o      ���� 0 thetoken theToken� ��� Z   � ������� =  � ���� o   � ����� 0 thetoken theToken� m   � ��� ���  \ \� l  � ����� r   � ���� o   � ����� 0 thetoken theToken� n      ���  ;   � �� o   � ����� 0 resulttexts resultTexts� ( " found backslash-escaped character   � ��� D   f o u n d   b a c k s l a s h - e s c a p e d   c h a r a c t e r��  � l  � ����� k   � ��� ��� l  � ����� r   � ���� n   � ���� 4   � ����
�� 
cobj� l  � ������� c   � ���� n  � ���� 4  � ����
�� 
cha � m   � �������� o   � ����� 0 thetoken theToken� m   � ���
�� 
long��  ��  � o   � ����� 0 	thevalues 	theValues� o      ���� 0 theitem theItem� 2 , this will raise error -1728 if out of range   � ��� X   t h i s   w i l l   r a i s e   e r r o r   - 1 7 2 8   i f   o u t   o f   r a n g e� ���� Q   � ����� r   � ���� c   � ���� o   � ����� 0 theitem theItem� m   � ���
�� 
ctxt� n      ���  ;   � �� o   � ����� 0 resulttexts resultTexts� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � l  � ����� r   � ���� I  � ������
�� .Fmt:FLitnull��� ��� null��  � �����
�� 
For_� o   � ����� 0 theitem theItem��  � n      ���  ;   � �� o   � ����� 0 resulttexts resultTexts� � � TO DO: or just throw 'unsupported object type' error, requiring user to get value's literal representation before passing it to `format text`   � ���   T O   D O :   o r   j u s t   t h r o w   ' u n s u p p o r t e d   o b j e c t   t y p e '   e r r o r ,   r e q u i r i n g   u s e r   t o   g e t   v a l u e ' s   l i t e r a l   r e p r e s e n t a t i o n   b e f o r e   p a s s i n g   i t   t o   ` f o r m a t   t e x t `��  �  	 found $n   � ���    f o u n d   $ n� ���� r   � ���� [   � ���� l  � ������� n  � ���� I   � ��������� 0 location  ��  ��  � o   � ����� 0 
matchrange 
matchRange��  ��  � l  � ������� n  � ���� I   � ��������� 
0 length  ��  ��  � o   � ����� 0 
matchrange 
matchRange��  ��  � o      ���� 0 
startindex 
startIndex��  �, 0 i  a m   K L����  b l  L S������ \   L S��� l  L Q������ n  L Q��� I   M Q�������� 	0 count  ��  ��  � o   L M����  0 asocmatcharray asocMatchArray��  ��  � m   Q R���� ��  ��  �+  _ ��� r   � ���� c   � ���� l  � ������� n  � ���� I   � �������� *0 substringfromindex_ substringFromIndex_� ���� o   � ����� 0 
startindex 
startIndex��  ��  � o   � ����� 0 
asocstring 
asocString��  ��  � m   � ���
�� 
ctxt� n      ���  ;   � �� o   � ����� 0 resulttexts resultTexts� ��� r   � ���� n  � ���� 1   � ���
�� 
txdl� 1   � ���
�� 
ascr� o      ���� 0 oldtids oldTIDs� ��� r   ���� m   � ��� ���  � n     ��� 1   ��
�� 
txdl� 1   � ��
�� 
ascr� ��� r     c   o  ���� 0 resulttexts resultTexts m  
��
�� 
ctxt o      ���� 0 
resulttext 
resultText�  r   o  ���� 0 oldtids oldTIDs n     	 1  ��
�� 
txdl	 1  ��
�� 
ascr 
��
 L   o  ���� 0 
resulttext 
resultText��  [ ��
�� conscase ��
�� consdiac ��
�� conshyph ��
�� conspunc ����
�� conswhit��  \ ����
�� consnume��  �-   R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   I  #3������ 
0 _error    m  $' �  f o r m a t   t e x t  o  '(���� 0 etext eText  o  ()���� 0 enumber eNumber  !  o  )*���� 0 efrom eFrom! "��" o  *-���� 
0 eto eTo��  ��  �X  
 #$# l     ��������  ��  ��  $ %��% l     ��������  ��  ��  ��       ��&'()*+,-./0123456��  & ��������������������������������
�� 
pimr�� 0 _supportlib _supportLib�� 
0 _error  
�� .Fmt:LLocnull��� ��� null
�� .Fmt:CLocnull��� ��� null�� ,0 _makenumberformatter _makeNumberFormatter
�� .Fmt:FNumnull���     nmbr
�� .Fmt:PNumnull���     ctxt�� 0 
_datestyle 
_dateStyle�� (0 _makedateformatter _makeDateFormatter
�� .Fmt:FDatnull���     ldt 
�� .Fmt:PDatnull���     ctxt
�� .Fmt:FJSNnull���     ****
�� .Fmt:PJSNnull���     ctxt
�� .Fmt:FLitnull��� ��� null
�� .Fmt:FTxtnull���     ctxt' ��7�� 7  88 ��9��
�� 
cobj9 ::   �� 
�� 
frmk��  ( ;;   �� *
�� 
scpt) � 4�~�}<=�|� 
0 _error  �~ �{>�{ >  �z�y�x�w�v�z 0 handlername handlerName�y 0 etext eText�x 0 enumber eNumber�w 0 efrom eFrom�v 
0 eto eTo�}  < �u�t�s�r�q�u 0 handlername handlerName�t 0 etext eText�s 0 enumber eNumber�r 0 efrom eFrom�q 
0 eto eTo=  D�p�o�p �o &0 throwcommanderror throwCommandError�| b  ࠡ����+ * �n b�m�l?@�k
�n .Fmt:LLocnull��� ��� null�m  �l  ?  @ �j�i�h n�g�f
�j misccura�i 0 nslocale NSLocale�h 80 availablelocaleidentifiers availableLocaleIdentifiers�g 60 sortedarrayusingselector_ sortedArrayUsingSelector_
�f 
list�k ��,j+ �k+ �&+ �e z�d�cAB�b
�e .Fmt:CLocnull��� ��� null�d  �c  A  B �a�`�_�^�]
�a misccura�` 0 nslocale NSLocale�_ 0 currentlocale currentLocale�^ $0 localeidentifier localeIdentifier
�] 
ctxt�b ��,j+ j+ �&, �\ ��[�ZCD�Y�\ ,0 _makenumberformatter _makeNumberFormatter�[ �XE�X E  �W�V�W 0 formatstyle formatStyle�V 0 
localecode 
localeCode�Z  C �U�T�S�U 0 formatstyle formatStyle�T 0 
localecode 
localeCode�S 0 asocformatter asocFormatterD �R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<%�;�:
�R misccura�Q &0 nsnumberformatter NSNumberFormatter�P 	0 alloc  �O 0 init  
�N FNStFNS0�M 40 nsnumberformatternostyle NSNumberFormatterNoStyle�L "0 setnumberstyle_ setNumberStyle_
�K FNStFNS1�J >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle
�I FNStFNS2�H @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle
�G FNStFNS3�F >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle
�E FNStFNS4�D D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle
�C FNStFNS5�B @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle
�A 
errn�@�Y
�? 
erob
�> 
errt
�= 
enum�< �; &0 aslocaleparameter asLocaleParameter�: 0 
setlocale_ 
setLocale_�Y ���,j+ j+ E�O��  ���,k+ Y q��  ���,k+ Y `��  ���,k+ Y O��  ���,k+ Y >��  ���,k+ Y -��  ��a ,k+ Y )a a a �a a a a O�b  �a l+ k+ O�- �92�8�7FG�6
�9 .Fmt:FNumnull���     nmbr�8 0 	thenumber 	theNumber�7 �5HI
�5 
UsinH {�4�3�2�4 0 formatstyle formatStyle�3  
�2 FNStFNS0I �1J�0
�1 
LocaJ {�/�.�-�/ 0 
localecode 
localeCode�.  
�- 
msng�0  F 	�,�+�*�)�(�'�&�%�$�, 0 	thenumber 	theNumber�+ 0 formatstyle formatStyle�* 0 
localecode 
localeCode�) 0 asocformatter asocFormatter�( 0 
asocstring 
asocString�' 0 etext eText�& 0 enumber eNumber�% 0 efrom eFrom�$ 
0 eto eToG V�#�"�!� ����s��K����# &0 asnumberparameter asNumberParameter�" ,0 _makenumberformatter _makeNumberFormatter�! &0 stringfromnumber_ stringFromNumber_
�  
msng
� 
errn��Y
� 
erob� 
� 
ctxt� 0 etext eTextK ��L
� 
errn� 0 enumber eNumberL ��M
� 
erob� 0 efrom eFromM ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �6 N =b  ��l+ E�O*��l+ E�O��k+ E�O��  )�����Y hO��&W X  *������+ . ����NO�
� .Fmt:PNumnull���     ctxt� 0 thetext theText� �PQ
� 
UsinP {��
�	� 0 formatstyle formatStyle�
  
�	 FNStFNS0Q �R�
� 
LocaR {���� 0 
localecode 
localeCode�  
� 
msng�  N ���� ����������������� 0 thetext theText� 0 formatstyle formatStyle� 0 
localecode 
localeCode�  0 asoctext asocText�� 0 asocformatter asocFormatter�� 0 
asocnumber 
asocNumber�� 0 
formatname 
formatName�� $0 localeidentifier localeIdentifier�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToO *���������������������������������������.68��������FHJ����S_����
�� misccura�� 0 nsstring NSString�� "0 astextparameter asTextParameter�� &0 stringwithstring_ stringWithString_�� ,0 _makenumberformatter _makeNumberFormatter�� &0 numberfromstring_ numberFromString_
�� 
msng
�� FNStFNS0
�� FNStFNS1
�� FNStFNS2
�� FNStFNS3
�� FNStFNS4
�� FNStFNS5�� 
0 locale  �� $0 localeidentifier localeIdentifier
�� 
ctxt
�� 
leng
�� 
errn���Y
�� 
erob�� 
�� 
****�� 0 etext eTextS ����T
�� 
errn�� 0 enumber eNumberT ����U
�� 
erob�� 0 efrom eFromU ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � � ���,b  ��l+ k+ E�O*��l+ E�O��k+ E�O��  ���  �E�Y Q��  �E�Y E��  �E�Y 9��  �E�Y -�a   
a E�Y �a   
a E�Y a �%a %E�O�j+ j+ a &E�O�a ,j  
a E�Y a �%a %E�O)a a a �a  a !�%a "%�%a #%Y hO�a $&W X % &*a '����a (+ )/ �������VW���� 0 
_datestyle 
_dateStyle�� ��X�� X  ������ 0 	theformat 	theFormat�� 0 formatstyles formatStyles��  V �������������� 0 	theformat 	theFormat�� 0 formatstyles formatStyles�� 0 aref aRef�� 0 
formattype 
formatType�� 0 isdate isDate�� 0 
asocoption 
asocOptionW �����������������������������������������������
�� FDStFDS1
�� misccura�� 60 nsdateformattershortstyle NSDateFormatterShortStyle
�� FDStFDS2�� 80 nsdateformattermediumstyle NSDateFormatterMediumStyle
�� FDStFDS3�� 40 nsdateformatterlongstyle NSDateFormatterLongStyle
�� FDStFDS4�� 40 nsdateformatterfullstyle NSDateFormatterFullStyle
�� FDStFDS6
�� FDStFDS7
�� FDStFDS8
�� FDStFDS9�� 
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
errn���Y
�� 
erob
�� 
errt
�� 
enum�� �� � t�e��,mv�e��,mv�e��,mv�e��,mv�f��,mv�f��,mv�f��,mv�f��,mv�v[��l kh �E[�k/E�Z[�l/E�Z[�m/E�ZO��  
��lvY h[OY��O)a a a �a a a a 0 ��
����YZ���� (0 _makedateformatter _makeDateFormatter�� ��[�� [  ������ 0 	theformat 	theFormat�� 0 
localecode 
localeCode��  Y 	�������������������� 0 	theformat 	theFormat�� 0 
localecode 
localeCode�� 0 asocformatter asocFormatter�� 0 formattypes formatTypes�� 0 	isdateset 	isDateSet�� 0 	istimeset 	isTimeSet�� 0 aref aRef�� 0 isdate isDate�� 0 
asocoption 
asocOptionZ ������������������������������������s�����������
�� misccura�� "0 nsdateformatter NSDateFormatter�� 	0 alloc  �� 0 init  
�� 
kocl
�� 
ctxt
�� .corecnte****       ****�� "0 aslistparameter asListParameter�� 00 nsdateformatternostyle NSDateFormatterNoStyle�� 0 setdatestyle_ setDateStyle_�� 0 settimestyle_ setTimeStyle_
�� 
cobj
�� 
pcnt�� 0 
_datestyle 
_dateStyle
�� 
errn���Y
�� 
erob�� �� "0 astextparameter asTextParameter��  0 setdateformat_ setDateFormat_�� &0 aslocaleparameter asLocaleParameter�� 0 
setlocale_ 
setLocale_�� ���,j+ j+ E�O�kv��l j  �b  �k+ E�O���,k+ 	O���,k+ 
OfflvE[�k/E�Z[�l/E�ZO v�[��l kh *��,�l+ E[�k/E�Z[�l/E�ZO� &� )��a �a a Y hO��k+ 	OeE�Y #� )��a �a a Y hO��k+ 
OeE�[OY��Y �b  �a l+ k+ O�b  �a l+ k+ O�1 �������\]��
�� .Fmt:FDatnull���     ldt �� 0 thedate theDate�� ��^_
�� 
Usin^ {����`�� 0 	theformat 	theFormat��  ` ��a�� a  ��
�� FDStFDS1_ ��b��
�� 
Locab {�������� 0 
localecode 
localeCode��  
�� 
msng��  \ ��~�}�|�{�z�y�x� 0 thedate theDate�~ 0 	theformat 	theFormat�} 0 
localecode 
localeCode�| 0 asocformatter asocFormatter�{ 0 etext eText�z 0 enumber eNumber�y 0 efrom eFrom�x 
0 eto eTo] 
��w�v�u�t�sc�r�q�w "0 asdateparameter asDateParameter�v (0 _makedateformatter _makeDateFormatter�u "0 stringfromdate_ stringFromDate_
�t 
ctxt�s 0 etext eTextc �p�od
�p 
errn�o 0 enumber eNumberd �n�me
�n 
erob�m 0 efrom eFrome �l�k�j
�l 
errt�k 
0 eto eTo�j  �r �q 
0 _error  �� 7 &b  ��l+ E�O*��l+ E�O��k+ �&W X  *礥���+ 	2 �i�h�gfg�f
�i .Fmt:PDatnull���     ctxt�h 0 thetext theText�g �ehi
�e 
Usinh {�d�cj�d 0 	theformat 	theFormat�c  j �bk�b k  �a
�a FDStFDS1i �`l�_
�` 
Local {�^�]�\�^ 0 
localecode 
localeCode�]  
�\ 
msng�_  f �[�Z�Y�X�W�V�U�T�S�R�Q�[ 0 thetext theText�Z 0 	theformat 	theFormat�Y 0 
localecode 
localeCode�X 0 asoctext asocText�W 0 asocformatter asocFormatter�V 0 asocdate asocDate�U $0 localeidentifier localeIdentifier�T 0 etext eText�S 0 enumber eNumber�R 0 efrom eFrom�Q 
0 eto eTog �P�O5�N�M�L�K�J�I�H�G�Femo�E�D�C�B}�A���@�?m��>�=
�P misccura�O 0 nsstring NSString�N "0 astextparameter asTextParameter�M &0 stringwithstring_ stringWithString_�L (0 _makedateformatter _makeDateFormatter�K "0 datefromstring_ dateFromString_
�J 
msng�I 
0 locale  �H $0 localeidentifier localeIdentifier
�G 
ctxt
�F 
leng
�E 
errn�D�Y
�C 
erob�B �A 0 
dateformat 
dateFormat
�@ 
ldt �? 0 etext eTextm �<�;n
�< 
errn�; 0 enumber eNumbern �:�9o
�: 
erob�9 0 efrom eFromo �8�7�6
�8 
errt�7 
0 eto eTo�6  �> �= 
0 _error  �f � ���,b  ��l+ k+ E�O*��l+ E�O��k+ E�O��  I�j+ j+ 	�&E�O��,j  �E�Y 	��%�%E�O)�a a �a a �j+ %a %�%a %Y hO�a &W X  *a ����a + 3 �5��4�3pq�2
�5 .Fmt:FJSNnull���     ****�4 0 
jsonobject 
jsonObject�3 �1r�0
�1 
PrPrr {�/�.�-�/ "0 isprettyprinted isPrettyPrinted�.  
�- boovfals�0  p 	�,�+�*�)�(�'�&�%�$�, 0 
jsonobject 
jsonObject�+ "0 isprettyprinted isPrettyPrinted�* 0 writeoptions writeOptions�) 0 thedata theData�( 0 theerror theError�' 0 etext eText�& 0 enumber eNumber�% 0 efrom eFrom�$ 
0 eto eToq ��#�"�!� �����������������s1���# (0 asbooleanparameter asBooleanParameter
�" misccura�! 80 nsjsonwritingprettyprinted NSJSONWritingPrettyPrinted�  *0 nsjsonserialization NSJSONSerialization� (0 isvalidjsonobject_ isValidJSONObject_
� 
errn��Y
� 
erob� 
� 
obj � F0 !datawithjsonobject_options_error_ !dataWithJSONObject_options_error_
� 
cobj
� 
msng� ,0 localizeddescription localizedDescription� 0 nsstring NSString� 	0 alloc  � ,0 nsutf8stringencoding NSUTF8StringEncoding� 00 initwithdata_encoding_ initWithData_encoding_
� 
ctxt� 0 etext eTexts ��t
� 
errn� 0 enumber eNumbert ��
u
� 
erob�
 0 efrom eFromu �	��
�	 
errt� 
0 eto eTo�  � � 
0 _error  �2 � �b  ��l+  
��,E�Y jE�O��,�k+  )�����Y hO��,���m+ E[�k/E�Z[�l/E�ZO��  )�����j+ %a %Y hO�a ,j+ ��a ,l+ a &W X  *a ����a + 4 �A��vw�
� .Fmt:PJSNnull���     ctxt� 0 jsontext jsonText� �x�
� 
Fragx {� �����  *0 arefragmentsallowed areFragmentsAllowed��  
�� boovfals�  v 
���������������������� 0 jsontext jsonText�� *0 arefragmentsallowed areFragmentsAllowed�� 0 readoptions readOptions�� 0 thedata theData�� 0 
jsonobject 
jsonObject�� 0 theerror theError�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTow V��c����������������������������������������y������� "0 astextparameter asTextParameter�� (0 asbooleanparameter asBooleanParameter
�� misccura�� :0 nsjsonreadingallowfragments NSJSONReadingAllowFragments�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� ,0 nsutf8stringencoding NSUTF8StringEncoding�� (0 datausingencoding_ dataUsingEncoding_�� *0 nsjsonserialization NSJSONSerialization
�� 
obj �� F0 !jsonobjectwithdata_options_error_ !JSONObjectWithData_options_error_
�� 
cobj
�� 
msng
�� 
errn���Y
�� 
erob�� �� ,0 localizeddescription localizedDescription
�� 
****�� 0 etext eTexty ����z
�� 
errn�� 0 enumber eNumberz ����{
�� 
erob�� 0 efrom eFrom{ ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � � �b  ��l+ E�Ob  ��l+  
��,E�Y jE�O��,�k+ ��,k+ 	E�O��,���m+ E[�k/E�Z[�l/E�ZO��  )�a a �a a �j+ %a %Y hO�a &W X  *a ����a + 5 �������|}��
�� .Fmt:FLitnull��� ��� null��  �� ������
�� 
For_�� 0 thevalue theValue��  | ���������������� 0 thevalue theValue�� 0 oldtids oldTIDs�� 0 	textitems 	textItems�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo} *��������������#��(����+��������?��M[i����~�����������������������
�� 
kocl
�� 
obj 
�� .corecnte****       ****
�� 
capp
�� 
bool
�� 
reco
�� 
scpt
�� 
pnam��  ��  
�� 
pcls
�� 
ctxt
�� 
ascr
�� 
txdl
�� 
citm
�� 
rdat~ ������
�� 
errn���\��  
�� 
want
�� 
ocid�� 0 description  
�� 
For_
�� 
seld
�� .Fmt:FLitnull��� ��� null�� 0 etext eText �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��O:�kv��l j 	 �kv��l j �&	 �kv��l j �& ��kv��l j  ��,%�%W 	X 
 �Y ���  c�a ,E�Oa �a ,FO�a -E�Oa �a ,FO��&E�Oa �a ,FO�a -E�Oa �a ,FO��&E�O��a ,FOa �%a %Y !�a   	a Y  	��&W X 
 hY hO�kv��l j	 ��&a ,a  �& 4 a �j+ �&%a %W X 
 a  *a !��&a ",l #%Y hOa $W X % &*a '����a (+ )6 ����������
�� .Fmt:FTxtnull���     ctxt�� 0 templatetext templateText�� ������
�� 
Usin�� 0 	thevalues 	theValues��  � ������������������������������������ 0 templatetext templateText�� 0 	thevalues 	theValues�� 
0 regexp  �� 0 
asocstring 
asocString��  0 asocmatcharray asocMatchArray�� 0 resulttexts resultTexts�� 0 
startindex 
startIndex�� 0 i  �� 0 
matchrange 
matchRange�� 0 thetoken theToken�� 0 theitem theItem�� 0 oldtids oldTIDs�� 0 
resulttext 
resultText�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� $������,������������[\������������~��}�|�{�z��y�x�w�v�u��t��s�r�� "0 aslistparameter asListParameter
�� misccura�� *0 nsregularexpression NSRegularExpression
�� 
msng�� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 rangeatindex_ rangeAtIndex_�� 0 location  �� � *0 substringwithrange_ substringWithRange_
�~ 
ctxt
�} 
cobj
�| 
cha 
�{ 
long�z  � �q�p�o
�q 
errn�p�\�o  
�y 
For_
�x .Fmt:FLitnull��� ��� null�w *0 substringfromindex_ substringFromIndex_
�v 
ascr
�u 
txdl�t 0 etext eText� �n�m�
�n 
errn�m 0 enumber eNumber� �l�k�
�l 
erob�k 0 efrom eFrom� �j�i�h
�j 
errt�i 
0 eto eTo�h  �s �r 
0 _error  ��4b  �k+  E�O��,�j�m+ E�O��,�k+ E�O��jj�j+ lvm+ 	E�OjvE�OjE�O�� � �j�j+ kkh ��k+ jk+ E�O���j+ �a k+ a &�6FO��k+ a &E�O�a   	��6FY 3�a �a i/a &/E�O �a &�6FW X  *a �l �6FO�j+ �j+ E�[OY�vO��k+ a &�6FO_ a ,E�Oa _ a ,FO�a &E�O�_ a ,FO�VW X   *a !���] a "+ # ascr  ��ޭ