FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� Text -- commonly-used text processing commands

Notes: 

- When matching text item delimiters in text value, AppleScript uses the current scope's existing considering/ignoring case, diacriticals, hyphens, punctuation, white space and numeric strings settings; thus, wrapping a `search text` command in different considering/ignoring blocks can produce different results. For example, `search text "fud" for "F" will normally match the first character since AppleScript uses case-insensitive matching by default, whereas enclosing it in a `considering case` block will cause the same command to return zero matches. Conversely, `search text "f ud" for "fu"` will normally return zero matches as AppleScript considers white space by default, but when enclosed in an `ignoring white space` block will match the first three characters: "f u". This is how AppleScript is designed to work, but users need to be reminded of this as considering/ignoring blocks affect ALL script handlers called within that block, including nested calls (and all to any osax and application handlers that understand considering/ignoring attributes).

- Unlike AS text values, which preserve original Unicode normalization but ignore differences in form when comparing and counting, NSString and NSRegularExpression don't ignore normalization differences when comparing for equality. Therefore, handlers such as `search text`, `split text`, etc. that perform comparison operations on/using these Cocoa classes must normalize their input and pattern text first. (Be aware that this means that these commands may output text that uses different normalization form to input text; this shouldn't affect AppleScript itself, but might be a consideration when using that text elsewhere, e.g. in text files or scriptable apps.)


TO DO:

- decide if predefined considering/ignoring options in `search text`, etc. should consider or ignore diacriticals and numeric strings; once decided, use same combinations for List library's text comparator for consistency? (currently Text library's `case [in]sensitivity` options consider diacriticals for equality whereas List library ignores them for ordering)


- what about `normalize text` command that wraps NSString's stringByFoldingWithOptions:locale:? (e.g. for removing diacriticals); also incorporate unicode normalization into this rather than having separate precompose/decompose commands; also merge the `normalize line breaks` command's functionality in it. 



- should `format text` support "\\n", "\\t", "\\U", etc. (yes, even if it means it's a superset of `search text` templates, though even those could be extended by routing through this first, in which case `using` parameter should be optional)? how should backslashed characters that are non-special be treated? (note that the template syntax is designed to be same as that used by `search text`, which uses NSRegularExpression's template syntax); need to give some thought to this, and whether a different escape character (^) should be used throughout to avoid need for double backslashing (since AS already uses backslash as escape character in text literals), which is hard to read and error prone (downside is portability, as backslash escaping is already standard in regexps); note that caching of recently (last only?) converted format texts could be provided (though not using NSDictionary)

	- probably best to use "^n", "^t", "^r", "^x12", "^u1234", "^U123456", "^1"..."^9", "^^"; while incompatible with `search text` templates, it would make `format text` much more useful


- fix inconsistency: `search text`'s `for` parameter doesn't allow list of text but `split text`'s `using` parameter does, even though both commands are supposed to support same matching options for consistency

- should regexps use NSRegularExpressionAnchorsMatchLines flag as standard (i.e. "^" and "$" would always match per-line, and "\A" and "\Z" would be used to match start and end of text)? given that users will frequently need to include "(?i)" flag to match case-insensitively, it may be as well to leave them to include `m` flag as well

