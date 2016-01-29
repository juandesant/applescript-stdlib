FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� WebLib -- commands for manipulating URLs and sending HTTP requests

TO DO:

- `split URL`, `join URL`; note that `join URL` should allow `using base URL` to be optionally specified (in which case the URL being joined might be either a record or a string; see urllib.parse.urljoin); NSURL provides following properties:

		scheme
		user
		password
		host
		port
		path
		pathExtension
		pathComponents
		parameterString
		query
		fragment
		
		(Q. would it make sense to keep user+password+host+port combined, and provide separate commands for splitting and joining that, or else include properties for both representations c.f. `convert record to date`, or else group it as a sub-record and provide boolean option on `split URL` indicating whether to keep it together as text or decompose into sub-record)

- `normalize URL`? see NSURL's standardizedURL()

- `split URL query`, `join URL query` -- {{"foo", "xyz"}, {"bar", 123}} <-> "foo=xyz&bar=123"; note that this should work for both URL query strings and 'application/x-www-form-urlencoded' HTTP body data; e.g. see Python's [horribly named]:

	urllib.parse.parse_qsl(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace')
	urllib.parse.urlencode(query, doseq=False, safe='', encoding=None, errors=None)


- `escape URL`, `unescape URL` -- see:
	
	@interface NSString (NSURLUtilities)

	// Returns a new string made from the receiver by replacing all characters not in the allowedCharacters set with percent encoded characters. UTF-8 encoding is used to determine the correct percent encoded characters. Entire URL strings cannot be percent-encoded. This method is intended to percent-encode an URL component or subcomponent string, NOT the entire URL string. Any characters in allowedCharacters outside of the 7-bit ASCII range are ignored.
	- (nullable NSString)stringByAddingPercentEncodingWithAllowedCharacters:(NSCharacterSet)allowedCharacters NS_AVAILABLE(10_9, 7_0);

	// Returns a new string made from the receiver by replacing all percent encoded sequences with the matching UTF-8 characters.
	@property (nullable, readonly, copy) NSString *stringByRemovingPercentEncoding NS_AVAILABLE(10_9, 7_0);

	@end
	
	and in Python:

	 urllib.parse.quote(string, safe='/', encoding=None, errors=None)
	 urllib.parse.quote_plus(string, safe='', encoding=None, errors=None) -- note: `form quoting` should be a boolean option to `escape URL`, indicating whether or not spaces should be escaped as '+' (and '+' as '%NN', and use "" instead of "/" as default `safe` chars)
	 urllib.parse.unquote(string, encoding='utf-8', errors='replace') -- e.g. unquote('/El%20Ni%C3%B1o/') yields '/El Ni�o/'
	 urllib.parse.unquote_plus(string, encoding='utf-8', errors='replace') -- again, include `form quoting` boolean option


- move JSON commands from FormatLib to here (longer term, it'd be useful to provide some sort of 'JSON schema' support, where a nestable list/record template structure could be used to describe the expected/required structure (including required types and default values))


- `send HTTP request` -- urllib.request.Request(url, data=None, headers={}, origin_req_host=None, unverifiable=False, method=None) [method=GET/POST/PUT/etc]; see NSURLSession, NSURLRequest, NSURLResponse

	- Q. what API? e.g. should command simply block until completion or timeout? (an async API would probably be overkill, not to mention difficult, for most AS users; any users that do need more advanced features can always drop down into Cocoa via ASOC)

	- Q. need to give some thought to encodings in HTTP body data: simplest might be for body to be either `text` or `data`, and leave encoding/decoding to TextLib (which currently doesn't support this, but could be made to); Q. what AE type to assign to data objects: cRawData ('rdat'), or something more specific?

- what about including a basic HTTP server, c.f. Python's http.server module? (wouldn't be suitable for public web, but might be handy for localhost/intranet use)

     � 	 	V   W e b L i b   - -   c o m m a n d s   f o r   m a n i p u l a t i n g   U R L s   a n d   s e n d i n g   H T T P   r e q u e s t s 
 
 T O   D O : 
 
 -   ` s p l i t   U R L ` ,   ` j o i n   U R L ` ;   n o t e   t h a t   ` j o i n   U R L `   s h o u l d   a l l o w   ` u s i n g   b a s e   U R L `   t o   b e   o p t i o n a l l y   s p e c i f i e d   ( i n   w h i c h   c a s e   t h e   U R L   b e i n g   j o i n e d   m i g h t   b e   e i t h e r   a   r e c o r d   o r   a   s t r i n g ;   s e e   u r l l i b . p a r s e . u r l j o i n ) ;   N S U R L   p r o v i d e s   f o l l o w i n g   p r o p e r t i e s : 
 
 	 	 s c h e m e 
 	 	 u s e r 
 	 	 p a s s w o r d 
 	 	 h o s t 
 	 	 p o r t 
 	 	 p a t h 
 	 	 p a t h E x t e n s i o n 
 	 	 p a t h C o m p o n e n t s 
 	 	 p a r a m e t e r S t r i n g 
 	 	 q u e r y 
 	 	 f r a g m e n t 
 	 	 
 	 	 ( Q .   w o u l d   i t   m a k e   s e n s e   t o   k e e p   u s e r + p a s s w o r d + h o s t + p o r t   c o m b i n e d ,   a n d   p r o v i d e   s e p a r a t e   c o m m a n d s   f o r   s p l i t t i n g   a n d   j o i n i n g   t h a t ,   o r   e l s e   i n c l u d e   p r o p e r t i e s   f o r   b o t h   r e p r e s e n t a t i o n s   c . f .   ` c o n v e r t   r e c o r d   t o   d a t e ` ,   o r   e l s e   g r o u p   i t   a s   a   s u b - r e c o r d   a n d   p r o v i d e   b o o l e a n   o p t i o n   o n   ` s p l i t   U R L `   i n d i c a t i n g   w h e t h e r   t o   k e e p   i t   t o g e t h e r   a s   t e x t   o r   d e c o m p o s e   i n t o   s u b - r e c o r d ) 
 
 -   ` n o r m a l i z e   U R L ` ?   s e e   N S U R L ' s   s t a n d a r d i z e d U R L ( ) 
 
 -   ` s p l i t   U R L   q u e r y ` ,   ` j o i n   U R L   q u e r y `   - -   { { " f o o " ,   " x y z " } ,   { " b a r " ,   1 2 3 } }   < - >   " f o o = x y z & b a r = 1 2 3 " ;   n o t e   t h a t   t h i s   s h o u l d   w o r k   f o r   b o t h   U R L   q u e r y   s t r i n g s   a n d   ' a p p l i c a t i o n / x - w w w - f o r m - u r l e n c o d e d '   H T T P   b o d y   d a t a ;   e . g .   s e e   P y t h o n ' s   [ h o r r i b l y   n a m e d ] : 
 
 	 u r l l i b . p a r s e . p a r s e _ q s l ( q s ,   k e e p _ b l a n k _ v a l u e s = F a l s e ,   s t r i c t _ p a r s i n g = F a l s e ,   e n c o d i n g = ' u t f - 8 ' ,   e r r o r s = ' r e p l a c e ' ) 
 	 u r l l i b . p a r s e . u r l e n c o d e ( q u e r y ,   d o s e q = F a l s e ,   s a f e = ' ' ,   e n c o d i n g = N o n e ,   e r r o r s = N o n e ) 
 
 
 -   ` e s c a p e   U R L ` ,   ` u n e s c a p e   U R L `   - -   s e e : 
 	 
 	 @ i n t e r f a c e   N S S t r i n g   ( N S U R L U t i l i t i e s ) 
 
 	 / /   R e t u r n s   a   n e w   s t r i n g   m a d e   f r o m   t h e   r e c e i v e r   b y   r e p l a c i n g   a l l   c h a r a c t e r s   n o t   i n   t h e   a l l o w e d C h a r a c t e r s   s e t   w i t h   p e r c e n t   e n c o d e d   c h a r a c t e r s .   U T F - 8   e n c o d i n g   i s   u s e d   t o   d e t e r m i n e   t h e   c o r r e c t   p e r c e n t   e n c o d e d   c h a r a c t e r s .   E n t i r e   U R L   s t r i n g s   c a n n o t   b e   p e r c e n t - e n c o d e d .   T h i s   m e t h o d   i s   i n t e n d e d   t o   p e r c e n t - e n c o d e   a n   U R L   c o m p o n e n t   o r   s u b c o m p o n e n t   s t r i n g ,   N O T   t h e   e n t i r e   U R L   s t r i n g .   A n y   c h a r a c t e r s   i n   a l l o w e d C h a r a c t e r s   o u t s i d e   o f   t h e   7 - b i t   A S C I I   r a n g e   a r e   i g n o r e d . 
 	 -   ( n u l l a b l e   N S S t r i n g ) s t r i n g B y A d d i n g P e r c e n t E n c o d i n g W i t h A l l o w e d C h a r a c t e r s : ( N S C h a r a c t e r S e t ) a l l o w e d C h a r a c t e r s   N S _ A V A I L A B L E ( 1 0 _ 9 ,   7 _ 0 ) ; 
 
 	 / /   R e t u r n s   a   n e w   s t r i n g   m a d e   f r o m   t h e   r e c e i v e r   b y   r e p l a c i n g   a l l   p e r c e n t   e n c o d e d   s e q u e n c e s   w i t h   t h e   m a t c h i n g   U T F - 8   c h a r a c t e r s . 
 	 @ p r o p e r t y   ( n u l l a b l e ,   r e a d o n l y ,   c o p y )   N S S t r i n g   * s t r i n g B y R e m o v i n g P e r c e n t E n c o d i n g   N S _ A V A I L A B L E ( 1 0 _ 9 ,   7 _ 0 ) ; 
 
 	 @ e n d 
 	 
 	 a n d   i n   P y t h o n : 
 
 	   u r l l i b . p a r s e . q u o t e ( s t r i n g ,   s a f e = ' / ' ,   e n c o d i n g = N o n e ,   e r r o r s = N o n e ) 
 	   u r l l i b . p a r s e . q u o t e _ p l u s ( s t r i n g ,   s a f e = ' ' ,   e n c o d i n g = N o n e ,   e r r o r s = N o n e )   - -   n o t e :   ` f o r m   q u o t i n g `   s h o u l d   b e   a   b o o l e a n   o p t i o n   t o   ` e s c a p e   U R L ` ,   i n d i c a t i n g   w h e t h e r   o r   n o t   s p a c e s   s h o u l d   b e   e s c a p e d   a s   ' + '   ( a n d   ' + '   a s   ' % N N ' ,   a n d   u s e   " "   i n s t e a d   o f   " / "   a s   d e f a u l t   ` s a f e `   c h a r s ) 
 	   u r l l i b . p a r s e . u n q u o t e ( s t r i n g ,   e n c o d i n g = ' u t f - 8 ' ,   e r r o r s = ' r e p l a c e ' )   - -   e . g .   u n q u o t e ( ' / E l % 2 0 N i % C 3 % B 1 o / ' )   y i e l d s   ' / E l   N i � o / ' 
 	   u r l l i b . p a r s e . u n q u o t e _ p l u s ( s t r i n g ,   e n c o d i n g = ' u t f - 8 ' ,   e r r o r s = ' r e p l a c e ' )   - -   a g a i n ,   i n c l u d e   ` f o r m   q u o t i n g `   b o o l e a n   o p t i o n 
 
 
 -   m o v e   J S O N   c o m m a n d s   f r o m   F o r m a t L i b   t o   h e r e   ( l o n g e r   t e r m ,   i t ' d   b e   u s e f u l   t o   p r o v i d e   s o m e   s o r t   o f   ' J S O N   s c h e m a '   s u p p o r t ,   w h e r e   a   n e s t a b l e   l i s t / r e c o r d   t e m p l a t e   s t r u c t u r e   c o u l d   b e   u s e d   t o   d e s c r i b e   t h e   e x p e c t e d / r e q u i r e d   s t r u c t u r e   ( i n c l u d i n g   r e q u i r e d   t y p e s   a n d   d e f a u l t   v a l u e s ) ) 
 
 
 -   ` s e n d   H T T P   r e q u e s t `   - -   u r l l i b . r e q u e s t . R e q u e s t ( u r l ,   d a t a = N o n e ,   h e a d e r s = { } ,   o r i g i n _ r e q _ h o s t = N o n e ,   u n v e r i f i a b l e = F a l s e ,   m e t h o d = N o n e )   [ m e t h o d = G E T / P O S T / P U T / e t c ] ;   s e e   N S U R L S e s s i o n ,   N S U R L R e q u e s t ,   N S U R L R e s p o n s e 
 
 	 -   Q .   w h a t   A P I ?   e . g .   s h o u l d   c o m m a n d   s i m p l y   b l o c k   u n t i l   c o m p l e t i o n   o r   t i m e o u t ?   ( a n   a s y n c   A P I   w o u l d   p r o b a b l y   b e   o v e r k i l l ,   n o t   t o   m e n t i o n   d i f f i c u l t ,   f o r   m o s t   A S   u s e r s ;   a n y   u s e r s   t h a t   d o   n e e d   m o r e   a d v a n c e d   f e a t u r e s   c a n   a l w a y s   d r o p   d o w n   i n t o   C o c o a   v i a   A S O C ) 
 
 	 -   Q .   n e e d   t o   g i v e   s o m e   t h o u g h t   t o   e n c o d i n g s   i n   H T T P   b o d y   d a t a :   s i m p l e s t   m i g h t   b e   f o r   b o d y   t o   b e   e i t h e r   ` t e x t `   o r   ` d a t a ` ,   a n d   l e a v e   e n c o d i n g / d e c o d i n g   t o   T e x t L i b   ( w h i c h   c u r r e n t l y   d o e s n ' t   s u p p o r t   t h i s ,   b u t   c o u l d   b e   m a d e   t o ) ;   Q .   w h a t   A E   t y p e   t o   a s s i g n   t o   d a t a   o b j e c t s :   c R a w D a t a   ( ' r d a t ' ) ,   o r   s o m e t h i n g   m o r e   s p e c i f i c ? 
 
 -   w h a t   a b o u t   i n c l u d i n g   a   b a s i c   H T T P   s e r v e r ,   c . f .   P y t h o n ' s   h t t p . s e r v e r   m o d u l e ?   ( w o u l d n ' t   b e   s u i t a b l e   f o r   p u b l i c   w e b ,   b u t   m i g h t   b e   h a n d y   f o r   l o c a l h o s t / i n t r a n e t   u s e ) 
 
   
  
 l     ��������  ��  ��     ��  l     ��������  ��  ��  ��       �� ��     ascr  ��ޭ