- should line break normalization (including `join paragraphs`) also support 'Unicode line break', 'Unicode paragraph break' options?

     � 	 	!:   T e x t   - -   c o m m o n l y - u s e d   t e x t   p r o c e s s i n g   c o m m a n d s 
 
 N o t e s :   
 
 -   W h e n   m a t c h i n g   t e x t   i t e m   d e l i m i t e r s   i n   t e x t   v a l u e ,   A p p l e S c r i p t   u s e s   t h e   c u r r e n t   s c o p e ' s   e x i s t i n g   c o n s i d e r i n g / i g n o r i n g   c a s e ,   d i a c r i t i c a l s ,   h y p h e n s ,   p u n c t u a t i o n ,   w h i t e   s p a c e   a n d   n u m e r i c   s t r i n g s   s e t t i n g s ;   t h u s ,   w r a p p i n g   a   ` s e a r c h   t e x t `   c o m m a n d   i n   d i f f e r e n t   c o n s i d e r i n g / i g n o r i n g   b l o c k s   c a n   p r o d u c e   d i f f e r e n t   r e s u l t s .   F o r   e x a m p l e ,   ` s e a r c h   t e x t   " f u d "   f o r   " F "   w i l l   n o r m a l l y   m a t c h   t h e   f i r s t   c h a r a c t e r   s i n c e   A p p l e S c r i p t   u s e s   c a s e - i n s e n s i t i v e   m a t c h i n g   b y   d e f a u l t ,   w h e r e a s   e n c l o s i n g   i t   i n   a   ` c o n s i d e r i n g   c a s e `   b l o c k   w i l l   c a u s e   t h e   s a m e   c o m m a n d   t o   r e t u r n   z e r o   m a t c h e s .   C o n v e r s e l y ,   ` s e a r c h   t e x t   " f   u d "   f o r   " f u " `   w i l l   n o r m a l l y   r e t u r n   z e r o   m a t c h e s   a s   A p p l e S c r i p t   c o n s i d e r s   w h i t e   s p a c e   b y   d e f a u l t ,   b u t   w h e n   e n c l o s e d   i n   a n   ` i g n o r i n g   w h i t e   s p a c e `   b l o c k   w i l l   m a t c h   t h e   f i r s t   t h r e e   c h a r a c t e r s :   " f   u " .   T h i s   i s   h o w   A p p l e S c r i p t   i s   d e s i g n e d   t o   w o r k ,   b u t   u s e r s   n e e d   t o   b e   r e m i n d e d   o f   t h i s   a s   c o n s i d e r i n g / i g n o r i n g   b l o c k s   a f f e c t   A L L   s c r i p t   h a n d l e r s   c a l l e d   w i t h i n   t h a t   b l o c k ,   i n c l u d i n g   n e s t e d   c a l l s   ( a n d   a l l   t o   a n y   o s a x   a n d   a p p l i c a t i o n   h a n d l e r s   t h a t   u n d e r s t a n d   c o n s i d e r i n g / i g n o r i n g   a t t r i b u t e s ) . 
 
 -   U n l i k e   A S   t e x t   v a l u e s ,   w h i c h   p r e s e r v e   o r i g i n a l   U n i c o d e   n o r m a l i z a t i o n   b u t   i g n o r e   d i f f e r e n c e s   i n   f o r m   w h e n   c o m p a r i n g   a n d   c o u n t i n g ,   N S S t r i n g   a n d   N S R e g u l a r E x p r e s s i o n   d o n ' t   i g n o r e   n o r m a l i z a t i o n   d i f f e r e n c e s   w h e n   c o m p a r i n g   f o r   e q u a l i t y .   T h e r e f o r e ,   h a n d l e r s   s u c h   a s   ` s e a r c h   t e x t ` ,   ` s p l i t   t e x t ` ,   e t c .   t h a t   p e r f o r m   c o m p a r i s o n   o p e r a t i o n s   o n / u s i n g   t h e s e   C o c o a   c l a s s e s   m u s t   n o r m a l i z e   t h e i r   i n p u t   a n d   p a t t e r n   t e x t   f i r s t .   ( B e   a w a r e   t h a t   t h i s   m e a n s   t h a t   t h e s e   c o m m a n d s   m a y   o u t p u t   t e x t   t h a t   u s e s   d i f f e r e n t   n o r m a l i z a t i o n   f o r m   t o   i n p u t   t e x t ;   t h i s   s h o u l d n ' t   a f f e c t   A p p l e S c r i p t   i t s e l f ,   b u t   m i g h t   b e   a   c o n s i d e r a t i o n   w h e n   u s i n g   t h a t   t e x t   e l s e w h e r e ,   e . g .   i n   t e x t   f i l e s   o r   s c r i p t a b l e   a p p s . ) 
 
 
 T O   D O : 
 
 -   d e c i d e   i f   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   i n   ` s e a r c h   t e x t ` ,   e t c .   s h o u l d   c o n s i d e r   o r   i g n o r e   d i a c r i t i c a l s   a n d   n u m e r i c   s t r i n g s ;   o n c e   d e c i d e d ,   u s e   s a m e   c o m b i n a t i o n s   f o r   L i s t   l i b r a r y ' s   t e x t   c o m p a r a t o r   f o r   c o n s i s t e n c y ?   ( c u r r e n t l y   T e x t   l i b r a r y ' s   ` c a s e   [ i n ] s e n s i t i v i t y `   o p t i o n s   c o n s i d e r   d i a c r i t i c a l s   f o r   e q u a l i t y   w h e r e a s   L i s t   l i b r a r y   i g n o r e s   t h e m   f o r   o r d e r i n g ) 
 
 
 -   w h a t   a b o u t   ` n o r m a l i z e   t e x t `   c o m m a n d   t h a t   w r a p s   N S S t r i n g ' s   s t r i n g B y F o l d i n g W i t h O p t i o n s : l o c a l e : ?   ( e . g .   f o r   r e m o v i n g   d i a c r i t i c a l s ) ;   a l s o   i n c o r p o r a t e   u n i c o d e   n o r m a l i z a t i o n   i n t o   t h i s   r a t h e r   t h a n   h a v i n g   s e p a r a t e   p r e c o m p o s e / d e c o m p o s e   c o m m a n d s ;   a l s o   m e r g e   t h e   ` n o r m a l i z e   l i n e   b r e a k s `   c o m m a n d ' s   f u n c t i o n a l i t y   i n   i t .   
 
 
 
 -   s h o u l d   ` f o r m a t   t e x t `   s u p p o r t   " \ \ n " ,   " \ \ t " ,   " \ \ U " ,   e t c .   ( y e s ,   e v e n   i f   i t   m e a n s   i t ' s   a   s u p e r s e t   o f   ` s e a r c h   t e x t `   t e m p l a t e s ,   t h o u g h   e v e n   t h o s e   c o u l d   b e   e x t e n d e d   b y   r o u t i n g   t h r o u g h   t h i s   f i r s t ,   i n   w h i c h   c a s e   ` u s i n g `   p a r a m e t e r   s h o u l d   b e   o p t i o n a l ) ?   h o w   s h o u l d   b a c k s l a s h e d   c h a r a c t e r s   t h a t   a r e   n o n - s p e c i a l   b e   t r e a t e d ?   ( n o t e   t h a t   t h e   t e m p l a t e   s y n t a x   i s   d e s i g n e d   t o   b e   s a m e   a s   t h a t   u s e d   b y   ` s e a r c h   t e x t ` ,   w h i c h   u s e s   N S R e g u l a r E x p r e s s i o n ' s   t e m p l a t e   s y n t a x ) ;   n e e d   t o   g i v e   s o m e   t h o u g h t   t o   t h i s ,   a n d   w h e t h e r   a   d i f f e r e n t   e s c a p e   c h a r a c t e r   ( ^ )   s h o u l d   b e   u s e d   t h r o u g h o u t   t o   a v o i d   n e e d   f o r   d o u b l e   b a c k s l a s h i n g   ( s i n c e   A S   a l r e a d y   u s e s   b a c k s l a s h   a s   e s c a p e   c h a r a c t e r   i n   t e x t   l i t e r a l s ) ,   w h i c h   i s   h a r d   t o   r e a d   a n d   e r r o r   p r o n e   ( d o w n s i d e   i s   p o r t a b i l i t y ,   a s   b a c k s l a s h   e s c a p i n g   i s   a l r e a d y   s t a n d a r d   i n   r e g e x p s ) ;   n o t e   t h a t   c a c h i n g   o f   r e c e n t l y   ( l a s t   o n l y ? )   c o n v e r t e d   f o r m a t   t e x t s   c o u l d   b e   p r o v i d e d   ( t h o u g h   n o t   u s i n g   N S D i c t i o n a r y ) 
 
 	 -   p r o b a b l y   b e s t   t o   u s e   " ^ n " ,   " ^ t " ,   " ^ r " ,   " ^ x 1 2 " ,   " ^ u 1 2 3 4 " ,   " ^ U 1 2 3 4 5 6 " ,   " ^ 1 " . . . " ^ 9 " ,   " ^ ^ " ;   w h i l e   i n c o m p a t i b l e   w i t h   ` s e a r c h   t e x t `   t e m p l a t e s ,   i t   w o u l d   m a k e   ` f o r m a t   t e x t `   m u c h   m o r e   u s e f u l 
 
 
 -   f i x   i n c o n s i s t e n c y :   ` s e a r c h   t e x t ` ' s   ` f o r `   p a r a m e t e r   d o e s n ' t   a l l o w   l i s t   o f   t e x t   b u t   ` s p l i t   t e x t ` ' s   ` u s i n g `   p a r a m e t e r   d o e s ,   e v e n   t h o u g h   b o t h   c o m m a n d s   a r e   s u p p o s e d   t o   s u p p o r t   s a m e   m a t c h i n g   o p t i o n s   f o r   c o n s i s t e n c y 
 
 -   s h o u l d   r e g e x p s   u s e   N S R e g u l a r E x p r e s s i o n A n c h o r s M a t c h L i n e s   f l a g   a s   s t a n d a r d   ( i . e .   " ^ "   a n d   " $ "   w o u l d   a l w a y s   m a t c h   p e r - l i n e ,   a n d   " \ A "   a n d   " \ Z "   w o u l d   b e   u s e d   t o   m a t c h   s t a r t   a n d   e n d   o f   t e x t ) ?   g i v e n   t h a t   u s e r s   w i l l   f r e q u e n t l y   n e e d   t o   i n c l u d e   " ( ? i ) "   f l a g   t o   m a t c h   c a s e - i n s e n s i t i v e l y ,   i t   m a y   b e   a s   w e l l   t o   l e a v e   t h e m   t o   i n c l u d e   ` m `   f l a g   a s   w e l l 
 
 -   s h o u l d   l i n e   b r e a k   n o r m a l i z a t i o n   ( i n c l u d i n g   ` j o i n   p a r a g r a p h s ` )   a l s o   s u p p o r t   ' U n i c o d e   l i n e   b r e a k ' ,   ' U n i c o d e   p a r a g r a p h   b r e a k '   o p t i o n s ? 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      record types     �      r e c o r d   t y p e s     !   l     ��������  ��  ��   !  " # " j    �� $�� (0 _unmatchedtexttype _UnmatchedTextType $ m    ��
�� 
TxtU #  % & % j    �� '�� $0 _matchedtexttype _MatchedTextType ' m    ��
�� 
TxtM &  ( ) ( j    �� *�� &0 _matchedgrouptype _MatchedGroupType * m    ��
�� 
TxtG )  + , + l     ��������  ��  ��   ,  - . - l     ��������  ��  ��   .  / 0 / l     �� 1 2��   1 J D--------------------------------------------------------------------    2 � 3 3 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 0  4 5 4 l     �� 6 7��   6   support    7 � 8 8    s u p p o r t 5  9 : 9 l     ��������  ��  ��   :  ; < ; l      = > ? = j    �� @�� 0 _support   @ N     A A 4    �� B
�� 
scpt B m     C C � D D  T y p e S u p p o r t > "  used for parameter checking    ? � E E 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g <  F G F l     ��������  ��  ��   G  H I H l     ��������  ��  ��   I  J K J i    L M L I      �� N���� 
0 _error   N  O P O o      ���� 0 handlername handlerName P  Q R Q o      ���� 0 etext eText R  S T S o      ���� 0 enumber eNumber T  U V U o      ���� 0 efrom eFrom V  W�� W o      ���� 
0 eto eTo��  ��   M n     X Y X I    �� Z���� &0 throwcommanderror throwCommandError Z  [ \ [ m     ] ] � ^ ^  T e x t \  _ ` _ o    ���� 0 handlername handlerName `  a b a o    ���� 0 etext eText b  c d c o    	���� 0 enumber eNumber d  e f e o   	 
���� 0 efrom eFrom f  g�� g o   
 ���� 
0 eto eTo��  ��   Y o     ���� 0 _support   K  h i h l     ��������  ��  ��   i  j k j l     �� l m��   l J D--------------------------------------------------------------------    m � n n � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - k  o p o l     �� q r��   q   Find and Replace Suite    r � s s .   F i n d   a n d   R e p l a c e   S u i t e p  t u t l     ��������  ��  ��   u  v w v l     �� x y��   x   find pattern    y � z z    f i n d   p a t t e r n w  { | { l     ��������  ��  ��   |  } ~ } i   "  �  I      �� ����� $0 _matchinforecord _matchInfoRecord �  � � � o      ���� 0 
asocstring 
asocString �  � � � o      ����  0 asocmatchrange asocMatchRange �  � � � o      ���� 0 
textoffset 
textOffset �  ��� � o      ���� 0 
recordtype 
recordType��  ��   � k     # � �  � � � r     
 � � � c      � � � l     ����� � n     � � � I    �� ����� *0 substringwithrange_ substringWithRange_ �  ��� � o    ����  0 asocmatchrange asocMatchRange��  ��   � o     ���� 0 
asocstring 
asocString��  ��   � m    ��
�� 
ctxt � o      ���� 0 	foundtext 	foundText �  � � � l    � � � � r     � � � [     � � � o    ���� 0 
textoffset 
textOffset � l    ����� � n     � � � 1    ��
�� 
leng � o    ���� 0 	foundtext 	foundText��  ��   � o      ����  0 nexttextoffset nextTextOffset � : 4 calculate the start index of the next AS text range    � � � � h   c a l c u l a t e   t h e   s t a r t   i n d e x   o f   t h e   n e x t   A S   t e x t   r a n g e �  � � � l   �� � ���   �
 note: record keys are identifiers, not keywords, as 1. library-defined keywords are a huge pain to use outside of `tell script...` blocks and 2. importing the library's terminology into the global namespace via `use script...` is an excellent way to create keyword conflicts; only the class value is a keyword since Script Editor/OSAKit don't correctly handle records that use non-typename values (e.g. `{class:"matched text",...}`), but this shouldn't impact usability as it's really only used for informational purposes    � � � �   n o t e :   r e c o r d   k e y s   a r e   i d e n t i f i e r s ,   n o t   k e y w o r d s ,   a s   1 .   l i b r a r y - d e f i n e d   k e y w o r d s   a r e   a   h u g e   p a i n   t o   u s e   o u t s i d e   o f   ` t e l l   s c r i p t . . . `   b l o c k s   a n d   2 .   i m p o r t i n g   t h e   l i b r a r y ' s   t e r m i n o l o g y   i n t o   t h e   g l o b a l   n a m e s p a c e   v i a   ` u s e   s c r i p t . . . `   i s   a n   e x c e l l e n t   w a y   t o   c r e a t e   k e y w o r d   c o n f l i c t s ;   o n l y   t h e   c l a s s   v a l u e   i s   a   k e y w o r d   s i n c e   S c r i p t   E d i t o r / O S A K i t   d o n ' t   c o r r e c t l y   h a n d l e   r e c o r d s   t h a t   u s e   n o n - t y p e n a m e   v a l u e s   ( e . g .   ` { c l a s s : " m a t c h e d   t e x t " , . . . } ` ) ,   b u t   t h i s   s h o u l d n ' t   i m p a c t   u s a b i l i t y   a s   i t ' s   r e a l l y   o n l y   u s e d   f o r   i n f o r m a t i o n a l   p u r p o s e s �  ��� � L    # � � J    " � �  � � � K     � � �� � �
�� 
pcls � o    ���� 0 
recordtype 
recordType � �� � ��� 0 
startindex 
startIndex � o    ���� 0 
textoffset 
textOffset � �� � ��� 0 endindex endIndex � \     � � � o    ����  0 nexttextoffset nextTextOffset � m    ����  � �� ����� 0 	foundtext 	foundText � o    ���� 0 	foundtext 	foundText��   �  ��� � o     ����  0 nexttextoffset nextTextOffset��  ��   ~  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  # & � � � I      �� ����� 0 _matchrecords _matchRecords �  � � � o      ���� 0 
asocstring 
asocString �  � � � o      ����  0 asocmatchrange asocMatchRange �  � � � o      ����  0 asocstartindex asocStartIndex �  � � � o      ���� 0 
textoffset 
textOffset �  � � � o      ���� (0 nonmatchrecordtype nonMatchRecordType �  ��� � o      ���� "0 matchrecordtype matchRecordType��  ��   � k     V � �  � � � l     �� � ���   �TN important: NSString character indexes aren't guaranteed to be same as AS character indexes (AS sensibly counts glyphs but NSString only counts UTF16 codepoints, and a glyph may be composed of more than one codepoint), so reconstruct both non-matching and matching AS text values, and calculate accurate AS character ranges from those    � � � ��   i m p o r t a n t :   N S S t r i n g   c h a r a c t e r   i n d e x e s   a r e n ' t   g u a r a n t e e d   t o   b e   s a m e   a s   A S   c h a r a c t e r   i n d e x e s   ( A S   s e n s i b l y   c o u n t s   g l y p h s   b u t   N S S t r i n g   o n l y   c o u n t s   U T F 1 6   c o d e p o i n t s ,   a n d   a   g l y p h   m a y   b e   c o m p o s e d   o f   m o r e   t h a n   o n e   c o d e p o i n t ) ,   s o   r e c o n s t r u c t   b o t h   n o n - m a t c h i n g   a n d   m a t c h i n g   A S   t e x t   v a l u e s ,   a n d   c a l c u l a t e   a c c u r a t e   A S   c h a r a c t e r   r a n g e s   f r o m   t h o s e �  � � � r      � � � n     � � � I    �������� 0 location  ��  ��   � o     ��  0 asocmatchrange asocMatchRange � o      �~�~  0 asocmatchstart asocMatchStart �  � � � r     � � � [     � � � o    	�}�}  0 asocmatchstart asocMatchStart � l  	  ��|�{ � n  	  � � � I   
 �z�y�x�z 
0 length  �y  �x   � o   	 
�w�w  0 asocmatchrange asocMatchRange�|  �{   � o      �v�v 0 asocmatchend asocMatchEnd �  � � � r     � � � K     � � �u � ��u 0 location   � o    �t�t  0 asocstartindex asocStartIndex � �s ��r�s 
0 length   � \     � � � o    �q�q  0 asocmatchstart asocMatchStart � o    �p�p  0 asocstartindex asocStartIndex�r   � o      �o�o &0 asocnonmatchrange asocNonMatchRange �  � � � r    5 � � � I      �n ��m�n $0 _matchinforecord _matchInfoRecord �  � � � o    �l�l 0 
asocstring 
asocString �  � � � o     �k�k &0 asocnonmatchrange asocNonMatchRange �  � � � o     !�j�j 0 
textoffset 
textOffset �  ��i � o   ! "�h�h (0 nonmatchrecordtype nonMatchRecordType�i  �m   � J       � �  � � � o      �g�g 0 nonmatchinfo nonMatchInfo �  ��f � o      �e�e 0 
textoffset 
textOffset�f   �  � � � r   6 N � � � I      �d ��c�d $0 _matchinforecord _matchInfoRecord �  �  � o   7 8�b�b 0 
asocstring 
asocString   o   8 9�a�a  0 asocmatchrange asocMatchRange  o   9 :�`�` 0 
textoffset 
textOffset �_ o   : ;�^�^ "0 matchrecordtype matchRecordType�_  �c   � J        o      �]�] 0 	matchinfo 	matchInfo 	�\	 o      �[�[ 0 
textoffset 
textOffset�\   � 
�Z
 L   O V J   O U  o   O P�Y�Y 0 nonmatchinfo nonMatchInfo  o   P Q�X�X 0 	matchinfo 	matchInfo  o   Q R�W�W 0 asocmatchend asocMatchEnd �V o   R S�U�U 0 
textoffset 
textOffset�V  �Z   �  l     �T�S�R�T  �S  �R    l     �Q�P�O�Q  �P  �O    i  ' * I      �N�M�N &0 _matchedgrouplist _matchedGroupList  o      �L�L 0 
asocstring 
asocString   o      �K�K 0 	asocmatch 	asocMatch  !"! o      �J�J 0 
textoffset 
textOffset" #�I# o      �H�H &0 includenonmatches includeNonMatches�I  �M   k     �$$ %&% r     '(' J     �G�G  ( o      �F�F "0 submatchresults subMatchResults& )*) r    +,+ \    -.- l   
/�E�D/ n   
010 I    
�C�B�A�C  0 numberofranges numberOfRanges�B  �A  1 o    �@�@ 0 	asocmatch 	asocMatch�E  �D  . m   
 �?�? , o      �>�> 0 groupindexes groupIndexes* 232 Z    �45�=�<4 ?    676 o    �;�; 0 groupindexes groupIndexes7 m    �:�:  5 k    �88 9:9 r    ;<; n   =>= I    �9?�8�9 0 rangeatindex_ rangeAtIndex_? @�7@ m    �6�6  �7  �8  > o    �5�5 0 	asocmatch 	asocMatch< o      �4�4 (0 asocfullmatchrange asocFullMatchRange: ABA r    %CDC n   #EFE I    #�3�2�1�3 0 location  �2  �1  F o    �0�0 (0 asocfullmatchrange asocFullMatchRangeD o      �/�/ &0 asocnonmatchstart asocNonMatchStartB GHG r   & /IJI [   & -KLK o   & '�.�. &0 asocnonmatchstart asocNonMatchStartL l  ' ,M�-�,M n  ' ,NON I   ( ,�+�*�)�+ 
0 length  �*  �)  O o   ' (�(�( (0 asocfullmatchrange asocFullMatchRange�-  �,  J o      �'�' $0 asocfullmatchend asocFullMatchEndH PQP Y   0 �R�&ST�%R k   : �UU VWV r   : oXYX I      �$Z�#�$ 0 _matchrecords _matchRecordsZ [\[ o   ; <�"�" 0 
asocstring 
asocString\ ]^] n  < B_`_ I   = B�!a� �! 0 rangeatindex_ rangeAtIndex_a b�b o   = >�� 0 i  �  �   ` o   < =�� 0 	asocmatch 	asocMatch^ cdc o   B C�� &0 asocnonmatchstart asocNonMatchStartd efe o   C D�� 0 
textoffset 
textOffsetf ghg o   D I�� (0 _unmatchedtexttype _UnmatchedTextTypeh i�i o   I N�� &0 _matchedgrouptype _MatchedGroupType�  �#  Y J      jj klk o      �� 0 nonmatchinfo nonMatchInfol mnm o      �� 0 	matchinfo 	matchInfon opo o      �� &0 asocnonmatchstart asocNonMatchStartp q�q o      �� 0 
textoffset 
textOffset�  W rsr Z  p |tu��t o   p q�� &0 includenonmatches includeNonMatchesu r   t xvwv o   t u�� 0 nonmatchinfo nonMatchInfow n      xyx  ;   v wy o   u v�� "0 submatchresults subMatchResults�  �  s z�z r   } �{|{ o   } ~�� 0 	matchinfo 	matchInfo| n      }~}  ;    �~ o   ~ �� "0 submatchresults subMatchResults�  �& 0 i  S m   3 4�
�
 T o   4 5�	�	 0 groupindexes groupIndexes�%  Q � Z   � ������ o   � ��� &0 includenonmatches includeNonMatches� k   � ��� ��� r   � ���� K   � ��� ���� 0 location  � o   � ��� &0 asocnonmatchstart asocNonMatchStart� ���� 
0 length  � \   � ���� o   � �� �  $0 asocfullmatchend asocFullMatchEnd� o   � ����� &0 asocnonmatchstart asocNonMatchStart�  � o      ���� &0 asocnonmatchrange asocNonMatchRange� ���� r   � ���� n   � ���� 4   � ����
�� 
cobj� m   � ����� � I   � �������� $0 _matchinforecord _matchInfoRecord� ��� o   � ����� 0 
asocstring 
asocString� ��� o   � ����� &0 asocnonmatchrange asocNonMatchRange� ��� o   � ����� 0 
textoffset 
textOffset� ���� o   � ����� (0 _unmatchedtexttype _UnmatchedTextType��  ��  � n      ���  ;   � �� o   � ����� "0 submatchresults subMatchResults��  �  �  �  �=  �<  3 ���� L   � ��� o   � ����� "0 submatchresults subMatchResults��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  + .��� I      ������� 0 _findpattern _findPattern� ��� o      ���� 0 thetext theText� ��� o      ���� 0 patterntext patternText� ��� o      ���� &0 includenonmatches includeNonMatches� ���� o      ����  0 includematches includeMatches��  ��  � k    �� ��� r     ��� n    ��� I    ������� (0 asbooleanparameter asBooleanParameter� ��� o    ���� &0 includenonmatches includeNonMatches� ���� m    �� ���  u n m a t c h e d   t e x t��  ��  � o     ���� 0 _support  � o      ���� &0 includenonmatches includeNonMatches� ��� r    ��� n   ��� I    ������� (0 asbooleanparameter asBooleanParameter� ��� o    ����  0 includematches includeMatches� ���� m    �� ���  m a t c h e d   t e x t��  ��  � o    ���� 0 _support  � o      ����  0 includematches includeMatches� ��� r    *��� n   (��� I   ! (������� @0 asnsregularexpressionparameter asNSRegularExpressionParameter� ��� o   ! "���� 0 patterntext patternText� ��� m   " #����  � ���� m   # $�� ���  f o r��  ��  � o    !���� 0 _support  � o      ���� 0 asocpattern asocPattern� ��� r   + 7��� n  + 5��� I   0 5������� ,0 asnormalizednsstring asNormalizedNSString� ���� o   0 1���� 0 thetext theText��  ��  � o   + 0���� 0 _support  � o      ���� 0 
asocstring 
asocString� ��� l  8 ;���� r   8 ;��� m   8 9����  � o      ���� &0 asocnonmatchstart asocNonMatchStart� G A used to calculate NSRanges for non-matching portions of NSString   � ��� �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n g� ��� l  < ?���� r   < ?��� m   < =���� � o      ���� 0 
textoffset 
textOffset� B < used to calculate correct AppleScript start and end indexes   � ��� x   u s e d   t o   c a l c u l a t e   c o r r e c t   A p p l e S c r i p t   s t a r t   a n d   e n d   i n d e x e s� ��� r   @ D��� J   @ B����  � o      ���� 0 
resultlist 
resultList� ��� l  E E������  � @ : iterate over each non-matched + matched range in NSString   � ��� t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g� ��� r   E V��� n  E T��� I   F T������� @0 matchesinstring_options_range_ matchesInString_options_range_�    o   F G���� 0 
asocstring 
asocString  m   G H����   �� J   H P  m   H I����   �� n  I N	
	 I   J N�������� 
0 length  ��  ��  
 o   I J���� 0 
asocstring 
asocString��  ��  ��  � o   E F���� 0 asocpattern asocPattern� o      ����  0 asocmatcharray asocMatchArray�  Y   W ����� k   g �  r   g o l  g m���� n  g m I   h m������  0 objectatindex_ objectAtIndex_ �� o   h i���� 0 i  ��  ��   o   g h����  0 asocmatcharray asocMatchArray��  ��   o      ���� 0 	asocmatch 	asocMatch  l  p p����   � � the first range in match identifies the text matched by the entire pattern, so generate records for full match and its preceding (unmatched) text    �$   t h e   f i r s t   r a n g e   i n   m a t c h   i d e n t i f i e s   t h e   t e x t   m a t c h e d   b y   t h e   e n t i r e   p a t t e r n ,   s o   g e n e r a t e   r e c o r d s   f o r   f u l l   m a t c h   a n d   i t s   p r e c e d i n g   ( u n m a t c h e d )   t e x t   r   p �!"! I      ��#���� 0 _matchrecords _matchRecords# $%$ o   q r���� 0 
asocstring 
asocString% &'& n  r x()( I   s x��*���� 0 rangeatindex_ rangeAtIndex_* +��+ m   s t����  ��  ��  ) o   r s���� 0 	asocmatch 	asocMatch' ,-, o   x y���� &0 asocnonmatchstart asocNonMatchStart- ./. o   y z���� 0 
textoffset 
textOffset/ 010 o   z ���� (0 _unmatchedtexttype _UnmatchedTextType1 2��2 o    ����� $0 _matchedtexttype _MatchedTextType��  ��  " J      33 454 o      ���� 0 nonmatchinfo nonMatchInfo5 676 o      ���� 0 	matchinfo 	matchInfo7 898 o      ���� &0 asocnonmatchstart asocNonMatchStart9 :��: o      ���� 0 
textoffset 
textOffset��    ;<; Z  � �=>����= o   � ����� &0 includenonmatches includeNonMatches> r   � �?@? o   � ����� 0 nonmatchinfo nonMatchInfo@ n      ABA  ;   � �B o   � ����� 0 
resultlist 
resultList��  ��  < C��C Z   � �DE����D o   � �����  0 includematches includeMatchesE k   � �FF GHG l  � ���IJ��  I any additional ranges in match identify text matched by group references within regexp pattern, e.g. "([0-9]{4})-([0-9]{2})-([0-9]{2})" will match `YYYY-MM-DD` style date strings, returning the entire text match, plus sub-matches representing year, month and day text   J �KK   a n y   a d d i t i o n a l   r a n g e s   i n   m a t c h   i d e n t i f y   t e x t   m a t c h e d   b y   g r o u p   r e f e r e n c e s   w i t h i n   r e g e x p   p a t t e r n ,   e . g .   " ( [ 0 - 9 ] { 4 } ) - ( [ 0 - 9 ] { 2 } ) - ( [ 0 - 9 ] { 2 } ) "   w i l l   m a t c h   ` Y Y Y Y - M M - D D `   s t y l e   d a t e   s t r i n g s ,   r e t u r n i n g   t h e   e n t i r e   t e x t   m a t c h ,   p l u s   s u b - m a t c h e s   r e p r e s e n t i n g   y e a r ,   m o n t h   a n d   d a y   t e x tH L��L r   � �MNM b   � �OPO o   � ����� 0 	matchinfo 	matchInfoP K   � �QQ ��R���� 0 foundgroups foundGroupsR I   � ���S���� &0 _matchedgrouplist _matchedGroupListS TUT o   � ����� 0 
asocstring 
asocStringU VWV o   � ����� 0 	asocmatch 	asocMatchW XYX n  � �Z[Z o   � ����� 0 
startindex 
startIndex[ o   � ����� 0 	matchinfo 	matchInfoY \��\ o   � ����� &0 includenonmatches includeNonMatches��  ��  ��  N n      ]^]  ;   � �^ o   � ����� 0 
resultlist 
resultList��  ��  ��  ��  �� 0 i   m   Z [��   \   [ b_`_ l  [ `a�~�}a n  [ `bcb I   \ `�|�{�z�| 	0 count  �{  �z  c o   [ \�y�y  0 asocmatcharray asocMatchArray�~  �}  ` m   ` a�x�x ��   ded l  � ��wfg�w  f "  add final non-matched range   g �hh 8   a d d   f i n a l   n o n - m a t c h e d   r a n g ee iji Z   �
kl�v�uk o   � ��t�t &0 includenonmatches includeNonMatchesl k   �mm non r   � �pqp c   � �rsr l  � �t�s�rt n  � �uvu I   � ��qw�p�q *0 substringfromindex_ substringFromIndex_w x�ox o   � ��n�n &0 asocnonmatchstart asocNonMatchStart�o  �p  v o   � ��m�m 0 
asocstring 
asocString�s  �r  s m   � ��l
�l 
ctxtq o      �k�k 0 	foundtext 	foundTexto y�jy r   �z{z K   �|| �i}~
�i 
pcls} o   � ��h�h (0 _unmatchedtexttype _UnmatchedTextType~ �g��g 0 
startindex 
startIndex o   � ��f�f 0 
textoffset 
textOffset� �e���e 0 endindex endIndex� n   � ���� 1   � ��d
�d 
leng� o   � ��c�c 0 thetext theText� �b��a�b 0 	foundtext 	foundText� o   � ��`�` 0 	foundtext 	foundText�a  { n      ���  ;  � o  �_�_ 0 
resultlist 
resultList�j  �v  �u  j ��^� L  �� o  �]�] 0 
resultlist 
resultList�^  � ��� l     �\�[�Z�\  �[  �Z  � ��� l     �Y�X�W�Y  �X  �W  � ��� l     �V���V  �  -----   � ��� 
 - - - - -� ��� l     �U���U  �   replace pattern   � ���     r e p l a c e   p a t t e r n� ��� l     �T�S�R�T  �S  �R  � ��� i  / 2��� I      �Q��P�Q "0 _replacepattern _replacePattern� ��� o      �O�O 0 thetext theText� ��� o      �N�N 0 patterntext patternText� ��M� o      �L�L 0 templatetext templateText�M  �P  � k    P�� ��� r     ��� n    
��� I    
�K��J�K ,0 asnormalizednsstring asNormalizedNSString� ��I� o    �H�H 0 thetext theText�I  �J  � o     �G�G 0 _support  � o      �F�F 0 
asocstring 
asocString� ��� r    ��� n   ��� I    �E��D�E @0 asnsregularexpressionparameter asNSRegularExpressionParameter� ��� o    �C�C 0 patterntext patternText� ��� m    �B�B  � ��A� m    �� ���  f o r�A  �D  � o    �@�@ 0 _support  � o      �?�? 0 asocpattern asocPattern� ��>� Z   P���=�� =    '��� l   %��<�;� I   %�:��
�: .corecnte****       ****� J    �� ��9� o    �8�8 0 templatetext templateText�9  � �7��6
�7 
kocl� m     !�5
�5 
scpt�6  �<  �;  � m   % &�4�4 � k   *8�� ��� r   * F��� J   * 0�� ��� J   * ,�3�3  � ��� m   , -�2�2  � ��1� m   - .�0�0 �1  � J      �� ��� o      �/�/ 0 
resultlist 
resultList� ��� o      �.�. &0 asocnonmatchstart asocNonMatchStart� ��-� o      �,�, 0 
textoffset 
textOffset�-  � ��� r   G X��� n  G V��� I   H V�+��*�+ @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   H I�)�) 0 
asocstring 
asocString� ��� m   I J�(�(  � ��'� J   J R�� ��� m   J K�&�&  � ��%� n  K P��� I   L P�$�#�"�$ 
0 length  �#  �"  � o   K L�!�! 0 
asocstring 
asocString�%  �'  �*  � o   G H� �  0 asocpattern asocPattern� o      ��  0 asocmatcharray asocMatchArray� ��� Y   Y ������� k   i ��� ��� r   i q��� l  i o���� n  i o��� I   j o����  0 objectatindex_ objectAtIndex_� ��� o   j k�� 0 i  �  �  � o   i j��  0 asocmatcharray asocMatchArray�  �  � o      �� 0 	asocmatch 	asocMatch� ��� r   r ���� I      ���� 0 _matchrecords _matchRecords� ��� o   s t�� 0 
asocstring 
asocString�    n  t z I   u z��� 0 rangeatindex_ rangeAtIndex_ � m   u v��  �  �   o   t u�� 0 	asocmatch 	asocMatch  o   z {�� &0 asocnonmatchstart asocNonMatchStart 	 o   { |�� 0 
textoffset 
textOffset	 

 o   | ��
�
 (0 _unmatchedtexttype _UnmatchedTextType �	 o   � ��� $0 _matchedtexttype _MatchedTextType�	  �  � J        o      �� 0 nonmatchinfo nonMatchInfo  o      �� 0 	matchinfo 	matchInfo  o      �� &0 asocnonmatchstart asocNonMatchStart � o      �� 0 
textoffset 
textOffset�  �  r   � � n  � � o   � ��� 0 	foundtext 	foundText o   � ��� 0 nonmatchinfo nonMatchInfo n        ;   � � o   � �� �  0 
resultlist 
resultList  r   � �  I   � ���!���� &0 _matchedgrouplist _matchedGroupList! "#" o   � ����� 0 
asocstring 
asocString# $%$ o   � ����� 0 	asocmatch 	asocMatch% &'& n  � �()( o   � ����� 0 
startindex 
startIndex) o   � ����� 0 	matchinfo 	matchInfo' *��* m   � ���
�� boovtrue��  ��    o      ���� 0 matchedgroups matchedGroups +��+ Q   � �,-., r   � �/0/ c   � �121 n  � �343 I   � ���5����  0 replacepattern replacePattern5 676 n  � �898 o   � ����� 0 	foundtext 	foundText9 o   � ����� 0 	matchinfo 	matchInfo7 :��: o   � ����� 0 matchedgroups matchedGroups��  ��  4 o   � ����� 0 templatetext templateText2 m   � ���
�� 
ctxt0 n      ;<;  ;   � �< o   � ����� 0 
resultlist 
resultList- R      ��=>
�� .ascrerr ****      � ****= o      ���� 0 etext eText> ��?@
�� 
errn? o      ���� 0 enumber eNumber@ ��AB
�� 
erobA o      ���� 0 efrom eFromB ��C��
�� 
errtC o      ���� 
0 eto eTo��  . R   � ���DE
�� .ascrerr ****      � ****D b   � �FGF m   � �HH �II � A n   e r r o r   o c c u r r e d   w h e n   c a l l i n g   t h e    r e p l a c e   p a t t e r n    s c r i p t   o b j e c t :  G o   � ����� 0 etext eTextE ��JK
�� 
errnJ o   � ����� 0 enumber eNumberK ��LM
�� 
erobL o   � ����� 0 efrom eFromM ��N��
�� 
errtN o   � ����� 
0 eto eTo��  ��  � 0 i  � m   \ ]����  � \   ] dOPO l  ] bQ����Q n  ] bRSR I   ^ b�������� 	0 count  ��  ��  S o   ] ^����  0 asocmatcharray asocMatchArray��  ��  P m   b c���� �  � TUT l  � ���VW��  V "  add final non-matched range   W �XX 8   a d d   f i n a l   n o n - m a t c h e d   r a n g eU YZY r   �[\[ c   �]^] l  � �_����_ n  � �`a` I   � ���b���� *0 substringfromindex_ substringFromIndex_b c��c o   � ����� &0 asocnonmatchstart asocNonMatchStart��  ��  a o   � ����� 0 
asocstring 
asocString��  ��  ^ m   ���
�� 
ctxt\ n      ded  ;  e o  ���� 0 
resultlist 
resultListZ fgf r  hih n jkj 1  	��
�� 
txdlk 1  	��
�� 
ascri o      ���� 0 oldtids oldTIDsg lml r  non m  pp �qq  o n     rsr 1  ��
�� 
txdls 1  ��
�� 
ascrm tut r  'vwv c  #xyx o  ���� 0 
resultlist 
resultListy m  "��
�� 
ctxtw o      ���� 0 
resulttext 
resultTextu z{z r  (3|}| o  (+���� 0 oldtids oldTIDs} n     ~~ 1  .2��
�� 
txdl 1  +.��
�� 
ascr{ ���� L  48�� o  47���� 0 
resulttext 
resultText��  �=  � L  ;P�� c  ;O��� l ;K������ n ;K��� I  <K������� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_� ��� l 
<=������ o  <=���� 0 
asocstring 
asocString��  ��  � ��� m  =>����  � ��� J  >F�� ��� m  >?����  � ���� n ?D��� I  @D�������� 
0 length  ��  ��  � o  ?@���� 0 
asocstring 
asocString��  � ���� o  FG���� 0 templatetext templateText��  ��  � o  ;<���� 0 asocpattern asocPattern��  ��  � m  KN��
�� 
ctxt�>  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  �  
 find text   � ���    f i n d   t e x t� ��� l     ��������  ��  ��  � ��� i  3 6��� I      ������� 0 	_findtext 	_findText� ��� o      ���� 0 thetext theText� ��� o      ���� 0 fortext forText� ��� o      ���� &0 includenonmatches includeNonMatches� ���� o      ����  0 includematches includeMatches��  ��  � k    	�� ��� r     ��� J     ����  � o      ���� 0 
resultlist 
resultList� ��� r    
��� n   ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ��� r    ��� o    ���� 0 fortext forText� n     ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� ��� r    ��� m    ���� � o      ���� 0 
startindex 
startIndex� ��� r    ��� n    ��� 1    ��
�� 
leng� n    ��� 4    ���
�� 
citm� m    ���� � o    ���� 0 thetext theText� o      ���� 0 endindex endIndex� ��� Z    Q������� o    ���� &0 includenonmatches includeNonMatches� k   " M�� ��� Z   " ;������ B   " %��� o   " #���� 0 
startindex 
startIndex� o   # $���� 0 endindex endIndex� r   ( 5��� n   ( 3��� 7  ) 3����
�� 
ctxt� o   - /���� 0 
startindex 
startIndex� o   0 2���� 0 endindex endIndex� o   ( )�� 0 thetext theText� o      �~�~ 0 	foundtext 	foundText��  � r   8 ;��� m   8 9�� ���  � o      �}�} 0 	foundtext 	foundText� ��|� r   < M��� K   < J�� �{��
�{ 
pcls� o   = B�z�z (0 _unmatchedtexttype _UnmatchedTextType� �y���y 0 
startindex 
startIndex� o   C D�x�x 0 
startindex 
startIndex� �w���w 0 endindex endIndex� o   E F�v�v 0 endindex endIndex� �u��t�u 0 	foundtext 	foundText� o   G H�s�s 0 	foundtext 	foundText�t  � n      ���  ;   K L� o   J K�r�r 0 
resultlist 
resultList�|  ��  ��  � ��� Y   R ��q���p� k   b ��� ��� r   b g��� [   b e��� o   b c�o�o 0 endindex endIndex� m   c d�n�n � o      �m�m 0 
startindex 
startIndex�    r   h } \   h { l  h k�l�k n   h k 1   i k�j
�j 
leng o   h i�i�i 0 thetext theText�l  �k   l  k z	�h�g	 n   k z

 1   x z�f
�f 
leng n   k x 7  l x�e
�e 
ctxt l  p s�d�c 4   p s�b
�b 
citm o   q r�a�a 0 i  �d  �c   l  t w�`�_ 4   t w�^
�^ 
citm m   u v�]�]���`  �_   o   k l�\�\ 0 thetext theText�h  �g   o      �[�[ 0 endindex endIndex  Z   ~ ��Z�Y o   ~ �X�X  0 includematches includeMatches k   � �  Z   � ��W B   � � o   � ��V�V 0 
startindex 
startIndex o   � ��U�U 0 endindex endIndex r   � � !  n   � �"#" 7  � ��T$%
�T 
ctxt$ o   � ��S�S 0 
startindex 
startIndex% o   � ��R�R 0 endindex endIndex# o   � ��Q�Q 0 thetext theText! o      �P�P 0 	foundtext 	foundText�W   r   � �&'& m   � �(( �))  ' o      �O�O 0 	foundtext 	foundText *�N* r   � �+,+ K   � �-- �M./
�M 
pcls. o   � ��L�L $0 _matchedtexttype _MatchedTextType/ �K01�K 0 
startindex 
startIndex0 o   � ��J�J 0 
startindex 
startIndex1 �I23�I 0 endindex endIndex2 o   � ��H�H 0 endindex endIndex3 �G45�G 0 	foundtext 	foundText4 o   � ��F�F 0 	foundtext 	foundText5 �E6�D�E 0 foundgroups foundGroups6 J   � ��C�C  �D  , n      787  ;   � �8 o   � ��B�B 0 
resultlist 
resultList�N  �Z  �Y   9:9 r   � �;<; [   � �=>= o   � ��A�A 0 endindex endIndex> m   � ��@�@ < o      �?�? 0 
startindex 
startIndex: ?@? r   � �ABA \   � �CDC [   � �EFE o   � ��>�> 0 
startindex 
startIndexF l  � �G�=�<G n   � �HIH 1   � ��;
�; 
lengI n   � �JKJ 4   � ��:L
�: 
citmL o   � ��9�9 0 i  K o   � ��8�8 0 thetext theText�=  �<  D m   � ��7�7 B o      �6�6 0 endindex endIndex@ M�5M Z   � �NO�4�3N o   � ��2�2 &0 includenonmatches includeNonMatchesO k   � �PP QRQ Z   � �ST�1US B   � �VWV o   � ��0�0 0 
startindex 
startIndexW o   � ��/�/ 0 endindex endIndexT r   � �XYX n   � �Z[Z 7  � ��.\]
�. 
ctxt\ o   � ��-�- 0 
startindex 
startIndex] o   � ��,�, 0 endindex endIndex[ o   � ��+�+ 0 thetext theTextY o      �*�* 0 	foundtext 	foundText�1  U r   � �^_^ m   � �`` �aa  _ o      �)�) 0 	foundtext 	foundTextR b�(b r   � �cdc K   � �ee �'fg
�' 
pclsf o   � ��&�& (0 _unmatchedtexttype _UnmatchedTextTypeg �%hi�% 0 
startindex 
startIndexh o   � ��$�$ 0 
startindex 
startIndexi �#jk�# 0 endindex endIndexj o   � ��"�" 0 endindex endIndexk �!l� �! 0 	foundtext 	foundTextl o   � ��� 0 	foundtext 	foundText�   d n      mnm  ;   � �n o   � ��� 0 
resultlist 
resultList�(  �4  �3  �5  �q 0 i  � m   U V�� � I  V ]�o�
� .corecnte****       ****o n   V Ypqp 2  W Y�
� 
citmq o   V W�� 0 thetext theText�  �p  � rsr r  tut o  �� 0 oldtids oldTIDsu n     vwv 1  �
� 
txdlw 1  �
� 
ascrs x�x L  	yy o  �� 0 
resultlist 
resultList�  � z{z l     ����  �  �  { |}| l     ����  �  �  } ~~ l     ����  �  -----   � ��� 
 - - - - - ��� l     ����  �   replace text   � ���    r e p l a c e   t e x t� ��� l     ��
�	�  �
  �	  � ��� i  7 :��� I      ���� 0 _replacetext _replaceText� ��� o      �� 0 thetext theText� ��� o      �� 0 fortext forText� ��� o      �� 0 newtext newText�  �  � k    '�� ��� r     ��� n    ��� 1    �
� 
txdl� 1     �
� 
ascr� o      � �  0 oldtids oldTIDs� ��� r    ��� o    ���� 0 fortext forText� n     ��� 1    
��
�� 
txdl� 1    ��
�� 
ascr� ��� Z   ������ >    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 newtext newText��  � �����
�� 
kocl� m    ��
�� 
scpt��  ��  ��  � m    ����  � k    ��� ��� r    ;��� J    %�� ��� J    ����  � ��� m    ���� � ���� n    #��� 1   ! #��
�� 
leng� n    !��� 4    !���
�� 
citm� m     ���� � o    ���� 0 thetext theText��  � J      �� ��� o      ���� 0 
resultlist 
resultList� ��� o      ���� 0 
startindex 
startIndex� ���� o      ���� 0 endindex endIndex��  � ��� Z  < T������� B   < ?��� o   < =���� 0 
startindex 
startIndex� o   = >���� 0 endindex endIndex� r   B P��� n   B M��� 7  C M����
�� 
ctxt� o   G I���� 0 
startindex 
startIndex� o   J L���� 0 endindex endIndex� o   B C���� 0 thetext theText� n      ���  ;   N O� o   M N���� 0 
resultlist 
resultList��  ��  � ��� Y   U ��������� k   e ��� ��� r   e j��� [   e h��� o   e f���� 0 endindex endIndex� m   f g���� � o      ���� 0 
startindex 
startIndex� ��� r   k ���� \   k ~��� l  k n������ n   k n��� 1   l n��
�� 
leng� o   k l���� 0 thetext theText��  ��  � l  n }������ n   n }��� 1   { }��
�� 
leng� n   n {��� 7  o {����
�� 
ctxt� l  s v������ 4   s v���
�� 
citm� o   t u���� 0 i  ��  ��  � l  w z������ 4   w z���
�� 
citm� m   x y��������  ��  � o   n o���� 0 thetext theText��  ��  � o      ���� 0 endindex endIndex� ��� Z   � ������� B   � ���� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� r   � ���� n   � ���� 7  � �����
�� 
ctxt� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� o   � ����� 0 thetext theText� o      ���� 0 	foundtext 	foundText��  � r   � �� � m   � � �    o      ���� 0 	foundtext 	foundText�  Q   � � r   � �	 c   � �

 n  � � I   � ������� 0 replacetext replaceText �� o   � ����� 0 	foundtext 	foundText��  ��   o   � ����� 0 newtext newText m   � ���
�� 
ctxt	 n        ;   � � o   � ����� 0 
resultlist 
resultList R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   R   � ���
�� .ascrerr ****      � **** b   � � m   � � � � A n   e r r o r   o c c u r r e d   w h e n   c a l l i n g   t h e    r e p l a c e   t e x t    s c r i p t   o b j e c t :   o   � ����� 0 etext eText �� 
�� 
errn o   � ����� 0 enumber eNumber  ��!"
�� 
erob! o   � ����� 0 efrom eFrom" ��#��
�� 
errt# o   � ����� 
0 eto eTo��   $%$ r   � �&'& [   � �()( o   � ����� 0 endindex endIndex) m   � ����� ' o      ���� 0 
startindex 
startIndex% *+* r   � �,-, \   � �./. [   � �010 o   � ����� 0 
startindex 
startIndex1 l  � �2����2 n   � �343 1   � ���
�� 
leng4 n   � �565 4   � ���7
�� 
citm7 o   � ����� 0 i  6 o   � ����� 0 thetext theText��  ��  / m   � ����� - o      ���� 0 endindex endIndex+ 8��8 Z  � �9:����9 B   � �;<; o   � ����� 0 
startindex 
startIndex< o   � ����� 0 endindex endIndex: r   � �=>= n   � �?@? 7  � ���AB
�� 
ctxtA o   � ����� 0 
startindex 
startIndexB o   � ����� 0 endindex endIndex@ o   � ����� 0 thetext theText> n      CDC  ;   � �D o   � ����� 0 
resultlist 
resultList��  ��  ��  �� 0 i  � m   X Y���� � I  Y `��E��
�� .corecnte****       ****E n   Y \FGF 2  Z \��
�� 
citmG o   Y Z���� 0 thetext theText��  ��  � H��H r   � �IJI m   � �KK �LL  J n     MNM 1   � ���
�� 
txdlN 1   � ���
�� 
ascr��  ��  � l  �OPQO k   �RR STS l  � ���UV��  U   replace with text   V �WW $   r e p l a c e   w i t h   t e x tT XYX r   �Z[Z n  �
\]\ I  
��^���� "0 astextparameter asTextParameter^ _`_ o  ���� 0 newtext newText` a��a m  bb �cc  r e p l a c i n g   w i t h��  ��  ] o   ����� 0 _support  [ o      ���� 0 newtext newTextY ded l fghf r  iji n klk 2 ��
�� 
citml o  �� 0 thetext theTextj o      �~�~ 0 
resultlist 
resultListg J D note: TID-based matching uses current considering/ignoring settings   h �mm �   n o t e :   T I D - b a s e d   m a t c h i n g   u s e s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g se n�}n r  opo o  �|�| 0 newtext newTextp n     qrq 1  �{
�{ 
txdlr 1  �z
�z 
ascr�}  P * $ replace with callback-supplied text   Q �ss H   r e p l a c e   w i t h   c a l l b a c k - s u p p l i e d   t e x t� tut r  vwv c  xyx o  �y�y 0 
resultlist 
resultListy m  �x
�x 
ctxtw o      �w�w 0 
resulttext 
resultTextu z{z r  $|}| o   �v�v 0 oldtids oldTIDs} n     ~~ 1  !#�u
�u 
txdl 1   !�t
�t 
ascr{ ��s� L  %'�� o  %&�r�r 0 
resulttext 
resultText�s  � ��� l     �q�p�o�q  �p  �o  � ��� l     �n�m�l�n  �m  �l  � ��� l     �k���k  �  -----   � ��� 
 - - - - -� ��� l     �j�i�h�j  �i  �h  � ��� i  ; >��� I     �g��
�g .Txt:Srchnull���     ctxt� o      �f�f 0 thetext theText� �e��
�e 
For_� o      �d�d 0 fortext forText� �c��
�c 
Usin� |�b�a��`��b  �a  � o      �_�_ 0 matchformat matchFormat�`  � l 
    ��^�]� l     ��\�[� m      �Z
�Z SerECmpI�\  �[  �^  �]  � �Y��
�Y 
Repl� |�X�W��V��X  �W  � o      �U�U 0 newtext newText�V  � l     ��T�S� m      �R
�R 
msng�T  �S  � �Q��P
�Q 
Retu� |�O�N��M��O  �N  � o      �L�L 0 resultformat resultFormat�M  � l     ��K�J� m      �I
�I RetEMatT�K  �J  �P  � Q    O���� k   9�� ��� r    ��� n   ��� I    �H��G�H "0 astextparameter asTextParameter� ��� o    	�F�F 0 thetext theText� ��E� m   	 
�� ���  �E  �G  � o    �D�D 0 _support  � o      �C�C 0 thetext theText� ��� r    ��� n   ��� I    �B��A�B "0 astextparameter asTextParameter� ��� o    �@�@ 0 fortext forText� ��?� m    �� ���  f o r�?  �A  � o    �>�> 0 _support  � o      �=�= 0 fortext forText� ��� Z   3���<�;� =    $��� n   "��� 1     "�:
�: 
leng� o     �9�9 0 fortext forText� m   " #�8�8  � R   ' /�7��
�7 .ascrerr ****      � ****� m   - .�� ��� t I n v a l i d    f o r    p a r a m e t e r   ( e x p e c t e d   o n e   o r   m o r e   c h a r a c t e r s ) .� �6��
�6 
errn� m   ) *�5�5�Y� �4��3
�4 
erob� o   + ,�2�2 0 fortext forText�3  �<  �;  � ��1� Z   49���0�� =  4 7��� o   4 5�/�/ 0 newtext newText� m   5 6�.
�. 
msng� l  :����� k   :��� ��� Z   : e���-�,� =   : ?��� n  : =��� 1   ; =�+
�+ 
leng� o   : ;�*�* 0 thetext theText� m   = >�)�)  � Z   B a���(�� =  B E��� o   B C�'�' 0 resultformat resultFormat� m   C D�&
�& RetEMatT� L   H K�� J   H J�%�%  �(  � L   N a�� J   N `�� ��$� K   N ^�� �#��
�# 
pcls� o   O T�"�" (0 _unmatchedtexttype _UnmatchedTextType� �!���! 0 
startindex 
startIndex� m   U V� �  � ���� 0 endindex endIndex� m   W X��  � ���� 0 	foundtext 	foundText� m   Y Z�� ���  �  �$  �-  �,  � ��� Z   f ������ =  f i��� o   f g�� 0 resultformat resultFormat� m   g h�
� RetEMatT� r   l ���� J   l p�� � � m   l m�
� boovfals  � m   m n�
� boovtrue�  � J        o      �� &0 includenonmatches includeNonMatches � o      ��  0 includematches includeMatches�  �  =  � �	 o   � ��� 0 resultformat resultFormat	 m   � ��
� RetEUmaT 

 r   � � J   � �  m   � ��
� boovtrue � m   � ��
� boovfals�   J        o      �� &0 includenonmatches includeNonMatches � o      ��  0 includematches includeMatches�    =  � � o   � ��� 0 resultformat resultFormat m   � ��

�
 RetEAllT �	 r   � � J   � �  m   � ��
� boovtrue  �  m   � ��
� boovtrue�   J      !! "#" o      �� &0 includenonmatches includeNonMatches# $�$ o      ��  0 includematches includeMatches�  �	  � n  � �%&% I   � ��'�� >0 throwinvalidconstantparameter throwInvalidConstantParameter' ()( o   � �� �  0 resultformat resultFormat) *��* m   � �++ �,,  r e t u r n i n g��  �  & o   � ����� 0 _support  � -��- Z   ��./01. =  � �232 o   � ����� 0 matchformat matchFormat3 m   � ���
�� SerECmpI/ P   � �4564 L   � �77 I   � ���8���� 0 	_findtext 	_findText8 9:9 o   � ����� 0 thetext theText: ;<; o   � ����� 0 fortext forText< =>= o   � ����� &0 includenonmatches includeNonMatches> ?��? o   � �����  0 includematches includeMatches��  ��  5 ��@
�� consdiac@ ��A
�� conshyphA ��B
�� conspuncB ��C
�� conswhitC ����
�� consnume��  6 ����
�� conscase��  0 DED =  � �FGF o   � ����� 0 matchformat matchFormatG m   � ���
�� SerECmpPE HIH L   �	JJ I   ���K���� 0 _findpattern _findPatternK LML o   ���� 0 thetext theTextM NON o  ���� 0 fortext forTextO PQP o  ���� &0 includenonmatches includeNonMatchesQ R��R o  ����  0 includematches includeMatches��  ��  I STS = UVU o  ���� 0 matchformat matchFormatV m  ��
�� SerECmpCT WXW P  &YZ��Y L  %[[ I  $��\���� 0 	_findtext 	_findText\ ]^] o  ���� 0 thetext theText^ _`_ o  ���� 0 fortext forText` aba o  ���� &0 includenonmatches includeNonMatchesb c��c o   ����  0 includematches includeMatches��  ��  Z ��d
�� conscased ��e
�� consdiace ��f
�� conshyphf ��g
�� conspuncg ��h
�� conswhith ����
�� consnume��  ��  X iji = ).klk o  )*���� 0 matchformat matchFormatl m  *-��
�� SerECmpEj mnm P  1Eopqo L  :Drr I  :C��s���� 0 	_findtext 	_findTexts tut o  ;<���� 0 thetext theTextu vwv o  <=���� 0 fortext forTextw xyx o  =>���� &0 includenonmatches includeNonMatchesy z��z o  >?����  0 includematches includeMatches��  ��  p ��{
�� conscase{ ��|
�� consdiac| ��}
�� conshyph} ��~
�� conspunc~ ����
�� conswhit��  q ����
�� consnume��  n � = HM��� o  HI���� 0 matchformat matchFormat� m  IL��
�� SerECmpD� ���� k  Pq�� ��� l Pf���� Z Pf������� = PU��� o  PQ���� 0 fortext forText� m  QT�� ���  � R  Xb����
�� .ascrerr ****      � ****� m  ^a�� ��� � I n v a l i d    f o r    p a r a m e t e r   ( c o n t a i n s   o n l y   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r a t i o n s ) .� ����
�� 
errn� m  Z[�����Y� �����
�� 
erob� o  \]���� 0 fortext forText��  ��  ��  ��� checks if all characters in forText are ignored by current considering/ignoring settings (the alternative would be to return each character as a non-match separated by a zero-length match, but that's probably not what the user intended); note that unlike `aString's length = 0`, which is what library code normally uses to check for empty text, on this occasion we do want to take into account the current considering/ignoring settings so deliberately use `forText is ""` here. For example, when ignoring punctuation, searching for the TID `"!?"` is no different to searching for `""`, because all of its characters are being ignored when comparing the text being searched against the text being searched for. Thus, a simple `forText is ""` test can be used to check in advance if the text contains any matchable characters under the current considering/ignoring settings, and report a meaningful error if not.   � ���   c h e c k s   i f   a l l   c h a r a c t e r s   i n   f o r T e x t   a r e   i g n o r e d   b y   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   ( t h e   a l t e r n a t i v e   w o u l d   b e   t o   r e t u r n   e a c h   c h a r a c t e r   a s   a   n o n - m a t c h   s e p a r a t e d   b y   a   z e r o - l e n g t h   m a t c h ,   b u t   t h a t ' s   p r o b a b l y   n o t   w h a t   t h e   u s e r   i n t e n d e d ) ;   n o t e   t h a t   u n l i k e   ` a S t r i n g ' s   l e n g t h   =   0 ` ,   w h i c h   i s   w h a t   l i b r a r y   c o d e   n o r m a l l y   u s e s   t o   c h e c k   f o r   e m p t y   t e x t ,   o n   t h i s   o c c a s i o n   w e   d o   w a n t   t o   t a k e   i n t o   a c c o u n t   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   s o   d e l i b e r a t e l y   u s e   ` f o r T e x t   i s   " " `   h e r e .   F o r   e x a m p l e ,   w h e n   i g n o r i n g   p u n c t u a t i o n ,   s e a r c h i n g   f o r   t h e   T I D   ` " ! ? " `   i s   n o   d i f f e r e n t   t o   s e a r c h i n g   f o r   ` " " ` ,   b e c a u s e   a l l   o f   i t s   c h a r a c t e r s   a r e   b e i n g   i g n o r e d   w h e n   c o m p a r i n g   t h e   t e x t   b e i n g   s e a r c h e d   a g a i n s t   t h e   t e x t   b e i n g   s e a r c h e d   f o r .   T h u s ,   a   s i m p l e   ` f o r T e x t   i s   " " `   t e s t   c a n   b e   u s e d   t o   c h e c k   i n   a d v a n c e   i f   t h e   t e x t   c o n t a i n s   a n y   m a t c h a b l e   c h a r a c t e r s   u n d e r   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s ,   a n d   r e p o r t   a   m e a n i n g f u l   e r r o r   i f   n o t .� ���� L  gq�� I  gp������� 0 	_findtext 	_findText� ��� o  hi���� 0 thetext theText� ��� o  ij���� 0 fortext forText� ��� o  jk���� &0 includenonmatches includeNonMatches� ���� o  kl����  0 includematches includeMatches��  ��  ��  ��  1 n t���� I  y�������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o  yz���� 0 matchformat matchFormat� ���� m  z}�� ��� 
 u s i n g��  ��  � o  ty���� 0 _support  ��  �   find matches   � ���    f i n d   m a t c h e s�0  � l �9���� k  �9�� ��� Z ��������� =  ����� n ����� 1  ����
�� 
leng� o  ������ 0 thetext theText� m  ������  � L  ���� m  ���� ���  ��  ��  � ���� Z  �9����� = ����� o  ������ 0 matchformat matchFormat� m  ����
�� SerECmpI� P  ������ L  ���� I  ��������� 0 _replacetext _replaceText� ��� o  ������ 0 thetext theText� ��� o  ������ 0 fortext forText� ���� o  ������ 0 newtext newText��  ��  � ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  � ����
�� conscase��  � ��� = ����� o  ������ 0 matchformat matchFormat� m  ����
�� SerECmpP� ��� L  ���� I  ��������� "0 _replacepattern _replacePattern� ��� o  ������ 0 thetext theText� ��� o  ������ 0 fortext forText� ���� o  ������ 0 newtext newText��  ��  � ��� = ����� o  ������ 0 matchformat matchFormat� m  ����
�� SerECmpE� ��� P  ������ L  ���� I  ��������� 0 _replacetext _replaceText� ��� o  ������ 0 thetext theText� ��� o  ������ 0 fortext forText� ���� o  ������ 0 newtext newText��  ��  � ���
�� conscase� ���
�� consdiac� ��
� conshyph� �~�
�~ conspunc� �}�|
�} conswhit�|  � �{�z
�{ consnume�z  � ��� = ����� o  ���y�y 0 matchformat matchFormat� m  ���x
�x SerECmpC� ��� P  �����w� L  ���� I  ���v��u�v 0 _replacetext _replaceText� ��� o  ���t�t 0 thetext theText� ��� o  ���s�s 0 fortext forText� ��r� o  ���q�q 0 newtext newText�r  �u  � �p�
�p conscase� �o 
�o consdiac  �n
�n conshyph �m
�m conspunc �l
�l conswhit �k�j
�k consnume�j  �w  �  =  o  �i�i 0 matchformat matchFormat m  �h
�h SerECmpD �g k  	)		 

 Z 	�f�e = 	 o  	
�d�d 0 fortext forText m  
 �   R  �c
�c .ascrerr ****      � **** m   � � I n v a l i d    f o r    p a r a m e t e r   ( c o n t a i n s   o n l y   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r a t i o n s ) . �b
�b 
errn m  �a�a�Y �`�_
�` 
erob o  �^�^ 0 fortext forText�_  �f  �e   �] L   ) I   (�\�[�\ 0 _replacetext _replaceText  o  !"�Z�Z 0 thetext theText  o  "#�Y�Y 0 fortext forText  �X  o  #$�W�W 0 newtext newText�X  �[  �]  �g  � n ,9!"! I  19�V#�U�V >0 throwinvalidconstantparameter throwInvalidConstantParameter# $%$ o  12�T�T 0 matchformat matchFormat% &�S& m  25'' �(( 
 u s i n g�S  �U  " o  ,1�R�R 0 _support  ��  �   replace matches   � �))     r e p l a c e   m a t c h e s�1  � R      �Q*+
�Q .ascrerr ****      � ***** o      �P�P 0 etext eText+ �O,-
�O 
errn, o      �N�N 0 enumber eNumber- �M./
�M 
erob. o      �L�L 0 efrom eFrom/ �K0�J
�K 
errt0 o      �I�I 
0 eto eTo�J  � I  AO�H1�G�H 
0 _error  1 232 m  BE44 �55  s e a r c h   t e x t3 676 o  EF�F�F 0 etext eText7 898 o  FG�E�E 0 enumber eNumber9 :;: o  GH�D�D 0 efrom eFrom; <�C< o  HI�B�B 
0 eto eTo�C  �G  � =>= l     �A�@�?�A  �@  �?  > ?@? l     �>�=�<�>  �=  �<  @ ABA i  ? BCDC I     �;E�:
�; .Txt:EPatnull���     ctxtE o      �9�9 0 thetext theText�:  D Q     *FGHF L    II c    JKJ l   L�8�7L n   MNM I    �6O�5�6 40 escapedpatternforstring_ escapedPatternForString_O P�4P l   Q�3�2Q n   RSR I    �1T�0�1 "0 astextparameter asTextParameterT UVU o    �/�/ 0 thetext theTextV W�.W m    XX �YY  �.  �0  S o    �-�- 0 _support  �3  �2  �4  �5  N n   Z[Z o    �,�, *0 nsregularexpression NSRegularExpression[ m    �+
�+ misccura�8  �7  K m    �*
�* 
ctxtG R      �)\]
�) .ascrerr ****      � ****\ o      �(�( 0 etext eText] �'^_
�' 
errn^ o      �&�& 0 enumber eNumber_ �%`a
�% 
erob` o      �$�$ 0 efrom eFroma �#b�"
�# 
errtb o      �!�! 
0 eto eTo�"  H I     *� c��  
0 _error  c ded m   ! "ff �gg  e s c a p e   p a t t e r ne hih o   " #�� 0 etext eTexti jkj o   # $�� 0 enumber eNumberk lml o   $ %�� 0 efrom eFromm n�n o   % &�� 
0 eto eTo�  �  B opo l     ����  �  �  p qrq l     ����  �  �  r sts i  C Fuvu I     �w�
� .Txt:ETemnull���     ctxtw o      �� 0 thetext theText�  v Q     *xyzx L    {{ c    |}| l   ~��~ n   � I    ���� 60 escapedtemplateforstring_ escapedTemplateForString_� ��� l   ���
� n   ��� I    �	���	 "0 astextparameter asTextParameter� ��� o    �� 0 thetext theText� ��� m    �� ���  �  �  � o    �� 0 _support  �  �
  �  �  � n   ��� o    �� *0 nsregularexpression NSRegularExpression� m    �
� misccura�  �  } m    �
� 
ctxty R      ���
� .ascrerr ****      � ****� o      � �  0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  z I     *������� 
0 _error  � ��� m   ! "�� ���  e s c a p e   t e m p l a t e� ��� o   " #���� 0 etext eText� ��� o   # $���� 0 enumber eNumber� ��� o   $ %���� 0 efrom eFrom� ���� o   % &���� 
0 eto eTo��  ��  t ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Conversion Suite   � ��� "   C o n v e r s i o n   S u i t e� ��� l     ��������  ��  ��  � ��� i  G J��� I     ����
�� .Txt:UppTnull���     ctxt� o      ���� 0 thetext theText� �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � m      ��
�� 
msng��  � Q     P���� k    >�� ��� r    ��� n   ��� I    ������� 0 
asnsstring 
asNSString� ���� n   ��� I    ������� "0 astextparameter asTextParameter� ��� o    ���� 0 thetext theText� ���� m    �� ���  ��  ��  � o    ���� 0 _support  ��  ��  � o    ���� 0 _support  � o      ���� 0 
asocstring 
asocString� ���� Z    >������ =   ��� o    ���� 0 
localecode 
localeCode� m    ��
�� 
msng� L     (�� c     '��� l    %������ n    %��� I   ! %�������� "0 uppercasestring uppercaseString��  ��  � o     !���� 0 
asocstring 
asocString��  ��  � m   % &��
�� 
ctxt��  � L   + >�� c   + =��� l  + ;������ n  + ;��� I   , ;������� 80 uppercasestringwithlocale_ uppercaseStringWithLocale_� ���� l  , 7������ n  , 7��� I   1 7������� *0 asnslocaleparameter asNSLocaleParameter� ��� o   1 2���� 0 
localecode 
localeCode� ���� m   2 3�� ���  f o r   l o c a l e��  ��  � o   , 1���� 0 _support  ��  ��  ��  ��  � o   + ,���� 0 
asocstring 
asocString��  ��  � m   ; <��
�� 
ctxt��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   F P������� 
0 _error  � ��� m   G H�� ���  u p p e r c a s e   t e x t� ��� o   H I���� 0 etext eText� ��� o   I J���� 0 enumber eNumber� ��� o   J K���� 0 efrom eFrom� ���� o   K L���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  �    l     ��������  ��  ��    i  K N I     ��
�� .Txt:CapTnull���     ctxt o      ���� 0 thetext theText ����
�� 
Loca |����	��
��  ��  	 o      ���� 0 
localecode 
localeCode��  
 m      ��
�� 
msng��   Q     P k    >  r     n    I    ������ 0 
asnsstring 
asNSString �� n    I    ������ "0 astextparameter asTextParameter  o    ���� 0 thetext theText �� m     �  ��  ��   o    ���� 0 _support  ��  ��   o    ���� 0 _support   o      ���� 0 
asocstring 
asocString �� Z    > !��"  =   #$# o    ���� 0 
localecode 
localeCode$ m    ��
�� 
msng! L     (%% c     '&'& l    %(����( n    %)*) I   ! %�������� &0 capitalizedstring capitalizedString��  ��  * o     !���� 0 
asocstring 
asocString��  ��  ' m   % &��
�� 
ctxt��  " L   + >++ c   + =,-, l  + ;.����. n  + ;/0/ I   , ;��1���� <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_1 2��2 l  , 73����3 n  , 7454 I   1 7�6�~� *0 asnslocaleparameter asNSLocaleParameter6 787 o   1 2�}�} 0 
localecode 
localeCode8 9�|9 m   2 3:: �;;  f o r   l o c a l e�|  �~  5 o   , 1�{�{ 0 _support  ��  ��  ��  ��  0 o   + ,�z�z 0 
asocstring 
asocString��  ��  - m   ; <�y
�y 
ctxt��   R      �x<=
�x .ascrerr ****      � ****< o      �w�w 0 etext eText= �v>?
�v 
errn> o      �u�u 0 enumber eNumber? �t@A
�t 
erob@ o      �s�s 0 efrom eFromA �rB�q
�r 
errtB o      �p�p 
0 eto eTo�q   I   F P�oC�n�o 
0 _error  C DED m   G HFF �GG  c a p i t a l i z e   t e x tE HIH o   H I�m�m 0 etext eTextI JKJ o   I J�l�l 0 enumber eNumberK LML o   J K�k�k 0 efrom eFromM N�jN o   K L�i�i 
0 eto eTo�j  �n   OPO l     �h�g�f�h  �g  �f  P QRQ l     �e�d�c�e  �d  �c  R STS i  O RUVU I     �bWX
�b .Txt:LowTnull���     ctxtW o      �a�a 0 thetext theTextX �`Y�_
�` 
LocaY |�^�]Z�\[�^  �]  Z o      �[�[ 0 
localecode 
localeCode�\  [ m      �Z
�Z 
msng�_  V Q     P\]^\ k    >__ `a` r    bcb n   ded I    �Yf�X�Y 0 
asnsstring 
asNSStringf g�Wg n   hih I    �Vj�U�V "0 astextparameter asTextParameterj klk o    �T�T 0 thetext theTextl m�Sm m    nn �oo  �S  �U  i o    �R�R 0 _support  �W  �X  e o    �Q�Q 0 _support  c o      �P�P 0 
asocstring 
asocStringa p�Op Z    >qr�Nsq =   tut o    �M�M 0 
localecode 
localeCodeu m    �L
�L 
msngr L     (vv c     'wxw l    %y�K�Jy n    %z{z I   ! %�I�H�G�I "0 lowercasestring lowercaseString�H  �G  { o     !�F�F 0 
asocstring 
asocString�K  �J  x m   % &�E
�E 
ctxt�N  s L   + >|| c   + =}~} l  + ;�D�C n  + ;��� I   , ;�B��A�B 80 lowercasestringwithlocale_ lowercaseStringWithLocale_� ��@� l  , 7��?�>� n  , 7��� I   1 7�=��<�= *0 asnslocaleparameter asNSLocaleParameter� ��� o   1 2�;�; 0 
localecode 
localeCode� ��:� m   2 3�� ���  f o r   l o c a l e�:  �<  � o   , 1�9�9 0 _support  �?  �>  �@  �A  � o   + ,�8�8 0 
asocstring 
asocString�D  �C  ~ m   ; <�7
�7 
ctxt�O  ] R      �6��
�6 .ascrerr ****      � ****� o      �5�5 0 etext eText� �4��
�4 
errn� o      �3�3 0 enumber eNumber� �2��
�2 
erob� o      �1�1 0 efrom eFrom� �0��/
�0 
errt� o      �.�. 
0 eto eTo�/  ^ I   F P�-��,�- 
0 _error  � ��� m   G H�� ���  l o w e r c a s e   t e x t� ��� o   H I�+�+ 0 etext eText� ��� o   I J�*�* 0 enumber eNumber� ��� o   J K�)�) 0 efrom eFrom� ��(� o   K L�'�' 
0 eto eTo�(  �,  T ��� l     �&�%�$�&  �%  �$  � ��� l     �#�"�!�#  �"  �!  � ��� i  S V��� I     � ��
�  .Txt:FTxtnull���     ctxt� o      �� 0 templatetext templateText� ���
� 
Usin� o      �� 0 	thevalues 	theValues�  � k    [�� ��� l     ����  � � � note: templateText uses same `$n` (where n=1-9) notation as `search text`'s replacement templates, with `\$` to escape as necessary ($ not followed by a digit will appear as-is)   � ���d   n o t e :   t e m p l a t e T e x t   u s e s   s a m e   ` $ n `   ( w h e r e   n = 1 - 9 )   n o t a t i o n   a s   ` s e a r c h   t e x t ` ' s   r e p l a c e m e n t   t e m p l a t e s ,   w i t h   ` \ $ `   t o   e s c a p e   a s   n e c e s s a r y   ( $   n o t   f o l l o w e d   b y   a   d i g i t   w i l l   a p p e a r   a s - i s )� ��� Q    [���� P   A���� k   @�� ��� r    ��� n   ��� I    ���� 0 aslist asList� ��� o    �� 0 	thevalues 	theValues�  �  � o    �� 0 _support  � o      �� 0 	thevalues 	theValues� ��� l   !���� r    !��� n   ��� I    ���� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_� ��� m    �� ���  \ \ . | \ $ [ 1 - 9 ]� ��� m    ��  � ��� l   ���� m    �
� 
msng�  �  �  �  � n   ��� o    �� *0 nsregularexpression NSRegularExpression� m    �
� misccura� o      �
�
 0 asocpattern asocPattern� E ? match any backslash escaped character or a $ followed by digit   � ��� ~   m a t c h   a n y   b a c k s l a s h   e s c a p e d   c h a r a c t e r   o r   a   $   f o l l o w e d   b y   d i g i t� ��� r   " .��� n  " ,��� I   ' ,�	���	 0 
asnsstring 
asNSString� ��� o   ' (�� 0 templatetext templateText�  �  � o   " '�� 0 _support  � o      �� 0 
asocstring 
asocString� ��� r   / @��� l  / >���� n  / >��� I   0 >��� � @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   0 1���� 0 
asocstring 
asocString� ��� m   1 2����  � ���� J   2 :�� ��� m   2 3����  � ���� n  3 8��� I   4 8�������� 
0 length  ��  ��  � o   3 4���� 0 
asocstring 
asocString��  ��  �   � o   / 0���� 0 asocpattern asocPattern�  �  � o      ����  0 asocmatcharray asocMatchArray� ��� r   A E��� J   A C����  � o      ���� 0 resulttexts resultTexts� ��� r   F I��� m   F G����  � o      ���� 0 
startindex 
startIndex� ��� Y   J�������� k   Z�� �	 � r   Z g			 l  Z e	����	 n  Z e			 I   ` e��	���� 0 rangeatindex_ rangeAtIndex_	 	��	 m   ` a����  ��  ��  	 l  Z `	����	 n  Z `			
		 I   [ `��	����  0 objectatindex_ objectAtIndex_	 	��	 o   [ \���� 0 i  ��  ��  	
 o   Z [����  0 asocmatcharray asocMatchArray��  ��  ��  ��  	 o      ���� 0 
matchrange 
matchRange	  			 r   h �			 c   h }			 l  h y	����	 n  h y			 I   i y��	���� *0 substringwithrange_ substringWithRange_	 	��	 K   i u		 ��		�� 0 location  	 o   j k���� 0 
startindex 
startIndex	 ��	���� 
0 length  	 l  l s	����	 \   l s			 l  l q	����	 n  l q	 	!	  I   m q�������� 0 location  ��  ��  	! o   l m���� 0 
matchrange 
matchRange��  ��  	 o   q r���� 0 
startindex 
startIndex��  ��  ��  ��  ��  	 o   h i���� 0 
asocstring 
asocString��  ��  	 m   y |��
�� 
ctxt	 n      	"	#	"  ;   ~ 	# o   } ~���� 0 resulttexts resultTexts	 	$	%	$ r   � �	&	'	& c   � �	(	)	( l  � �	*����	* n  � �	+	,	+ I   � ���	-���� *0 substringwithrange_ substringWithRange_	- 	.��	. o   � ����� 0 
matchrange 
matchRange��  ��  	, o   � ����� 0 
asocstring 
asocString��  ��  	) m   � ���
�� 
ctxt	' o      ���� 0 thetoken theToken	% 	/	0	/ Z   � �	1	2��	3	1 =  � �	4	5	4 n  � �	6	7	6 4   � ���	8
�� 
cha 	8 m   � ����� 	7 o   � ����� 0 thetoken theToken	5 m   � �	9	9 �	:	:  \	2 l  � �	;	<	=	; l  � �	>	?	@	> r   � �	A	B	A n  � �	C	D	C 4   � ���	E
�� 
cha 	E m   � ����� 	D o   � ����� 0 thetoken theToken	B n      	F	G	F  ;   � �	G o   � ����� 0 resulttexts resultTexts	? w q �so insert the character that follows it -- TO DO: should this support 'special' character escapes, \t, \n, etc?   	@ �	H	H �   & s o   i n s e r t   t h e   c h a r a c t e r   t h a t   f o l l o w s   i t   - -   T O   D O :   s h o u l d   t h i s   s u p p o r t   ' s p e c i a l '   c h a r a c t e r   e s c a p e s ,   \ t ,   \ n ,   e t c ?	< + % found a backslash-escaped character�   	= �	I	I J   f o u n d   a   b a c k s l a s h - e s c a p e d   c h a r a c t e r &��  	3 l  � �	J	K	L	J k   � �	M	M 	N	O	N r   � �	P	Q	P c   � �	R	S	R n  � �	T	U	T 4   � ���	V
�� 
cha 	V m   � ����� 	U o   � ����� 0 thetoken theToken	S m   � ���
�� 
long	Q o      ���� 0 	itemindex 	itemIndex	O 	W	X	W l  � �	Y	Z	[	Y r   � �	\	]	\ n   � �	^	_	^ 4   � ���	`
�� 
cobj	` o   � ����� 0 	itemindex 	itemIndex	_ o   � ����� 0 	thevalues 	theValues	] o      ���� 0 theitem theItem	Z < 6 raises error -1728 if itemIndex > length of theValues   	[ �	a	a l   r a i s e s   e r r o r   - 1 7 2 8   i f   i t e m I n d e x   >   l e n g t h   o f   t h e V a l u e s	X 	b��	b Q   � �	c	d	e	c r   � �	f	g	f c   � �	h	i	h o   � ����� 0 theitem theItem	i m   � ���
�� 
ctxt	g n      	j	k	j  ;   � �	k o   � ����� 0 resulttexts resultTexts	d R      ����	l
�� .ascrerr ****      � ****��  	l ��	m��
�� 
errn	m d      	n	n m      �������  	e R   � ���	o	p
�� .ascrerr ****      � ****	o b   � �	q	r	q b   � �	s	t	s m   � �	u	u �	v	v & C a n  t   c o n v e r t   i t e m  	t o   � ����� 0 	itemindex 	itemIndex	r m   � �	w	w �	x	x    t o   t e x t .	p ��	y	z
�� 
errn	y m   � ������\	z ��	{	|
�� 
erob	{ l  � �	}����	} N   � �	~	~ n   � �		�	 4   � ���	�
�� 
cobj	� o   � ����� 0 	itemindex 	itemIndex	� o   � ����� 0 	thevalues 	theValues��  ��  	| ��	���
�� 
errt	� m   � ���
�� 
ctxt��  ��  	K  	 found $n   	L �	�	�    f o u n d   $ n	0 	���	� r   �	�	�	� [   � 	�	�	� l  � �	�����	� n  � �	�	�	� I   � ��������� 0 location  ��  ��  	� o   � ����� 0 
matchrange 
matchRange��  ��  	� l  � �	�����	� n  � �	�	�	� I   � ��������� 
0 length  ��  ��  	� o   � ����� 0 
matchrange 
matchRange��  ��  	� o      ���� 0 
startindex 
startIndex��  �� 0 i  � m   M N����  � l  N U	�����	� \   N U	�	�	� l  N S	�����	� n  N S	�	�	� I   O S�������� 	0 count  ��  ��  	� o   N O����  0 asocmatcharray asocMatchArray��  ��  	� m   S T���� ��  ��  ��  � 	�	�	� r  	�	�	� c  	�	�	� l 	�����	� n 	�	�	� I  	��	����� *0 substringfromindex_ substringFromIndex_	� 	��	� o  	
�~�~ 0 
startindex 
startIndex�  ��  	� o  	�}�} 0 
asocstring 
asocString��  ��  	� m  �|
�| 
ctxt	� n      	�	�	�  ;  	� o  �{�{ 0 resulttexts resultTexts	� 	�	�	� r  	�	�	� n 	�	�	� 1  �z
�z 
txdl	� 1  �y
�y 
ascr	� o      �x�x 0 oldtids oldTIDs	� 	�	�	� r   +	�	�	� m   #	�	� �	�	�  	� n     	�	�	� 1  &*�w
�w 
txdl	� 1  #&�v
�v 
ascr	� 	�	�	� r  ,3	�	�	� c  ,1	�	�	� o  ,-�u�u 0 resulttexts resultTexts	� m  -0�t
�t 
ctxt	� o      �s�s 0 
resulttext 
resultText	� 	�	�	� r  4=	�	�	� o  45�r�r 0 oldtids oldTIDs	� n     	�	�	� 1  8<�q
�q 
txdl	� 1  58�p
�p 
ascr	� 	��o	� L  >@	�	� o  >?�n�n 0 
resulttext 
resultText�o  � �m	�
�m conscase	� �l	�
�l consdiac	� �k	�
�k conshyph	� �j	�
�j conspunc	� �i�h
�i conswhit�h  � �g�f
�g consnume�f  � R      �e	�	�
�e .ascrerr ****      � ****	� o      �d�d 0 etext eText	� �c	�	�
�c 
errn	� o      �b�b 0 enumber eNumber	� �a	�	�
�a 
erob	� o      �`�` 0 efrom eFrom	� �_	��^
�_ 
errt	� o      �]�] 
0 eto eTo�^  � I  I[�\	��[�\ 
0 _error  	� 	�	�	� m  JM	�	� �	�	�  f o r m a t   t e x t	� 	�	�	� o  MN�Z�Z 0 etext eText	� 	�	�	� o  NO�Y�Y 0 enumber eNumber	� 	�	�	� o  OR�X�X 0 efrom eFrom	� 	��W	� o  RU�V�V 
0 eto eTo�W  �[  �  � 	�	�	� l     �U�T�S�U  �T  �S  	� 	�	�	� l     �R�Q�P�R  �Q  �P  	� 	�	�	� i  W Z	�	�	� I     �O	�	�
�O .Txt:Normnull���     ctxt	� o      �N�N 0 thetext theText	� �M	�	�
�M 
NoFo	� |�L�K	��J	��L  �K  	� o      �I�I 0 nopts nOpts�J  	� J      	�	� 	��H	� m      �G
�G LiBrLiOX�H  	� �F	��E
�F 
Loca	� |�D�C	��B	��D  �C  	� o      �A�A 0 
localecode 
localeCode�B  	� l     	��@�?	� m      	�	� �	�	�  n o n e�@  �?  �E  	� Q    �	�	�	�	� k   �	�	� 	�	�	� r    	�	�	� n   	�	�	� I    �>	��=�> "0 astextparameter asTextParameter	� 	�	�	� o    	�<�< 0 thetext theText	� 	��;	� m   	 
	�	� �	�	�  �;  �=  	� o    �:�: 0 _support  	� o      �9�9 0 thetext theText	� 	�	�	� r    	�	�	� n   	�
 	� I    �8
�7�8 0 aslist asList
 
�6
 o    �5�5 0 nopts nOpts�6  �7  
  o    �4�4 0 _support  	� o      �3�3 0 nopts nOpts	� 


 l   �2

�2  
   common case shortcuts   
 �

 ,   c o m m o n   c a s e   s h o r t c u t s
 

	
 Z   ,


�1�0

 =    #


 n   !


 1    !�/
�/ 
leng
 o    �.�. 0 thetext theText
 m   ! "�-�-  
 L   & (

 m   & '

 �

  �1  �0  
	 


 Z  - C

�,�+
 =  - 2


 o   - .�*�* 0 nopts nOpts
 J   . 1

 
�)
 m   . /�(
�( LiBrLiOX�)  
 L   5 ?

 I   5 >�'
�&�' 0 	_jointext 	_joinText
 


 n  6 9

 
 2  7 9�%
�% 
cpar
  o   6 7�$�$ 0 thetext theText
 
!�#
! 1   9 :�"
�" 
lnfd�#  �&  �,  �+  
 
"
#
" Z  D Q
$
%�!� 
$ =  D H
&
'
& o   D E�� 0 nopts nOpts
' J   E G��  
% L   K M
(
( o   K L�� 0 thetext theText�!  �   
# 
)
*
) l  R R�
+
,�  
+ &   else fully process options list   
, �
-
- @   e l s e   f u l l y   p r o c e s s   o p t i o n s   l i s t
* 
.
/
. Q   R�
0
1
2
0 k   U�
3
3 
4
5
4 Z   U f
6
7�
8
6 E  U Z
9
:
9 o   U V�� 0 nopts nOpts
: J   V Y
;
; 
<�
< m   V W�
� LiBrLiOX�  
7 r   ] `
=
>
= 1   ] ^�
� 
lnfd
> o      �� 0 	linebreak 	lineBreak�  
8 r   c f
?
@
? m   c d�
� 
msng
@ o      �� 0 	linebreak 	lineBreak
5 
A
B
A Z   g �
C
D��
C E  g l
E
F
E o   g h�� 0 nopts nOpts
F J   h k
G
G 
H�
H m   h i�
� LiBrLiCM�  
D k   o �
I
I 
J
K
J Z  o 
L
M��
L >  o r
N
O
N o   o p�� 0 	linebreak 	lineBreak
O m   p q�
� 
msng
M R   u {�

P
Q
�
 .ascrerr ****      � ****
P m   y z
R
R �
S
S 6 t o o   m a n y   l i n e   b r e a k   o p t i o n s
Q �	
T�
�	 
errn
T m   w x��f�  �  �  
K 
U
V
U Z  � �
W
X��
W =   � �
Y
Z
Y n  � �
[
\
[ 1   � ��
� 
leng
\ o   � ��� 0 nopts nOpts
Z m   � ��� 
X L   � �
]
] I   � ��
^� � 0 	_jointext 	_joinText
^ 
_
`
_ n  � �
a
b
a 2  � ���
�� 
cpar
b o   � ����� 0 thetext theText
` 
c��
c o   � ���
�� 
ret ��  �   �  �  
V 
d��
d r   � �
e
f
e o   � ���
�� 
ret 
f o      ���� 0 	linebreak 	lineBreak��  �  �  
B 
g
h
g Z   � �
i
j����
i E  � �
k
l
k o   � ����� 0 nopts nOpts
l J   � �
m
m 
n��
n m   � ���
�� LiBrLiWi��  
j k   � �
o
o 
p
q
p Z  � �
r
s����
r >  � �
t
u
t o   � ����� 0 	linebreak 	lineBreak
u m   � ���
�� 
msng
s R   � ���
v
w
�� .ascrerr ****      � ****
v m   � �
x
x �
y
y 6 t o o   m a n y   l i n e   b r e a k   o p t i o n s
w ��
z��
�� 
errn
z m   � �����f��  ��  ��  
q 
{
|
{ Z  � �
}
~����
} =   � �

�
 n  � �
�
�
� 1   � ���
�� 
leng
� o   � ����� 0 nopts nOpts
� m   � ����� 
~ L   � �
�
� I   � ���
����� 0 	_jointext 	_joinText
� 
�
�
� n  � �
�
�
� 2  � ���
�� 
cpar
� o   � ����� 0 thetext theText
� 
���
� b   � �
�
�
� o   � ���
�� 
ret 
� 1   � ���
�� 
lnfd��  ��  ��  ��  
| 
���
� r   � �
�
�
� b   � �
�
�
� o   � ���
�� 
ret 
� 1   � ���
�� 
lnfd
� o      ���� 0 	linebreak 	lineBreak��  ��  ��  
h 
�
�
� r   � �
�
�
� n  � �
�
�
� I   � ���
����� 0 
asnsstring 
asNSString
� 
���
� o   � ����� 0 thetext theText��  ��  
� o   � ����� 0 _support  
� o      ���� 0 
asocstring 
asocString
� 
�
�
� l  � ���
�
���  
� , & fold case, diacriticals, and/or width   
� �
�
� L   f o l d   c a s e ,   d i a c r i t i c a l s ,   a n d / o r   w i d t h
� 
�
�
� r   � �
�
�
� m   � �����  
� o      ���� 0 foldingflags foldingFlags
� 
�
�
� Z  �
�
�����
� E  � �
�
�
� o   � ����� 0 nopts nOpts
� J   � �
�
� 
���
� m   � ���
�� NoFoNoCa��  
� r   � �
�
�
� [   � �
�
�
� o   � ����� 0 foldingflags foldingFlags
� m   � ����� 
� o      ���� 0 foldingflags foldingFlags��  ��  
� 
�
�
� Z 
�
�����
� E 	
�
�
� o  ���� 0 nopts nOpts
� J  
�
� 
���
� m  ��
�� NoFoNoDi��  
� r  
�
�
� [  
�
�
� o  ���� 0 foldingflags foldingFlags
� m  ���� �
� o      ���� 0 foldingflags foldingFlags��  ��  
� 
�
�
� Z -
�
�����
� E 
�
�
� o  ���� 0 nopts nOpts
� J  
�
� 
���
� m  ��
�� NoFoNoWi��  
� r  ")
�
�
� [  "'
�
�
� o  "#���� 0 foldingflags foldingFlags
� m  #&���� 
� o      ���� 0 foldingflags foldingFlags��  ��  
� 
�
�
� Z .M
�
�����
� >  .1
�
�
� o  ./���� 0 foldingflags foldingFlags
� m  /0����  
� r  4I
�
�
� n 4G
�
�
� I  5G��
����� H0 "stringbyfoldingwithoptions_locale_ "stringByFoldingWithOptions_locale_
� 
�
�
� o  56���� 0 foldingflags foldingFlags
� 
���
� l 6C
�����
� n 6C
�
�
� I  ;C��
����� *0 asnslocaleparameter asNSLocaleParameter
� 
�
�
� o  ;<���� 0 
localecode 
localeCode
� 
���
� m  <?
�
� �
�
�  f o r   l o c a l e��  ��  
� o  6;���� 0 _support  ��  ��  ��  ��  
� o  45���� 0 
asocstring 
asocString
� o      ���� 0 
asocstring 
asocString��  ��  
� 
�
�
� l NN��
�
���  
� !  normalize white space runs   
� �
�
� 6   n o r m a l i z e   w h i t e   s p a c e   r u n s
� 
�
�
� Z  N�
�
�
���
� E NU
�
�
� o  NO���� 0 nopts nOpts
� J  OT
�
� 
���
� m  OR��
�� NoFoNoSp��  
� l X�
�
�
�
� Z  X�
�
���
�
� = X[
�
�
� o  XY���� 0 	linebreak 	lineBreak
� m  YZ��
�� 
msng
� l ^|
�
�
�
� r  ^|
�
�
� n ^z
�
�
� I  _z��
����� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_
� 
�
�
� m  _b
�
� �
�
� @ ( ? : \ r \ n | \ r | \ n | \ u 2 0 2 8 | \ u 2 0 2 9 | \ s ) +
� 
� 
� 1  be��
�� 
spac   l el���� n el o  hl���� 60 nsregularexpressionsearch NSRegularExpressionSearch m  eh��
�� misccura��  ��   �� J  lt 	 m  lm����  	 
��
 n mr I  nr�������� 
0 length  ��  ��   o  mn���� 0 
asocstring 
asocString��  ��  ��  
� o  ^_���� 0 
asocstring 
asocString
� o      ���� 0 
asocstring 
asocString
� b \ also convert line breaks (including Unicode line and paragraph separators) to single spaces   
� � �   a l s o   c o n v e r t   l i n e   b r e a k s   ( i n c l u d i n g   U n i c o d e   l i n e   a n d   p a r a g r a p h   s e p a r a t o r s )   t o   s i n g l e   s p a c e s��  
� l � k  �  r  � n � I  �������� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_  m  �� � F \ s * ( ? : \ r \ n | \ r | \ n | \ u 2 0 2 8 | \ u 2 0 2 9 ) + \ s *  o  ������ 0 	linebreak 	lineBreak   l ��!����! n ��"#" o  ������ 60 nsregularexpressionsearch NSRegularExpressionSearch# m  ����
�� misccura��  ��    $��$ J  ��%% &'& m  ������  ' (��( n ��)*) I  ���������� 
0 length  ��  ��  * o  ������ 0 
asocstring 
asocString��  ��  ��   o  ����� 0 
asocstring 
asocString o      ���� 0 
asocstring 
asocString +��+ r  ��,-, n ��./. I  ����0��� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_0 121 m  ��33 �44  \ s +2 565 1  ���~
�~ 
spac6 787 l ��9�}�|9 n ��:;: o  ���{�{ 60 nsregularexpressionsearch NSRegularExpressionSearch; m  ���z
�z misccura�}  �|  8 <�y< J  ��== >?> m  ���x�x  ? @�w@ n ��ABA I  ���v�u�t�v 
0 length  �u  �t  B o  ���s�s 0 
asocstring 
asocString�w  �y  �  / o  ���r�r 0 
asocstring 
asocString- o      �q�q 0 
asocstring 
asocString��     convert tabs and spaces    �CC 0   c o n v e r t   t a b s   a n d   s p a c e s
� J D note: this does not automatically trim leading/trailing white space   
� �DD �   n o t e :   t h i s   d o e s   n o t   a u t o m a t i c a l l y   t r i m   l e a d i n g / t r a i l i n g   w h i t e   s p a c e
� EFE > ��GHG o  ���p�p 0 	linebreak 	lineBreakH m  ���o
�o 
msngF I�nI l ��JKLJ r  ��MNM n ��OPO I  ���mQ�l�m �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_Q RSR m  ��TT �UU 0 \ r \ n | \ r | \ n | \ u 2 0 2 8 | \ u 2 0 2 9S VWV o  ���k�k 0 	linebreak 	lineBreakW XYX l ��Z�j�iZ n ��[\[ o  ���h�h 60 nsregularexpressionsearch NSRegularExpressionSearch\ m  ���g
�g misccura�j  �i  Y ]�f] J  ��^^ _`_ m  ���e�e  ` a�da n ��bcb I  ���c�b�a�c 
0 length  �b  �a  c o  ���`�` 0 
asocstring 
asocString�d  �f  �l  P o  ���_�_ 0 
asocstring 
asocStringN o      �^�^ 0 
asocstring 
asocStringK   standardize line breaks   L �dd 0   s t a n d a r d i z e   l i n e   b r e a k s�n  ��  
� efe l ���]gh�]  g 6 0 convert to specified Unicode normalization form   h �ii `   c o n v e r t   t o   s p e c i f i e d   U n i c o d e   n o r m a l i z a t i o n   f o r mf jkj Z  ��lm�\nl E ��opo o  ���[�[ 0 nopts nOptsp J  ��qq r�Zr m  ���Y
�Y NoFoNo_C�Z  m k  ��ss tut r  ��vwv n ��xyx I  ���X�W�V�X N0 %precomposedstringwithcanonicalmapping %precomposedStringWithCanonicalMapping�W  �V  y o  ���U�U 0 
asocstring 
asocStringw o      �T�T 0 
asocstring 
asocStringu z�Sz r  ��{|{ m  ���R
�R boovtrue| o      �Q�Q 0 didnormalize didNormalize�S  �\  n r  ��}~} m  ���P
�P boovfals~ o      �O�O 0 didnormalize didNormalizek � Z   *���N�M� E  ��� o   �L�L 0 nopts nOpts� J  �� ��K� m  �J
�J NoFoNo_D�K  � k  
&�� ��� Z 
���I�H� o  
�G�G 0 didnormalize didNormalize� R  �F��
�F .ascrerr ****      � ****� m  �� ��� : t o o   m a n y   U n i c o d e   f o r m   o p t i o n s� �E��D
�E 
errn� m  �C�Cf�D  �I  �H  � ��� r  "��� n  ��� I   �B�A�@�B L0 $decomposedstringwithcanonicalmapping $decomposedStringWithCanonicalMapping�A  �@  � o  �?�? 0 
asocstring 
asocString� o      �>�> 0 
asocstring 
asocString� ��=� r  #&��� m  #$�<
�< boovtrue� o      �;�; 0 didnormalize didNormalize�=  �N  �M  � ��� Z  +U���:�9� E +2��� o  +,�8�8 0 nopts nOpts� J  ,1�� ��7� m  ,/�6
�6 NoFoNoKC�7  � k  5Q�� ��� Z 5E���5�4� o  56�3�3 0 didnormalize didNormalize� R  9A�2��
�2 .ascrerr ****      � ****� m  =@�� ��� : t o o   m a n y   U n i c o d e   f o r m   o p t i o n s� �1��0
�1 
errn� m  ;<�/�/f�0  �5  �4  � ��� r  FM��� n FK��� I  GK�.�-�,�. V0 )precomposedstringwithcompatibilitymapping )precomposedStringWithCompatibilityMapping�-  �,  � o  FG�+�+ 0 
asocstring 
asocString� o      �*�* 0 
asocstring 
asocString� ��)� r  NQ��� m  NO�(
�( boovtrue� o      �'�' 0 didnormalize didNormalize�)  �:  �9  � ��&� Z  V����%�$� E V]��� o  VW�#�# 0 nopts nOpts� J  W\�� ��"� m  WZ�!
�! NoFoNoKD�"  � k  `|�� ��� Z `p��� �� o  `a�� 0 didnormalize didNormalize� R  dl���
� .ascrerr ****      � ****� m  hk�� ��� : t o o   m a n y   U n i c o d e   f o r m   o p t i o n s� ���
� 
errn� m  fg��f�  �   �  � ��� r  qx��� n qv��� I  rv���� T0 (decomposedstringwithcompatibilitymapping (decomposedStringWithCompatibilityMapping�  �  � o  qr�� 0 
asocstring 
asocString� o      �� 0 
asocstring 
asocString� ��� r  y|��� m  yz�
� boovtrue� o      �� 0 didnormalize didNormalize�  �%  �$  �&  
1 R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� m      ��f�  
2 n ����� I  ������ .0 throwinvalidparameter throwInvalidParameter� ��� o  ���
�
 0 nopts nOpts� ��� m  ���� ��� 
 u s i n g� ��� m  ���	
�	 
list� ��� o  ���� 0 etext eText�  �  � o  ���� 0 _support  
/ ��� L  ���� c  ����� o  ���� 0 
asocstring 
asocString� m  ���
� 
ctxt�  	� R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� � ��
�  
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  	� I  ��������� 
0 _error  � ��� m  ���� ���  n o r m a l i z e   t e x t� ��� o  ������ 0 etext eText� ��� o  ������ 0 enumber eNumber� ��� o  ������ 0 efrom eFrom� ���� o  ������ 
0 eto eTo��  ��  	� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  [ ^��� I     ����
�� .Txt:PadTnull���     ctxt� o      ���� 0 thetext theText� ��� 
�� 
toPl� o      ���� 0 	textwidth 	textWidth  ��
�� 
Char |��������  ��   o      ���� 0 padtext padText��   l     ���� m       �                                  ��  ��   ����
�� 
From |����	��
��  ��  	 o      ���� 0 whichend whichEnd��  
 l     ���� m      ��
�� LeTrLCha��  ��  ��  � Q     k    �  r     n    I    ������ "0 astextparameter asTextParameter  o    	���� 0 thetext theText �� m   	 
 �  ��  ��   o    ���� 0 _support   o      ���� 0 thetext theText  r     n    !  I    ��"���� (0 asintegerparameter asIntegerParameter" #$# o    ���� 0 	textwidth 	textWidth$ %��% m    && �''  t o   p l a c e s��  ��  ! o    ���� 0 _support   o      ���� 0 	textwidth 	textWidth ()( r    &*+* \    $,-, o     ���� 0 	textwidth 	textWidth- l    #.����. n    #/0/ 1   ! #��
�� 
leng0 o     !���� 0 thetext theText��  ��  + o      ���� 0 
widthtoadd 
widthToAdd) 121 Z  ' 334����3 B   ' *565 o   ' (���� 0 
widthtoadd 
widthToAdd6 m   ( )����  4 L   - /77 o   - .���� 0 thetext theText��  ��  2 898 r   4 A:;: n  4 ?<=< I   9 ?��>���� "0 astextparameter asTextParameter> ?@? o   9 :���� 0 padtext padText@ A��A m   : ;BB �CC 
 u s i n g��  ��  = o   4 9���� 0 _support  ; o      ���� 0 padtext padText9 DED r   B GFGF n  B EHIH 1   C E��
�� 
lengI o   B C���� 0 padtext padTextG o      ���� 0 padsize padSizeE JKJ Z  H \LM����L =   H MNON n  H KPQP 1   I K��
�� 
lengQ o   H I���� 0 padtext padTextO m   K L����  M R   P X��RS
�� .ascrerr ****      � ****R m   V WTT �UU f I n v a l i d    u s i n g    p a r a m e t e r   ( e m p t y   t e x t   n o t   a l l o w e d ) .S ��VW
�� 
errnV m   R S�����YW ��X��
�� 
erobX o   T U���� 0 padtext padText��  ��  ��  K YZY V   ] s[\[ r   i n]^] b   i l_`_ o   i j���� 0 padtext padText` o   j k���� 0 padtext padText^ o      ���� 0 padtext padText\ A   a haba n  a dcdc 1   b d��
�� 
lengd o   a b���� 0 padtext padTextb l  d ge����e [   d gfgf o   d e���� 0 
widthtoadd 
widthToAddg o   e f���� 0 padsize padSize��  ��  Z h��h Z   t �ijkli =  t wmnm o   t u���� 0 whichend whichEndn m   u v��
�� LeTrLChaj L   z �oo b   z �pqp l  z �r����r n  z �sts 7  { ���uv
�� 
ctxtu m    ����� v o   � ����� 0 
widthtoadd 
widthToAddt o   z {���� 0 padtext padText��  ��  q o   � ����� 0 thetext theTextk wxw =  � �yzy o   � ����� 0 whichend whichEndz m   � ���
�� LeTrTChax {|{ k   � �}} ~~ r   � ���� `   � ���� l  � ������� n  � ���� 1   � ���
�� 
leng� o   � ����� 0 thetext theText��  ��  � o   � ����� 0 padsize padSize� o      ���� 0 	padoffset 	padOffset ���� L   � ��� b   � ���� o   � ����� 0 thetext theText� l  � ������� n  � ���� 7  � �����
�� 
ctxt� l  � ������� [   � ���� m   � ����� � o   � ����� 0 	padoffset 	padOffset��  ��  � l  � ������� [   � ���� o   � ����� 0 	padoffset 	padOffset� o   � ����� 0 
widthtoadd 
widthToAdd��  ��  � o   � ����� 0 padtext padText��  ��  ��  | ��� =  � ���� o   � ����� 0 whichend whichEnd� m   � ���
�� LeTrBCha� ���� k   � ��� ��� Z  � �������� ?   � ���� o   � ��� 0 
widthtoadd 
widthToAdd� m   � ��~�~ � r   � ���� b   � ���� n  � ���� 7  � ��}��
�} 
ctxt� m   � ��|�| � l  � ���{�z� _   � ���� o   � ��y�y 0 
widthtoadd 
widthToAdd� m   � ��x�x �{  �z  � o   � ��w�w 0 padtext padText� o   � ��v�v 0 thetext theText� o      �u�u 0 thetext theText��  ��  � ��� r   � ���� `   � ���� l  � ���t�s� n  � ���� 1   � ��r
�r 
leng� o   � ��q�q 0 thetext theText�t  �s  � o   � ��p�p 0 padsize padSize� o      �o�o 0 	padoffset 	padOffset� ��n� L   � ��� b   � ���� o   � ��m�m 0 thetext theText� l  � ���l�k� n  � ���� 7  � ��j��
�j 
ctxt� l  � ���i�h� [   � ���� m   � ��g�g � o   � ��f�f 0 	padoffset 	padOffset�i  �h  � l  � ���e�d� [   � ���� o   � ��c�c 0 	padoffset 	padOffset� _   � ���� l  � ���b�a� [   � ���� o   � ��`�` 0 
widthtoadd 
widthToAdd� m   � ��_�_ �b  �a  � m   � ��^�^ �e  �d  � o   � ��]�] 0 padtext padText�l  �k  �n  ��  l n  � ���� I   � ��\��[�\ >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ��Z�Z 0 whichend whichEnd� ��Y� m   � ��� ���  a d d i n g�Y  �[  � o   � ��X�X 0 _support  ��   R      �W��
�W .ascrerr ****      � ****� o      �V�V 0 etext eText� �U��
�U 
errn� o      �T�T 0 enumber eNumber� �S��
�S 
erob� o      �R�R 0 efrom eFrom� �Q��P
�Q 
errt� o      �O�O 
0 eto eTo�P   I  �N��M�N 
0 _error  � ��� m  �� ���  p a d   t e x t� ��� o  	�L�L 0 etext eText� ��� o  	
�K�K 0 enumber eNumber� ��� o  
�J�J 0 efrom eFrom� ��I� o  �H�H 
0 eto eTo�I  �M  � ��� l     �G�F�E�G  �F  �E  � ��� l     �D�C�B�D  �C  �B  � ��� i  _ b��� I     �A��
�A .Txt:SliTnull���     ctxt� o      �@�@ 0 thetext theText� �?��
�? 
FIdx� |�>�=��<��>  �=  � o      �;�; 0 
startindex 
startIndex�<  � l     ��:�9� m      �8
�8 
msng�:  �9  � �7��6
�7 
TIdx� |�5�4��3��5  �4  � o      �2�2 0 endindex endIndex�3  � l     ��1�0� m      �/
�/ 
msng�1  �0  �6  � Q    ����� k   ��� ��� r    ��� n      I    �.�-�. "0 astextparameter asTextParameter  o    	�,�, 0 thetext theText �+ m   	 
 �  �+  �-   o    �*�* 0 _support  � o      �)�) 0 thetext theText� 	 r    

 n    1    �(
�( 
leng o    �'�' 0 thetext theText o      �&�& 0 	thelength 	theLength	  Z    I�%�$ =     o    �#�# 0 	thelength 	theLength m    �"�"   k    E  l   �!�!   � � note: index 0 is always disallowed as its position is ambiguous, being both before index 1 at start of text and after index -1 at end of text    �   n o t e :   i n d e x   0   i s   a l w a y s   d i s a l l o w e d   a s   i t s   p o s i t i o n   i s   a m b i g u o u s ,   b e i n g   b o t h   b e f o r e   i n d e x   1   a t   s t a r t   o f   t e x t   a n d   a f t e r   i n d e x   - 1   a t   e n d   o f   t e x t  Z   /� � =      o    �� 0 
startindex 
startIndex m    ��   R   # +� !
� .ascrerr ****      � ****  m   ) *"" �## Z I n v a l i d   i n d e x   (  f r o m    p a r a m e t e r   c a n n o t   b e   0 ) .! �$%
� 
errn$ m   % &���Y% �&�
� 
erob& o   ' (�� 0 
startindex 
startIndex�  �   �   '(' Z  0 B)*��) =   0 3+,+ o   0 1�� 0 endindex endIndex, m   1 2��  * R   6 >�-.
� .ascrerr ****      � ****- m   < =// �00 V I n v a l i d   i n d e x   (  t o    p a r a m e t e r   c a n n o t   b e   0 ) .. �12
� 
errn1 m   8 9���Y2 �3�
� 
erob3 o   : ;�� 0 endindex endIndex�  �  �  ( 4�4 L   C E55 m   C D66 �77  �  �%  �$   898 Z   J �:;<�: >  J M=>= o   J K�
�
 0 
startindex 
startIndex> m   K L�	
�	 
msng; k   P �?? @A@ r   P ]BCB n  P [DED I   U [�F�� (0 asintegerparameter asIntegerParameterF GHG o   U V�� 0 
startindex 
startIndexH I�I m   V WJJ �KK  f r o m�  �  E o   P U�� 0 _support  C o      �� 0 
startindex 
startIndexA LML Z  ^ pNO��N =   ^ aPQP o   ^ _� �  0 
startindex 
startIndexQ m   _ `����  O R   d l��RS
�� .ascrerr ****      � ****R m   j kTT �UU Z I n v a l i d   i n d e x   (  f r o m    p a r a m e t e r   c a n n o t   b e   0 ) .S ��VW
�� 
errnV m   f g�����YW ��X��
�� 
erobX o   h i���� 0 
startindex 
startIndex��  �  �  M Y��Y Z   q �Z[����Z =  q t\]\ o   q r���� 0 endindex endIndex] m   r s��
�� 
msng[ Z   w �^_`a^ A   w {bcb o   w x���� 0 
startindex 
startIndexc d   x zdd o   x y���� 0 	thelength 	theLength_ L   ~ �ee o   ~ ���� 0 thetext theText` fgf ?   � �hih o   � ����� 0 
startindex 
startIndexi o   � ����� 0 	thelength 	theLengthg j��j L   � �kk m   � �ll �mm  ��  a L   � �nn n  � �opo 7  � ���qr
�� 
ctxtq o   � ����� 0 
startindex 
startIndexr m   � �������p o   � ����� 0 thetext theText��  ��  ��  < sts =  � �uvu o   � ����� 0 endindex endIndexv m   � ���
�� 
msngt w��w R   � ���xy
�� .ascrerr ****      � ****x m   � �zz �{{ J M i s s i n g    f r o m    a n d / o r    t o    p a r a m e t e r .y ��|��
�� 
errn| m   � ������[��  ��  �  9 }~} Z   ������ >  � ���� o   � ����� 0 endindex endIndex� m   � ���
�� 
msng� k   ��� ��� r   � ���� n  � ���� I   � �������� (0 asintegerparameter asIntegerParameter� ��� o   � ����� 0 endindex endIndex� ���� m   � ��� ���  t o��  ��  � o   � ����� 0 _support  � o      ���� 0 endindex endIndex� ��� Z  � �������� =   � ���� o   � ����� 0 endindex endIndex� m   � �����  � R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� V I n v a l i d   i n d e x   (  t o    p a r a m e t e r   c a n n o t   b e   0 ) .� ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 endindex endIndex��  ��  ��  � ���� Z   �������� =  � ���� o   � ����� 0 
startindex 
startIndex� m   � ���
�� 
msng� Z   ������ A   � ���� o   � ����� 0 endindex endIndex� d   � ��� o   � ����� 0 	thelength 	theLength� L   � ��� m   � ��� ���  � ��� ?   � ���� o   � ����� 0 endindex endIndex� o   � ����� 0 	thelength 	theLength� ���� L   � ��� o   � ����� 0 thetext theText��  � L  �� n ��� 7 ����
�� 
ctxt� m  ���� � o  	���� 0 endindex endIndex� o  ���� 0 thetext theText��  ��  ��  ��  ��  ~ ��� l ������  � + % both start and end indexes are given   � ��� J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e n� ��� Z (������� A  ��� o  ���� 0 
startindex 
startIndex� m  ����  � r  $��� [  "��� [   ��� o  ���� 0 	thelength 	theLength� m  ���� � o   !���� 0 
startindex 
startIndex� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z ):������� A  ),��� o  )*���� 0 endindex endIndex� m  *+����  � r  /6��� [  /4��� [  /2��� o  /0���� 0 	thelength 	theLength� m  01���� � o  23���� 0 endindex endIndex� o      ���� 0 endindex endIndex��  ��  � ��� Z ;q������� G  ;f��� G  ;R��� ?  ;>��� o  ;<���� 0 
startindex 
startIndex� o  <=���� 0 endindex endIndex� F  AN��� A  AD��� o  AB���� 0 
startindex 
startIndex� m  BC���� � A  GJ��� o  GH���� 0 endindex endIndex� l 
HI������ m  HI���� ��  ��  � F  Ub��� ?  UX��� o  UV���� 0 
startindex 
startIndex� o  VW���� 0 	thelength 	theLength� ?  [^��� o  [\���� 0 endindex endIndex� o  \]���� 0 	thelength 	theLength� L  im�� m  il�� ���  ��  ��  � ��� Z  r������� A  ru��� o  rs���� 0 
startindex 
startIndex� m  st���� � r  x{��� m  xy���� � o      ���� 0 
startindex 
startIndex� ��� ?  ~���� o  ~���� 0 
startindex 
startIndex� o  ����� 0 	thelength 	theLength� ���� r  ����� o  ������ 0 	thelength 	theLength� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z  �� ��  A  �� o  ������ 0 endindex endIndex m  ������  r  �� m  ������  o      ���� 0 endindex endIndex  ?  ��	
	 o  ������ 0 endindex endIndex
 o  ������ 0 	thelength 	theLength �� r  �� o  ������ 0 	thelength 	theLength o      ���� 0 endindex endIndex��  ��  � �� L  �� n  �� 7 ����
�� 
ctxt o  ������ 0 
startindex 
startIndex o  ������ 0 endindex endIndex o  ������ 0 thetext theText��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      �� 
0 eto eTo��  � I  ���~�}�~ 
0 _error    m  �� �  s l i c e   t e x t  !  o  ���|�| 0 etext eText! "#" o  ���{�{ 0 enumber eNumber# $%$ o  ���z�z 0 efrom eFrom% &�y& o  ���x�x 
0 eto eTo�y  �}  � '(' l     �w�v�u�w  �v  �u  ( )*) l     �t�s�r�t  �s  �r  * +,+ i  c f-.- I     �q/0
�q .Txt:TrmTnull���     ctxt/ o      �p�p 0 thetext theText0 �o1�n
�o 
From1 |�m�l2�k3�m  �l  2 o      �j�j 0 whichend whichEnd�k  3 l     4�i�h4 m      �g
�g LeTrBCha�i  �h  �n  . Q     �5675 k    �88 9:9 r    ;<; n   =>= I    �f?�e�f "0 astextparameter asTextParameter? @A@ o    	�d�d 0 thetext theTextA B�cB m   	 
CC �DD  �c  �e  > o    �b�b 0 _support  < o      �a�a 0 thetext theText: EFE Z    -GH�`�_G H    II E   JKJ J    LL MNM m    �^
�^ LeTrLChaN OPO m    �]
�] LeTrTChaP Q�\Q m    �[
�[ LeTrBCha�\  K J    RR S�ZS o    �Y�Y 0 whichend whichEnd�Z  H n   )TUT I   # )�XV�W�X >0 throwinvalidconstantparameter throwInvalidConstantParameterV WXW o   # $�V�V 0 whichend whichEndX Y�UY m   $ %ZZ �[[  r e m o v i n g�U  �W  U o    #�T�T 0 _support  �`  �_  F \�S\ P   . �]^_] k   3 �`` aba l  3 ?cdec Z  3 ?fg�R�Qf =  3 6hih o   3 4�P�P 0 thetext theTexti m   4 5jj �kk  g L   9 ;ll m   9 :mm �nn  �R  �Q  d H B check if theText is empty or contains white space characters only   e �oo �   c h e c k   i f   t h e T e x t   i s   e m p t y   o r   c o n t a i n s   w h i t e   s p a c e   c h a r a c t e r s   o n l yb pqp r   @ Srsr J   @ Dtt uvu m   @ A�O�O v w�Nw m   A B�M�M���N  s J      xx yzy o      �L�L 0 
startindex 
startIndexz {�K{ o      �J�J 0 endindex endIndex�K  q |}| Z   T x~�I�H~ E  T \��� J   T X�� ��� m   T U�G
�G LeTrLCha� ��F� m   U V�E
�E LeTrBCha�F  � J   X [�� ��D� o   X Y�C�C 0 whichend whichEnd�D   V   _ t��� r   j o��� [   j m��� o   j k�B�B 0 
startindex 
startIndex� m   k l�A�A � o      �@�@ 0 
startindex 
startIndex� =  c i��� n   c g��� 4   d g�?�
�? 
cha � o   e f�>�> 0 
startindex 
startIndex� o   c d�=�= 0 thetext theText� m   g h�� ���  �I  �H  } ��� Z   y ����<�;� E  y ���� J   y }�� ��� m   y z�:
�: LeTrTCha� ��9� m   z {�8
�8 LeTrBCha�9  � J   } ��� ��7� o   } ~�6�6 0 whichend whichEnd�7  � V   � ���� r   � ���� \   � ���� o   � ��5�5 0 endindex endIndex� m   � ��4�4 � o      �3�3 0 endindex endIndex� =  � ���� n   � ���� 4   � ��2�
�2 
cha � o   � ��1�1 0 endindex endIndex� o   � ��0�0 0 thetext theText� m   � ��� ���  �<  �;  � ��/� L   � ��� n   � ���� 7  � ��.��
�. 
ctxt� o   � ��-�- 0 
startindex 
startIndex� o   � ��,�, 0 endindex endIndex� o   � ��+�+ 0 thetext theText�/  ^ �*�
�* conscase� �)�
�) consdiac� �(�
�( conshyph� �'�&
�' conspunc�&  _ �%�
�% consnume� �$�#
�$ conswhit�#  �S  6 R      �"��
�" .ascrerr ****      � ****� o      �!�! 0 etext eText� � ��
�  
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  7 I   � ����� 
0 _error  � ��� m   � ��� ���  t r i m   t e x t� ��� o   � ��� 0 etext eText� ��� o   � ��� 0 enumber eNumber� ��� o   � ��� 0 efrom eFrom� ��� o   � ��� 
0 eto eTo�  �  , ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ����  �   Split and Join Suite   � ��� *   S p l i t   a n d   J o i n   S u i t e� ��� l     �
�	��
  �	  �  � ��� i  g j��� I      ���� .0 _aslinebreakparameter _asLineBreakParameter� ��� o      �� 0 linebreaktype lineBreakType� ��� o      �� 0 parametername parameterName�  �  � l    /���� Z     /����� =    ��� o     �� 0 linebreaktype lineBreakType� m    �
� LiBrLiOX� L    	�� 1    � 
�  
lnfd� ��� =   ��� o    ���� 0 linebreaktype lineBreakType� m    ��
�� LiBrLiCM� ��� L    �� o    ��
�� 
ret � ��� =   ��� o    ���� 0 linebreaktype lineBreakType� m    ��
�� LiBrLiWi� ���� L    !�� b     ��� o    ��
�� 
ret � 1    ��
�� 
lnfd��  � n  $ /��� I   ) /������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� � � o   ) *���� 0 linebreaktype lineBreakType  �� o   * +���� 0 parametername parameterName��  ��  � o   $ )���� 0 _support  � < 6 used by `join paragraphs` and `normalize line breaks`   � � l   u s e d   b y   ` j o i n   p a r a g r a p h s `   a n d   ` n o r m a l i z e   l i n e   b r e a k s `�  l     ��������  ��  ��    l     ��������  ��  ��    i  k n	
	 I      ������ 0 
_splittext 
_splitText  o      ���� 0 thetext theText �� o      ���� 0 theseparator theSeparator��  ��  
 l    ^ k     ^  r      n    
 I    
������ 0 aslist asList �� o    ���� 0 theseparator theSeparator��  ��   o     ���� 0 _support   o      ���� 0 delimiterlist delimiterList  X    C�� Q    > ! l    )"#$" r     )%&% c     %'(' n     #)*) 1   ! #��
�� 
pcnt* o     !���� 0 aref aRef( m   # $��
�� 
ctxt& n      +,+ 1   & (��
�� 
pcnt, o   % &���� 0 aref aRef#�� caution: AS silently ignores invalid TID values, so separator items must be explicitly validated to catch any user errors; for now, just coerce to text and catch errors, but might want to make it more rigorous in future (e.g. if a list of lists is given, should sublist be treated as an error instead of just coercing it to text, which is itself TIDs sensitive); see also existing TODO on TypeSupport's asTextParameter handler   $ �--V   c a u t i o n :   A S   s i l e n t l y   i g n o r e s   i n v a l i d   T I D   v a l u e s ,   s o   s e p a r a t o r   i t e m s   m u s t   b e   e x p l i c i t l y   v a l i d a t e d   t o   c a t c h   a n y   u s e r   e r r o r s ;   f o r   n o w ,   j u s t   c o e r c e   t o   t e x t   a n d   c a t c h   e r r o r s ,   b u t   m i g h t   w a n t   t o   m a k e   i t   m o r e   r i g o r o u s   i n   f u t u r e   ( e . g .   i f   a   l i s t   o f   l i s t s   i s   g i v e n ,   s h o u l d   s u b l i s t   b e   t r e a t e d   a s   a n   e r r o r   i n s t e a d   o f   j u s t   c o e r c i n g   i t   t o   t e x t ,   w h i c h   i s   i t s e l f   T I D s   s e n s i t i v e ) ;   s e e   a l s o   e x i s t i n g   T O D O   o n   T y p e S u p p o r t ' s   a s T e x t P a r a m e t e r   h a n d l e r  R      ����.
�� .ascrerr ****      � ****��  . ��/��
�� 
errn/ d      00 m      �������  ! n  1 >121 I   6 >��3���� 60 throwinvalidparametertype throwInvalidParameterType3 454 o   6 7���� 0 aref aRef5 676 m   7 888 �99 
 u s i n g7 :;: m   8 9��
�� 
ctxt; <��< m   9 :== �>>  l i s t   o f   t e x t��  ��  2 o   1 6���� 0 _support  �� 0 aref aRef o    ���� 0 delimiterlist delimiterList ?@? r   D IABA n  D GCDC 1   E G��
�� 
txdlD 1   D E��
�� 
ascrB o      ���� 0 oldtids oldTIDs@ EFE r   J OGHG o   J K���� 0 delimiterlist delimiterListH n     IJI 1   L N��
�� 
txdlJ 1   K L��
�� 
ascrF KLK r   P UMNM n   P SOPO 2  Q S��
�� 
citmP o   P Q���� 0 thetext theTextN o      ���� 0 
resultlist 
resultListL QRQ r   V [STS o   V W���� 0 oldtids oldTIDsT n     UVU 1   X Z��
�� 
txdlV 1   W X��
�� 
ascrR W��W L   \ ^XX o   \ ]���� 0 
resultlist 
resultList��   � � used by `split text` to split text using one or more text item delimiters and current or predefined considering/ignoring settings    �YY   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   o n e   o r   m o r e   t e x t   i t e m   d e l i m i t e r s   a n d   c u r r e n t   o r   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s Z[Z l     ��������  ��  ��  [ \]\ l     ��������  ��  ��  ] ^_^ i  o r`a` I      ��b���� 0 _splitpattern _splitPatternb cdc o      ���� 0 thetext theTextd e��e o      ���� 0 patterntext patternText��  ��  a l    �fghf k     �ii jkj Z    lm����l =     non l    	p����p I    	��qr
�� .corecnte****       ****q J     ss t��t o     ���� 0 patterntext patternText��  r ��u��
�� 
koclu m    ��
�� 
list��  ��  ��  o m   	 
���� m r    vwv I   ��xy
�� .Txt:JoiTnull���     ****x o    ���� 0 patterntext patternTexty ��z��
�� 
Sepaz m    {{ �||  |��  w o      ���� 0 patterntext patternText��  ��  k }~} r    *� n   (��� I   ! (������� @0 asnsregularexpressionparameter asNSRegularExpressionParameter� ��� o   ! "���� 0 patterntext patternText� ��� m   " #����  � ���� m   # $�� ���  a t��  ��  � o    !���� 0 _support  � o      ���� 0 asocpattern asocPattern~ ��� r   + 7��� n  + 5��� I   0 5������� ,0 asnormalizednsstring asNormalizedNSString� ���� o   0 1���� 0 thetext theText��  ��  � o   + 0���� 0 _support  � o      ���� 0 
asocstring 
asocString� ��� l  8 ;���� r   8 ;��� m   8 9����  � o      ���� &0 asocnonmatchstart asocNonMatchStart� G A used to calculate NSRanges for non-matching portions of NSString   � ��� �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n g� ��� r   < @��� J   < >����  � o      ���� 0 
resultlist 
resultList� ��� l  A A������  � @ : iterate over each non-matched + matched range in NSString   � ��� t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g� ��� r   A R��� n  A P��� I   B P������� @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   B C���� 0 
asocstring 
asocString� ��� m   C D����  � ���� J   D L�� ��� m   D E����  � ���� n  E J��� I   F J�������� 
0 length  ��  ��  � o   E F���� 0 
asocstring 
asocString��  ��  ��  � o   A B���� 0 asocpattern asocPattern� o      ����  0 asocmatcharray asocMatchArray� ��� Y   S ��������� k   c ��� ��� r   c p��� l  c n������ n  c n��� I   i n������� 0 rangeatindex_ rangeAtIndex_� ���� m   i j��  ��  ��  � l  c i��~�}� n  c i��� I   d i�|��{�|  0 objectatindex_ objectAtIndex_� ��z� o   d e�y�y 0 i  �z  �{  � o   c d�x�x  0 asocmatcharray asocMatchArray�~  �}  ��  ��  � o      �w�w  0 asocmatchrange asocMatchRange� ��� r   q x��� n  q v��� I   r v�v�u�t�v 0 location  �u  �t  � o   q r�s�s  0 asocmatchrange asocMatchRange� o      �r�r  0 asocmatchstart asocMatchStart� ��� r   y ���� c   y ���� l  y ���q�p� n  y ���� I   z ��o��n�o *0 substringwithrange_ substringWithRange_� ��m� K   z ��� �l���l 0 location  � o   { |�k�k &0 asocnonmatchstart asocNonMatchStart� �j��i�j 
0 length  � \   } ���� o   } ~�h�h  0 asocmatchstart asocMatchStart� o   ~ �g�g &0 asocnonmatchstart asocNonMatchStart�i  �m  �n  � o   y z�f�f 0 
asocstring 
asocString�q  �p  � m   � ��e
�e 
ctxt� n      ���  ;   � �� o   � ��d�d 0 
resultlist 
resultList� ��c� r   � ���� [   � ���� o   � ��b�b  0 asocmatchstart asocMatchStart� l  � ���a�`� n  � ���� I   � ��_�^�]�_ 
0 length  �^  �]  � o   � ��\�\  0 asocmatchrange asocMatchRange�a  �`  � o      �[�[ &0 asocnonmatchstart asocNonMatchStart�c  �� 0 i  � m   V W�Z�Z  � \   W ^��� l  W \��Y�X� n  W \��� I   X \�W�V�U�W 	0 count  �V  �U  � o   W X�T�T  0 asocmatcharray asocMatchArray�Y  �X  � m   \ ]�S�S ��  � ��� l  � ��R���R  � "  add final non-matched range   � ��� 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e� ��� r   � ���� c   � ���� l  � ���Q�P� n  � ���� I   � ��O��N�O *0 substringfromindex_ substringFromIndex_� ��M� o   � ��L�L &0 asocnonmatchstart asocNonMatchStart�M  �N  � o   � ��K�K 0 
asocstring 
asocString�Q  �P  � m   � ��J
�J 
ctxt� n          ;   � � o   � ��I�I 0 
resultlist 
resultList�  l  � � Z  � ��H�G F   � �	
	 =   � � n  � � 1   � ��F
�F 
leng o   � ��E�E 0 
resultlist 
resultList m   � ��D�D 
 =   � � n  � � 1   � ��C
�C 
leng n  � � 4   � ��B
�B 
cobj m   � ��A�A  o   � ��@�@ 0 
resultlist 
resultList m   � ��?�?   L   � � J   � ��>�>  �H  �G   U O for consistency with _splitText(), where `text items of ""` returns empty list    � �   f o r   c o n s i s t e n c y   w i t h   _ s p l i t T e x t ( ) ,   w h e r e   ` t e x t   i t e m s   o f   " " `   r e t u r n s   e m p t y   l i s t �= L   � � o   � ��<�< 0 
resultlist 
resultList�=  g Q K used by `split text` to split text using a regular expression as separator   h � �   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   a   r e g u l a r   e x p r e s s i o n   a s   s e p a r a t o r_  l     �;�:�9�;  �:  �9    l     �8�7�6�8  �7  �6     i  s v!"! I      �5#�4�5 0 	_jointext 	_joinText# $%$ o      �3�3 0 thelist theList% &�2& o      �1�1 0 separatortext separatorText�2  �4  " k     5'' ()( r     *+* n    ,-, 1    �0
�0 
txdl- 1     �/
�/ 
ascr+ o      �.�. 0 oldtids oldTIDs) ./. r    010 o    �-�- 0 separatortext separatorText1 n     232 1    
�,
�, 
txdl3 1    �+
�+ 
ascr/ 454 Q    ,6786 r    9:9 c    ;<; o    �*�* 0 thelist theList< m    �)
�) 
ctxt: o      �(�( 0 
resulttext 
resultText7 R      �'�&=
�' .ascrerr ****      � ****�&  = �%>�$
�% 
errn> d      ?? m      �#�#��$  8 k    ,@@ ABA r    !CDC o    �"�" 0 oldtids oldTIDsD n     EFE 1     �!
�! 
txdlF 1    � 
�  
ascrB G�G R   " ,�HI
� .ascrerr ****      � ****H m   * +JJ �KK b I n v a l i d   d i r e c t   p a r a m e t e r   ( e x p e c t e d   l i s t   o f   t e x t ) .I �LM
� 
errnL m   $ %���YM �NO
� 
erobN o   & '�� 0 thelist theListO �P�
� 
errtP m   ( )�
� 
list�  �  5 QRQ r   - 2STS o   - .�� 0 oldtids oldTIDsT n     UVU 1   / 1�
� 
txdlV 1   . /�
� 
ascrR W�W L   3 5XX o   3 4�� 0 
resulttext 
resultText�    YZY l     ����  �  �  Z [\[ l     ����  �  �  \ ]^] l     �_`�  _  -----   ` �aa 
 - - - - -^ bcb l     �
�	��
  �	  �  c ded i  w zfgf I     �hi
� .Txt:SplTnull���     ctxth o      �� 0 thetext theTexti �jk
� 
Sepaj |��l�m�  �  l o      �� 0 theseparator theSeparator�  m l     n� ��n m      ��
�� 
msng�   ��  k ��o��
�� 
Usino |����p��q��  ��  p o      ���� 0 matchformat matchFormat��  q l     r����r m      ��
�� SerECmpI��  ��  ��  g k     �ss tut l     ��vw��  v � � convenience handler for splitting text using TIDs that can also use a regular expression pattern as separator; similar to Python's str.split()   w �xx   c o n v e n i e n c e   h a n d l e r   f o r   s p l i t t i n g   t e x t   u s i n g   T I D s   t h a t   c a n   a l s o   u s e   a   r e g u l a r   e x p r e s s i o n   p a t t e r n   a s   s e p a r a t o r ;   s i m i l a r   t o   P y t h o n ' s   s t r . s p l i t ( )u y��y Q     �z{|z k    �}} ~~ r    ��� n   ��� I    ������� "0 astextparameter asTextParameter� ��� o    	���� 0 thetext theText� ���� m   	 
�� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 thetext theText ��� Z    ������� =    ��� n   ��� 1    ��
�� 
leng� o    ���� 0 thetext theText� m    ����  � L    �� J    ����  ��  ��  � ���� Z   ! ������ =  ! $��� o   ! "���� 0 theseparator theSeparator� m   " #��
�� 
msng� l  ' 3���� L   ' 3�� I   ' 2������� 0 _splitpattern _splitPattern� ��� I  ( -�����
�� .Txt:TrmTnull���     ctxt� o   ( )���� 0 thetext theText��  � ���� m   - .�� ���  \ s +��  ��  � � � if `at` parameter is omitted, trim ends then then split on whitespace runs, same as Python's str.split() default behavior (any `using` options are ignored)   � ���8   i f   ` a t `   p a r a m e t e r   i s   o m i t t e d ,   t r i m   e n d s   t h e n   t h e n   s p l i t   o n   w h i t e s p a c e   r u n s ,   s a m e   a s   P y t h o n ' s   s t r . s p l i t ( )   d e f a u l t   b e h a v i o r   ( a n y   ` u s i n g `   o p t i o n s   a r e   i g n o r e d )� ��� =  6 9��� o   6 7���� 0 matchformat matchFormat� m   7 8��
�� SerECmpI� ��� P   < J���� L   A I�� I   A H������� 0 
_splittext 
_splitText� ��� o   B C���� 0 thetext theText� ���� o   C D���� 0 theseparator theSeparator��  ��  � ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  � ����
�� conscase��  � ��� =  M P��� o   M N���� 0 matchformat matchFormat� m   N O��
�� SerECmpP� ��� L   S [�� I   S Z������� 0 _splitpattern _splitPattern� ��� o   T U���� 0 thetext theText� ���� o   U V���� 0 theseparator theSeparator��  ��  � ��� =  ^ a��� o   ^ _���� 0 matchformat matchFormat� m   _ `��
�� SerECmpC� ��� P   d r����� L   i q�� I   i p������� 0 
_splittext 
_splitText� ��� o   j k���� 0 thetext theText� ���� o   k l���� 0 theseparator theSeparator��  ��  � ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  ��  � ��� =  u x��� o   u v���� 0 matchformat matchFormat� m   v w��
�� SerECmpE� ��� P   { ����� L   � ��� I   � �������� 0 
_splittext 
_splitText� ��� o   � ����� 0 thetext theText� ���� o   � ����� 0 theseparator theSeparator��  ��  � ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  � ����
�� consnume��  � ��� =  � ���� o   � ����� 0 matchformat matchFormat� m   � ���
�� SerECmpD� ���� L   � ��� I   � �������� 0 
_splittext 
_splitText� ��� o   � ����� 0 thetext theText� ���� o   � ����� 0 theseparator theSeparator��  ��  ��  � n  � ���� I   � �������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ����� 0 matchformat matchFormat� ���� m   � ��� ��� 
 u s i n g��  ��  � o   � ����� 0 _support  ��  { R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  | I   � ��� ���� 
0 _error     m   � � �  s p l i t   t e x t  o   � ����� 0 etext eText  o   � ����� 0 enumber eNumber 	
	 o   � ��� 0 efrom eFrom
 � o   � ��� 
0 eto eTo�  ��  ��  e  l     ����  �  �    l     ����  �  �    i  { ~ I     �
� .Txt:JoiTnull���     **** o      �� 0 thelist theList ��
� 
Sepa |����  �   o      �� 0 separatortext separatorText�   m       �  �   Q     0 L     I    �~�}�~ 0 	_jointext 	_joinText  !  n   "#" I   	 �|$�{�| 0 aslist asList$ %�z% o   	 
�y�y 0 thelist theList�z  �{  # o    	�x�x 0 _support  ! &�w& n   '(' I    �v)�u�v "0 astextparameter asTextParameter) *+* o    �t�t 0 separatortext separatorText+ ,�s, m    -- �.. 
 u s i n g�s  �u  ( o    �r�r 0 _support  �w  �}   R      �q/0
�q .ascrerr ****      � ****/ o      �p�p 0 etext eText0 �o12
�o 
errn1 o      �n�n 0 enumber eNumber2 �m34
�m 
erob3 o      �l�l 0 efrom eFrom4 �k5�j
�k 
errt5 o      �i�i 
0 eto eTo�j   I   & 0�h6�g�h 
0 _error  6 787 m   ' (99 �::  j o i n   t e x t8 ;<; o   ( )�f�f 0 etext eText< =>= o   ) *�e�e 0 enumber eNumber> ?@? o   * +�d�d 0 efrom eFrom@ A�cA o   + ,�b�b 
0 eto eTo�c  �g   BCB l     �a�`�_�a  �`  �_  C DED l     �^�]�\�^  �]  �\  E FGF i   �HIH I     �[J�Z
�[ .Txt:SplPnull���     ctxtJ o      �Y�Y 0 thetext theText�Z  I Q     $KLMK L    NN n    OPO 2   �X
�X 
cparP n   QRQ I    �WS�V�W "0 astextparameter asTextParameterS TUT o    	�U�U 0 thetext theTextU V�TV m   	 
WW �XX  �T  �V  R o    �S�S 0 _support  L R      �RYZ
�R .ascrerr ****      � ****Y o      �Q�Q 0 etext eTextZ �P[\
�P 
errn[ o      �O�O 0 enumber eNumber\ �N]^
�N 
erob] o      �M�M 0 efrom eFrom^ �L_�K
�L 
errt_ o      �J�J 
0 eto eTo�K  M I    $�I`�H�I 
0 _error  ` aba m    cc �dd   s p l i t   p a r a g r a p h sb efe o    �G�G 0 etext eTextf ghg o    �F�F 0 enumber eNumberh iji o    �E�E 0 efrom eFromj k�Dk o     �C�C 
0 eto eTo�D  �H  G lml l     �B�A�@�B  �A  �@  m non l     �?�>�=�?  �>  �=  o pqp i  � �rsr I     �<tu
�< .Txt:JoiPnull���     ****t o      �;�; 0 thelist theListu �:v�9
�: 
LiBrv |�8�7w�6x�8  �7  w o      �5�5 0 linebreaktype lineBreakType�6  x l     y�4�3y m      �2
�2 LiBrLiOX�4  �3  �9  s Q     ,z{|z L    }} I    �1~�0�1 0 	_jointext 	_joinText~ � n   ��� I   	 �/��.�/ 0 aslist asList� ��-� o   	 
�,�, 0 thelist theList�-  �.  � o    	�+�+ 0 _support  � ��*� I    �)��(�) .0 _aslinebreakparameter _asLineBreakParameter� ��� o    �'�' 0 linebreaktype lineBreakType� ��&� m    �� ��� 
 u s i n g�&  �(  �*  �0  { R      �%��
�% .ascrerr ****      � ****� o      �$�$ 0 etext eText� �#��
�# 
errn� o      �"�" 0 enumber eNumber� �!��
�! 
erob� o      � �  0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  | I   " ,���� 
0 _error  � ��� m   # $�� ���  j o i n   p a r a g r a p h s� ��� o   $ %�� 0 etext eText� ��� o   % &�� 0 enumber eNumber� ��� o   & '�� 0 efrom eFrom� ��� o   ' (�� 
0 eto eTo�  �  q ��� l     ����  �  �  � ��� l     ����  �  �  �       "�����������������������������������  �  �
�	��������� ������������������������������������������
�
 
pimr�	 (0 _unmatchedtexttype _UnmatchedTextType� $0 _matchedtexttype _MatchedTextType� &0 _matchedgrouptype _MatchedGroupType� 0 _support  � 
0 _error  � $0 _matchinforecord _matchInfoRecord� 0 _matchrecords _matchRecords� &0 _matchedgrouplist _matchedGroupList� 0 _findpattern _findPattern�  "0 _replacepattern _replacePattern�� 0 	_findtext 	_findText�� 0 _replacetext _replaceText
�� .Txt:Srchnull���     ctxt
�� .Txt:EPatnull���     ctxt
�� .Txt:ETemnull���     ctxt
�� .Txt:UppTnull���     ctxt
�� .Txt:CapTnull���     ctxt
�� .Txt:LowTnull���     ctxt
�� .Txt:FTxtnull���     ctxt
�� .Txt:Normnull���     ctxt
�� .Txt:PadTnull���     ctxt
�� .Txt:SliTnull���     ctxt
�� .Txt:TrmTnull���     ctxt�� .0 _aslinebreakparameter _asLineBreakParameter�� 0 
_splittext 
_splitText�� 0 _splitpattern _splitPattern�� 0 	_jointext 	_joinText
�� .Txt:SplTnull���     ctxt
�� .Txt:JoiTnull���     ****
�� .Txt:SplPnull���     ctxt
�� .Txt:JoiPnull���     ****� ����� �  �� �����
�� 
cobj� ��   �� 
�� 
frmk��  
� 
TxtU
� 
TxtM
� 
TxtG� ��   �� C
�� 
scpt� �� M���������� 
0 _error  �� ����� �  ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  � ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�  ]������ �� &0 throwcommanderror throwCommandError�� b  ࠡ����+ � �� ����������� $0 _matchinforecord _matchInfoRecord�� ����� �  ���������� 0 
asocstring 
asocString��  0 asocmatchrange asocMatchRange�� 0 
textoffset 
textOffset�� 0 
recordtype 
recordType��  � �������������� 0 
asocstring 
asocString��  0 asocmatchrange asocMatchRange�� 0 
textoffset 
textOffset�� 0 
recordtype 
recordType�� 0 	foundtext 	foundText��  0 nexttextoffset nextTextOffset� ���������������� *0 substringwithrange_ substringWithRange_
�� 
ctxt
�� 
leng
�� 
pcls�� 0 
startindex 
startIndex�� 0 endindex endIndex� 0 	foundtext 	foundText� �� $��k+  �&E�O���,E�O���k���lv� � ������� 0 _matchrecords _matchRecords� ��� �  ������� 0 
asocstring 
asocString�  0 asocmatchrange asocMatchRange�  0 asocstartindex asocStartIndex� 0 
textoffset 
textOffset� (0 nonmatchrecordtype nonMatchRecordType� "0 matchrecordtype matchRecordType�  � ������������ 0 
asocstring 
asocString�  0 asocmatchrange asocMatchRange�  0 asocstartindex asocStartIndex� 0 
textoffset 
textOffset� (0 nonmatchrecordtype nonMatchRecordType� "0 matchrecordtype matchRecordType�  0 asocmatchstart asocMatchStart� 0 asocmatchend asocMatchEnd� &0 asocnonmatchrange asocNonMatchRange� 0 nonmatchinfo nonMatchInfo� 0 	matchinfo 	matchInfo� ������ 0 location  � 
0 length  � � $0 _matchinforecord _matchInfoRecord
� 
cobj� W�j+  E�O��j+ E�O�ᦢ�E�O*�����+ E[�k/E�Z[�l/E�ZO*�����+ E[�k/E�Z[�l/E�ZO�����v� ������� &0 _matchedgrouplist _matchedGroupList� ��� �  ����� 0 
asocstring 
asocString� 0 	asocmatch 	asocMatch� 0 
textoffset 
textOffset� &0 includenonmatches includeNonMatches�  � �������������� 0 
asocstring 
asocString� 0 	asocmatch 	asocMatch� 0 
textoffset 
textOffset� &0 includenonmatches includeNonMatches� "0 submatchresults subMatchResults� 0 groupindexes groupIndexes� (0 asocfullmatchrange asocFullMatchRange� &0 asocnonmatchstart asocNonMatchStart� $0 asocfullmatchend asocFullMatchEnd� 0 i  � 0 nonmatchinfo nonMatchInfo� 0 	matchinfo 	matchInfo� &0 asocnonmatchrange asocNonMatchRange� 	����������  0 numberofranges numberOfRanges� 0 rangeatindex_ rangeAtIndex_� 0 location  � 
0 length  � � 0 _matchrecords _matchRecords
� 
cobj� � $0 _matchinforecord _matchInfoRecord� �jvE�O�j+  kE�O�j ��jk+ E�O�j+ E�O��j+ E�O Uk�kh 	*���k+ ��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO��6F[OY��O� #�㨧�E�O*���b  �+ �k/�6FY hY hO�� �������� 0 _findpattern _findPattern� ��� �  �~�}�|�{�~ 0 thetext theText�} 0 patterntext patternText�| &0 includenonmatches includeNonMatches�{  0 includematches includeMatches�  � �z�y�x�w�v�u�t�s�r�q�p�o�n�m�l�z 0 thetext theText�y 0 patterntext patternText�x &0 includenonmatches includeNonMatches�w  0 includematches includeMatches�v 0 asocpattern asocPattern�u 0 
asocstring 
asocString�t &0 asocnonmatchstart asocNonMatchStart�s 0 
textoffset 
textOffset�r 0 
resultlist 
resultList�q  0 asocmatcharray asocMatchArray�p 0 i  �o 0 	asocmatch 	asocMatch�n 0 nonmatchinfo nonMatchInfo�m 0 	matchinfo 	matchInfo�l 0 	foundtext 	foundText� ��k���j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�k (0 asbooleanparameter asBooleanParameter�j @0 asnsregularexpressionparameter asNSRegularExpressionParameter�i ,0 asnormalizednsstring asNormalizedNSString�h 
0 length  �g @0 matchesinstring_options_range_ matchesInString_options_range_�f 	0 count  �e  0 objectatindex_ objectAtIndex_�d 0 rangeatindex_ rangeAtIndex_�c �b 0 _matchrecords _matchRecords
�a 
cobj�` �_ 0 foundgroups foundGroups�^ 0 
startindex 
startIndex�] &0 _matchedgrouplist _matchedGroupList�\ *0 substringfromindex_ substringFromIndex_
�[ 
ctxt
�Z 
pcls�Y 0 endindex endIndex
�X 
leng�W 0 	foundtext 	foundText�V �b  ��l+ E�Ob  ��l+ E�Ob  �j�m+ E�Ob  �k+ E�OjE�OkE�OjvE�O��jj�j+ lvm+ E�O }j�j+ kkh 
��k+ 	E�O*��jk+ 
��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO� ��*���a ,��+ l%�6FY h[OY��O� 1��k+ a &E�Oa b  a �a �a ,a �a �6FY hO�� �U��T�S���R�U "0 _replacepattern _replacePattern�T �Q��Q �  �P�O�N�P 0 thetext theText�O 0 patterntext patternText�N 0 templatetext templateText�S  � �M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�M 0 thetext theText�L 0 patterntext patternText�K 0 templatetext templateText�J 0 
asocstring 
asocString�I 0 asocpattern asocPattern�H 0 
resultlist 
resultList�G &0 asocnonmatchstart asocNonMatchStart�F 0 
textoffset 
textOffset�E  0 asocmatcharray asocMatchArray�D 0 i  �C 0 	asocmatch 	asocMatch�B 0 nonmatchinfo nonMatchInfo�A 0 	matchinfo 	matchInfo�@ 0 matchedgroups matchedGroups�? 0 etext eText�> 0 enumber eNumber�= 0 efrom eFrom�< 
0 eto eTo�; 0 oldtids oldTIDs�: 0 
resulttext 
resultText� �9��8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&��%�$�#H�"�!� p��9 ,0 asnormalizednsstring asNormalizedNSString�8 @0 asnsregularexpressionparameter asNSRegularExpressionParameter
�7 
kocl
�6 
scpt
�5 .corecnte****       ****
�4 
cobj�3 
0 length  �2 @0 matchesinstring_options_range_ matchesInString_options_range_�1 	0 count  �0  0 objectatindex_ objectAtIndex_�/ 0 rangeatindex_ rangeAtIndex_�. �- 0 _matchrecords _matchRecords�, �+ 0 	foundtext 	foundText�* 0 
startindex 
startIndex�) &0 _matchedgrouplist _matchedGroupList�(  0 replacepattern replacePattern
�' 
ctxt�& 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  
�% 
errn
�$ 
erob
�# 
errt�" *0 substringfromindex_ substringFromIndex_
�! 
ascr
�  
txdl� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_�RQb  �k+  E�Ob  �j�m+ E�O�kv��l k jvjkmvE[�k/E�Z[�l/E�Z[�m/E�ZO��jj�j+ lvm+ E�O �j�j+ 	kkh 	��k+ 
E�O*��jk+ ��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO��,�6FO*���a ,e�+ E�O ���,�l+ a &�6FW X  )a �a ] a ] �a �%[OY�qO��k+ a &�6FO_ a ,E^ Oa _ a ,FO�a &E^ O] _ a ,FO] Y ��jj�j+ lv��+ a &� �������� 0 	_findtext 	_findText� ��� �  ����� 0 thetext theText� 0 fortext forText� &0 includenonmatches includeNonMatches�  0 includematches includeMatches�  � 
�����
�	����� 0 thetext theText� 0 fortext forText� &0 includenonmatches includeNonMatches�  0 includematches includeMatches�
 0 
resultlist 
resultList�	 0 oldtids oldTIDs� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	foundtext 	foundText� 0 i  � ����� �������������(����`
� 
ascr
� 
txdl
� 
citm
� 
leng
�  
ctxt
�� 
pcls�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 	foundtext 	foundText�� 
�� .corecnte****       ****�� 0 foundgroups foundGroups�� 
�
jvE�O��,E�O���,FOkE�O��k/�,E�O� 0�� �[�\[Z�\Z�2E�Y �E�O�b  �����6FY hO �l��-j kh 	�kE�O��,�[�\[�/\�i/2�,E�O� 3�� �[�\[Z�\Z�2E�Y �E�O�b  ����jv��6FY hO�kE�O���/�,kE�O� 0�� �[�\[Z�\Z�2E�Y �E�O�b  �����6FY h[OY�aO���,FO�� ������������� 0 _replacetext _replaceText�� ����� �  �������� 0 thetext theText�� 0 fortext forText�� 0 newtext newText��  � ������������������������������ 0 thetext theText�� 0 fortext forText�� 0 newtext newText�� 0 oldtids oldTIDs�� 0 
resultlist 
resultList�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 i  �� 0 	foundtext 	foundText�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 
resulttext 
resultText� �������������������������������Kb��
�� 
ascr
�� 
txdl
�� 
kocl
�� 
scpt
�� .corecnte****       ****
�� 
citm
�� 
leng
�� 
cobj
�� 
ctxt�� 0 replacetext replaceText�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob
�� 
errt�� �� "0 astextparameter asTextParameter��(��,E�O���,FO�kv��l j �jvk��k/�,mvE[�k/E�Z[�l/E�Z[�m/E�ZO�� �[�\[Z�\Z�2�6FY hO �l��-j kh �kE�O��,�[�\[�/\�i/2�,E�O�� �[�\[Z�\Z�2E�Y �E�O ��k+ 
�&�6FW X  )����a a �%O�kE�O���/�,kE�O�� �[�\[Z�\Z�2�6FY h[OY�rOa ��,FY b  �a l+ E�O��-E�O���,FO��&E�O���,FO�� �����������
�� .Txt:Srchnull���     ctxt�� 0 thetext theText�� �����
�� 
For_�� 0 fortext forText� ����
�� 
Usin� {�������� 0 matchformat matchFormat��  
�� SerECmpI� ����
�� 
Repl� {���� 0 newtext newText�  
� 
msng� ���
� 
Retu� {���� 0 resultformat resultFormat�  
� RetEMatT�  � ������������ 0 thetext theText� 0 fortext forText� 0 matchformat matchFormat� 0 newtext newText� 0 resultformat resultFormat� &0 includenonmatches includeNonMatches�  0 includematches includeMatches� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 0��������������������+��56����Z�pq�������'��4��� "0 astextparameter asTextParameter
� 
leng
� 
errn��Y
� 
erob� 
� 
msng
� RetEMatT
� 
pcls� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	foundtext 	foundText� 
� 
cobj
� RetEUmaT
� RetEAllT� >0 throwinvalidconstantparameter throwInvalidConstantParameter
� SerECmpI� 0 	_findtext 	_findText
� SerECmpP� 0 _findpattern _findPattern
� SerECmpC
� SerECmpE
� SerECmpD� 0 _replacetext _replaceText� "0 _replacepattern _replacePattern� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  ��P;b  ��l+ E�Ob  ��l+ E�O��,j  )�����Y hO�� L��,j  $��  jvY �b  �k�j��a kvY hO��  felvE[a k/E�Z[a l/E�ZY S�a   eflvE[a k/E�Z[a l/E�ZY 1�a   eelvE[a k/E�Z[a l/E�ZY b  �a l+ O�a   a a  *�����+ VY ��a   *�����+ Y w�a   a g *�����+ VY Z�a   a a   *�����+ VY ;�a !  &�a "  )����a #Y hO*�����+ Y b  �a $l+ Y ���,j  	a %Y hO�a   a a  *���m+ &VY ��a   *���m+ 'Y t�a   a a   *���m+ &VY V�a   a g *���m+ &VY :�a !  %�a (  )����a )Y hO*���m+ &Y b  �a *l+ W X + ,*a -����a .+ /� �D�����
� .Txt:EPatnull���     ctxt� 0 thetext theText�  � ������ 0 thetext theText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ��~X�}�|�{�z�f�y�x
� misccura�~ *0 nsregularexpression NSRegularExpression�} "0 astextparameter asTextParameter�| 40 escapedpatternforstring_ escapedPatternForString_
�{ 
ctxt�z 0 etext eText� �w�v�
�w 
errn�v 0 enumber eNumber� �u�t�
�u 
erob�t 0 efrom eFrom� �s�r�q
�s 
errt�r 
0 eto eTo�q  �y �x 
0 _error  � + ��,b  ��l+ k+ �&W X  *衢���+ 
� �pv�o�n���m
�p .Txt:ETemnull���     ctxt�o 0 thetext theText�n  � �l�k�j�i�h�l 0 thetext theText�k 0 etext eText�j 0 enumber eNumber�i 0 efrom eFrom�h 
0 eto eTo� �g�f��e�d�c�b���a�`
�g misccura�f *0 nsregularexpression NSRegularExpression�e "0 astextparameter asTextParameter�d 60 escapedtemplateforstring_ escapedTemplateForString_
�c 
ctxt�b 0 etext eText� �_�^�
�_ 
errn�^ 0 enumber eNumber� �]�\�
�] 
erob�\ 0 efrom eFrom� �[�Z�Y
�[ 
errt�Z 
0 eto eTo�Y  �a �` 
0 _error  �m + ��,b  ��l+ k+ �&W X  *衢���+ 
� �X��W�V���U
�X .Txt:UppTnull���     ctxt�W 0 thetext theText�V �T��S
�T 
Loca� {�R�Q�P�R 0 
localecode 
localeCode�Q  
�P 
msng�S  � �O�N�M�L�K�J�I�O 0 thetext theText�N 0 
localecode 
localeCode�M 0 
asocstring 
asocString�L 0 etext eText�K 0 enumber eNumber�J 0 efrom eFrom�I 
0 eto eTo� ��H�G�F�E�D��C�B�A���@�?�H "0 astextparameter asTextParameter�G 0 
asnsstring 
asNSString
�F 
msng�E "0 uppercasestring uppercaseString
�D 
ctxt�C *0 asnslocaleparameter asNSLocaleParameter�B 80 uppercasestringwithlocale_ uppercaseStringWithLocale_�A 0 etext eText� �>�=�
�> 
errn�= 0 enumber eNumber� �<�;�
�< 
erob�; 0 efrom eFrom� �:�9�8
�: 
errt�9 
0 eto eTo�8  �@ �? 
0 _error  �U Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � �7�6�5���4
�7 .Txt:CapTnull���     ctxt�6 0 thetext theText�5 �3 �2
�3 
Loca  {�1�0�/�1 0 
localecode 
localeCode�0  
�/ 
msng�2  � �.�-�,�+�*�)�(�. 0 thetext theText�- 0 
localecode 
localeCode�, 0 
asocstring 
asocString�+ 0 etext eText�* 0 enumber eNumber�) 0 efrom eFrom�( 
0 eto eTo� �'�&�%�$�#:�"�!� F���' "0 astextparameter asTextParameter�& 0 
asnsstring 
asNSString
�% 
msng�$ &0 capitalizedstring capitalizedString
�# 
ctxt�" *0 asnslocaleparameter asNSLocaleParameter�! <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_�  0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �4 Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � �V���
� .Txt:LowTnull���     ctxt� 0 thetext theText� ��
� 
Loca {���� 0 
localecode 
localeCode�  
� 
msng�   ����
�	��� 0 thetext theText� 0 
localecode 
localeCode� 0 
asocstring 
asocString�
 0 etext eText�	 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo n�������� �������� "0 astextparameter asTextParameter� 0 
asnsstring 
asNSString
� 
msng� "0 lowercasestring lowercaseString
� 
ctxt� *0 asnslocaleparameter asNSLocaleParameter�  80 lowercasestringwithlocale_ lowercaseStringWithLocale_�� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ����	
�� 
erob�� 0 efrom eFrom	 ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � �������
��
�� .Txt:FTxtnull���     ctxt�� 0 templatetext templateText�� ������
�� 
Usin�� 0 	thevalues 	theValues��  
 �������������������������������������� 0 templatetext templateText�� 0 	thevalues 	theValues�� 0 asocpattern asocPattern�� 0 
asocstring 
asocString��  0 asocmatcharray asocMatchArray�� 0 resulttexts resultTexts�� 0 
startindex 
startIndex�� 0 i  �� 0 
matchrange 
matchRange�� 0 thetoken theToken�� 0 	itemindex 	itemIndex�� 0 theitem theItem�� 0 oldtids oldTIDs�� 0 
resulttext 
resultText�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo (�����������������������������������	9����������������	u	w������	���	������ 0 aslist asList
�� misccura�� *0 nsregularexpression NSRegularExpression
�� 
msng�� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_�� 0 
asnsstring 
asNSString�� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 rangeatindex_ rangeAtIndex_�� 0 location  �� �� *0 substringwithrange_ substringWithRange_
�� 
ctxt
�� 
cha 
�� 
long
�� 
cobj��   ���
� 
errn��\�  
�� 
errn���\
�� 
erob
�� 
errt�� �� *0 substringfromindex_ substringFromIndex_
�� 
ascr
�� 
txdl�� 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  �� � 
0 _error  ��\C��;b  �k+ E�O��,�j�m+ E�Ob  �k+ E�O��jj�j+ 	lvm+ 
E�OjvE�OjE�O �j�j+ kkh ��k+ jk+ E�O���j+ ��k+ a &�6FO��k+ a &E�O�a k/a   �a l/�6FY O�a l/a &E�O�a �/E�O �a &�6FW +X  )a a a �a �/a a a a �%a %O�j+ �j+ 	E�[OY�RO��k+ a &�6FO_  a !,E�Oa "_  a !,FO�a &E�O�_  a !,FO�VW X # $*a %��] ] a &+ '� �	����
� .Txt:Normnull���     ctxt� 0 thetext theText� �
� 
NoFo {��� 0 nopts nOpts�   ��   �
� LiBrLiOX ��
� 
Loca {��	�� 0 
localecode 
localeCode�  �   ������������ 0 thetext theText� 0 nopts nOpts� 0 
localecode 
localeCode� 0 	linebreak 	lineBreak� 0 
asocstring 
asocString� 0 foldingflags foldingFlags� 0 didnormalize didNormalize� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo :	����
��������
R��
x������
����
�������3T���~��}�|��{�z��y�x��w�v�u��t�s� "0 astextparameter asTextParameter� 0 aslist asList
� 
leng
� LiBrLiOX
� 
cpar
� 
lnfd� 0 	_jointext 	_joinText
� 
msng
� LiBrLiCM
� 
errn�f
� 
ret 
� LiBrLiWi� 0 
asnsstring 
asNSString
� NoFoNoCa
� NoFoNoDi� �
� NoFoNoWi� � *0 asnslocaleparameter asNSLocaleParameter� H0 "stringbyfoldingwithoptions_locale_ "stringByFoldingWithOptions_locale_
� NoFoNoSp
� 
spac
� misccura� 60 nsregularexpressionsearch NSRegularExpressionSearch� 
0 length  � � �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_
� NoFoNo_C� N0 %precomposedstringwithcanonicalmapping %precomposedStringWithCanonicalMapping
�~ NoFoNo_D�} L0 $decomposedstringwithcanonicalmapping $decomposedStringWithCanonicalMapping
�| NoFoNoKC�{ V0 )precomposedstringwithcompatibilitymapping )precomposedStringWithCompatibilityMapping
�z NoFoNoKD�y T0 (decomposedstringwithcompatibilitymapping (decomposedStringWithCompatibilityMapping�x 0 etext eText �r�q�p
�r 
errn�qf�p  
�w 
list�v .0 throwinvalidparameter throwInvalidParameter
�u 
ctxt �o�n
�o 
errn�n 0 enumber eNumber �m�l
�m 
erob�l 0 efrom eFrom �k�j�i
�k 
errt�j 
0 eto eTo�i  �t �s 
0 _error  ���b  ��l+ E�Ob  �k+ E�O��,j  �Y hO��kv  *��-�l+ Y hO�jv  �Y hO0��kv �E�Y �E�O��kv 0�� )��l�Y hO��,k  *��-�l+ Y hO�E�Y hO��kv 6�� )��la Y hO��,k  *��-��%l+ Y hO��%E�Y hOb  �k+ E�OjE�O�a kv 
�kE�Y hO�a kv �a E�Y hO�a kv �a E�Y hO�j ��b  �a l+ l+ E�Y hO�a kv g��  #�a _ a a ,j�j+ lva  + !E�Y =�a "�a a ,j�j+ lva  + !E�O�a #_ a a ,j�j+ lva  + !E�Y (�� !�a $�a a ,j�j+ lva  + !E�Y hO�a %kv �j+ &E�OeE�Y fE�O�a 'kv !� )��la (Y hO�j+ )E�OeE�Y hO�a *kv !� )��la +Y hO�j+ ,E�OeE�Y hO�a -kv !� )��la .Y hO�j+ /E�OeE�Y hW X 0 1b  �a 2a 3�a  + 4O�a 5&W X 0 6*a 7����a 8+ 9� �h��g�f�e
�h .Txt:PadTnull���     ctxt�g 0 thetext theText�f �d�c
�d 
toPl�c 0 	textwidth 	textWidth �b
�b 
Char {�a�`�a 0 padtext padText�`   �_ �^
�_ 
From  {�]�\�[�] 0 whichend whichEnd�\  
�[ LeTrLCha�^   �Z�Y�X�W�V�U�T�S�R�Q�P�Z 0 thetext theText�Y 0 	textwidth 	textWidth�X 0 padtext padText�W 0 whichend whichEnd�V 0 
widthtoadd 
widthToAdd�U 0 padsize padSize�T 0 	padoffset 	padOffset�S 0 etext eText�R 0 enumber eNumber�Q 0 efrom eFrom�P 
0 eto eTo �O&�N�MB�L�K�J�IT�H�G�F�E��D�C!��B�A�O "0 astextparameter asTextParameter�N (0 asintegerparameter asIntegerParameter
�M 
leng
�L 
errn�K�Y
�J 
erob�I 
�H LeTrLCha
�G 
ctxt
�F LeTrTCha
�E LeTrBCha�D >0 throwinvalidconstantparameter throwInvalidConstantParameter�C 0 etext eText! �@�?"
�@ 
errn�? 0 enumber eNumber" �>�=#
�> 
erob�= 0 efrom eFrom# �<�;�:
�< 
errt�; 
0 eto eTo�:  �B �A 
0 _error  �e �b  ��l+ E�Ob  ��l+ E�O���,E�O�j �Y hOb  ��l+ E�O��,E�O��,j  )�����Y hO h��,����%E�[OY��O��  �[�\[Zk\Z�2�%Y s��  ��,�#E�O��[�\[Zk�\Z��2%Y P��  ?�k �[�\[Zk\Z�l"2�%E�Y hO��,�#E�O��[�\[Zk�\Z��kl"2%Y b  ��l+ W X  *a ����a + � �9��8�7$%�6
�9 .Txt:SliTnull���     ctxt�8 0 thetext theText�7 �5&'
�5 
FIdx& {�4�3�2�4 0 
startindex 
startIndex�3  
�2 
msng' �1(�0
�1 
TIdx( {�/�.�-�/ 0 endindex endIndex�.  
�- 
msng�0  $ �,�+�*�)�(�'�&�%�, 0 thetext theText�+ 0 
startindex 
startIndex�* 0 endindex endIndex�) 0 	thelength 	theLength�( 0 etext eText�' 0 enumber eNumber�& 0 efrom eFrom�% 
0 eto eTo% �$�#�"�!� �"/6�J�Tl��z������)���$ "0 astextparameter asTextParameter
�# 
leng
�" 
errn�!�Y
�  
erob� 
� 
msng� (0 asintegerparameter asIntegerParameter
� 
ctxt��[
� 
bool� 0 etext eText) ��*
� 
errn� 0 enumber eNumber* ��+
� 
erob� 0 efrom eFrom+ ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �6��b  ��l+ E�O��,E�O�j  -�j  )�����Y hO�j  )�����Y hO�Y hO�� Tb  ��l+ E�O�j  )�����Y hO��  )��' �Y �� �Y �[�\[Z�\Zi2EY hY ��  )�a la Y hO�� Zb  �a l+ E�O�j  )����a Y hO��  +��' 	a Y �� �Y �[�\[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO��
 �k	 	�ka &a &
 ��	 	��a &a & 	a Y hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[�\[Z�\Z�2EW X  *a ����a + � �.��,-�
� .Txt:TrmTnull���     ctxt� 0 thetext theText� �.�

� 
From. {�	���	 0 whichend whichEnd�  
� LeTrBCha�
  , ������� ��� 0 thetext theText� 0 whichend whichEnd� 0 
startindex 
startIndex� 0 endindex endIndex� 0 etext eText� 0 enumber eNumber�  0 efrom eFrom�� 
0 eto eTo- C��������Z��^_jm����������/������� "0 astextparameter asTextParameter
�� LeTrLCha
�� LeTrTCha
�� LeTrBCha�� >0 throwinvalidconstantparameter throwInvalidConstantParameter
�� 
cobj
�� 
cha 
�� 
ctxt�� 0 etext eText/ ����0
�� 
errn�� 0 enumber eNumber0 ����1
�� 
erob�� 0 efrom eFrom1 ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � � �b  ��l+ E�O���mv�kv b  ��l+ Y hO�� {��  �Y hOkilvE[�k/E�Z[�l/E�ZO��lv�kv  h��/� �kE�[OY��Y hO��lv�kv  h��/� �kE�[OY��Y hO�[�\[Z�\Z�2EVW X  *a ����a + � �������23���� .0 _aslinebreakparameter _asLineBreakParameter�� ��4�� 4  ������ 0 linebreaktype lineBreakType�� 0 parametername parameterName��  2 ������ 0 linebreaktype lineBreakType�� 0 parametername parameterName3 ������������
�� LiBrLiOX
�� 
lnfd
�� LiBrLiCM
�� 
ret 
�� LiBrLiWi�� >0 throwinvalidconstantparameter throwInvalidConstantParameter�� 0��  �EY %��  �Y ��  	��%Y b  ��l+ � ��
����56���� 0 
_splittext 
_splitText�� ��7�� 7  ������ 0 thetext theText�� 0 theseparator theSeparator��  5 �������������� 0 thetext theText�� 0 theseparator theSeparator�� 0 delimiterlist delimiterList�� 0 aref aRef�� 0 oldtids oldTIDs�� 0 
resultlist 
resultList6 ��������������88=������������ 0 aslist asList
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
ctxt��  8 ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType
�� 
ascr
�� 
txdl
�� 
citm�� _b  �k+  E�O 5�[��l kh  ��,�&��,FW X  b  �����+ [OY��O��,E�O���,FO��-E�O���,FO�� ��a���9:��� 0 _splitpattern _splitPattern�� �;� ;  ��� 0 thetext theText� 0 patterntext patternText�  9 
����������� 0 thetext theText� 0 patterntext patternText� 0 asocpattern asocPattern� 0 
asocstring 
asocString� &0 asocnonmatchstart asocNonMatchStart� 0 
resultlist 
resultList�  0 asocmatcharray asocMatchArray� 0 i  �  0 asocmatchrange asocMatchRange�  0 asocmatchstart asocMatchStart: ����{�����������������
� 
kocl
� 
list
� .corecnte****       ****
� 
Sepa
� .Txt:JoiTnull���     ****� @0 asnsregularexpressionparameter asNSRegularExpressionParameter� ,0 asnormalizednsstring asNormalizedNSString� 
0 length  � @0 matchesinstring_options_range_ matchesInString_options_range_� 	0 count  �  0 objectatindex_ objectAtIndex_� 0 rangeatindex_ rangeAtIndex_� 0 location  � � *0 substringwithrange_ substringWithRange_
� 
ctxt� *0 substringfromindex_ substringFromIndex_
� 
leng
� 
cobj
� 
bool� ӡkv��l k  ���l E�Y hOb  �j�m+ E�Ob  �k+ E�OjE�OjvE�O��jj�j+ 	lvm+ 
E�O Hj�j+ kkh ��k+ jk+ E�O�j+ E�O��驤�k+ a &�6FO��j+ 	E�[OY��O��k+ a &�6FO�a ,k 	 �a k/a ,j a & jvY hO�� �"��<=�� 0 	_jointext 	_joinText� �>� >  ��� 0 thelist theList� 0 separatortext separatorText�  < ����� 0 thelist theList� 0 separatortext separatorText� 0 oldtids oldTIDs� 0 
resulttext 
resultText= ������?������������J
� 
ascr
� 
txdl
�� 
ctxt��  ? ������
�� 
errn���\��  
�� 
errn���Y
�� 
erob
�� 
errt
�� 
list�� � 6��,E�O���,FO 
��&E�W X  ���,FO)�������O���,FO�� ��g����@A��
�� .Txt:SplTnull���     ctxt�� 0 thetext theText�� ��BC
�� 
SepaB {��~�}� 0 theseparator theSeparator�~  
�} 
msngC �|D�{
�| 
UsinD {�z�y�x�z 0 matchformat matchFormat�y  
�x SerECmpI�{  @ �w�v�u�t�s�r�q�w 0 thetext theText�v 0 theseparator theSeparator�u 0 matchformat matchFormat�t 0 etext eText�s 0 enumber eNumber�r 0 efrom eFrom�q 
0 eto eToA ��p�o�n�m��l�k���j�i�h��g���f��e�dE�c�b�p "0 astextparameter asTextParameter
�o 
leng
�n 
msng
�m .Txt:TrmTnull���     ctxt�l 0 _splitpattern _splitPattern
�k SerECmpI�j 0 
_splittext 
_splitText
�i SerECmpP
�h SerECmpC
�g SerECmpE
�f SerECmpD�e >0 throwinvalidconstantparameter throwInvalidConstantParameter�d 0 etext eTextE �a�`F
�a 
errn�` 0 enumber eNumberF �_�^G
�_ 
erob�^ 0 efrom eFromG �]�\�[
�] 
errt�\ 
0 eto eTo�[  �c �b 
0 _error  �� � �b  ��l+ E�O��,j  jvY hO��  *�j �l+ Y z��  �� *��l+ 
VY c��  *��l+ Y R��  �g *��l+ 
VY ;��  �a  *��l+ 
VY "�a   *��l+ 
Y b  �a l+ W X  *a ����a + � �Z�Y�XHI�W
�Z .Txt:JoiTnull���     ****�Y 0 thelist theList�X �VJ�U
�V 
SepaJ {�T�S�T 0 separatortext separatorText�S  �U  H �R�Q�P�O�N�M�R 0 thelist theList�Q 0 separatortext separatorText�P 0 etext eText�O 0 enumber eNumber�N 0 efrom eFrom�M 
0 eto eToI 	�L-�K�J�IK9�H�G�L 0 aslist asList�K "0 astextparameter asTextParameter�J 0 	_jointext 	_joinText�I 0 etext eTextK �F�EL
�F 
errn�E 0 enumber eNumberL �D�CM
�D 
erob�C 0 efrom eFromM �B�A�@
�B 
errt�A 
0 eto eTo�@  �H �G 
0 _error  �W 1  *b  �k+  b  ��l+ l+ W X  *梣���+ � �?I�>�=NO�<
�? .Txt:SplPnull���     ctxt�> 0 thetext theText�=  N �;�:�9�8�7�; 0 thetext theText�: 0 etext eText�9 0 enumber eNumber�8 0 efrom eFrom�7 
0 eto eToO W�6�5�4Pc�3�2�6 "0 astextparameter asTextParameter
�5 
cpar�4 0 etext eTextP �1�0Q
�1 
errn�0 0 enumber eNumberQ �/�.R
�/ 
erob�. 0 efrom eFromR �-�,�+
�- 
errt�, 
0 eto eTo�+  �3 �2 
0 _error  �< % b  ��l+ �-EW X  *塢���+ � �*s�)�(ST�'
�* .Txt:JoiPnull���     ****�) 0 thelist theList�( �&U�%
�& 
LiBrU {�$�#�"�$ 0 linebreaktype lineBreakType�#  
�" LiBrLiOX�%  S �!� �����! 0 thelist theList�  0 linebreaktype lineBreakType� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToT 	�����V���� 0 aslist asList� .0 _aslinebreakparameter _asLineBreakParameter� 0 	_jointext 	_joinText� 0 etext eTextV ��W
� 
errn� 0 enumber eNumberW ��X
� 
erob� 0 efrom eFromX ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �' - *b  �k+  *��l+ l+ W X  *梣���+ ascr  ��ޭ