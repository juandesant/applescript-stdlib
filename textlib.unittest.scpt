FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        x     �� 	����   	 4   6 <�� 

�� 
scpt 
 m   8 ;   �    T e s t L i b��        l     ��������  ��  ��        l          x    �� ����    4     �� 
�� 
scpt  m       �    T e x t L i b��    � � the script being tested (note: when testing non-library scripts, Standard Additions' `load script` should be used instead; eventually TestLib should provide convenience APIs to do this automatically)     �  �   t h e   s c r i p t   b e i n g   t e s t e d   ( n o t e :   w h e n   t e s t i n g   n o n - l i b r a r y   s c r i p t s ,   S t a n d a r d   A d d i t i o n s '   ` l o a d   s c r i p t `   s h o u l d   b e   u s e d   i n s t e a d ;   e v e n t u a l l y   T e s t L i b   s h o u l d   p r o v i d e   c o n v e n i e n c e   A P I s   t o   d o   t h i s   a u t o m a t i c a l l y )      l     ��������  ��  ��        l     ��������  ��  ��        h    �� �� $0 suite_modifytext suite_ModifyText  k            ! " ! l      �� # $��   # > 8	to setUp()	end setUp		to tearDown()	end tearDown	    $ � % % p  	 t o   s e t U p ( )  	 e n d   s e t U p  	  	 t o   t e a r D o w n ( )  	 e n d   t e a r D o w n  	 "  & ' & i     ( ) ( I      �������� 0 test_uppercase  ��  ��   ) k      * *  + , + I     -�� . - z�� 	
�� .���:AsRenull��� ��� null��   . �� / 0
�� 
Valu / l  	  1���� 1 I  	  2 3�� 2 z�� 
�� .Txt:UppTnull���     ctxt 3 m     4 4 � 5 5  f o � b � r��  ��  ��   0 �� 6��
�� 
Equa 6 m     7 7 � 8 8  F O � B � R��   ,  9 : 9 I   ; ;�� < ; z�� 	
�� .���:AsRenull��� ��� null��   < �� = >
�� 
Valu = l  ' 4 ?���� ? I  ' 4 @ A�� @ z�� 
�� .Txt:UppTnull���     ctxt A m   . / B B @      ��  ��  ��   > �� C��
�� 
Equa C m   5 6 D D � E E  3 . 5��   :  F�� F X   <  G�� H G I  Z z I�� J I z�� 	
�� .���:AsErnull��� ��� null��   J �� K L
�� 
Args K n  g l M N M 1   h l��
�� 
pcnt N o   g h���� 0 aref aRef L �� O��
�� 
Equa O K   m u P P �� Q���� 0 errornumber errorNumber Q m   p s�����Y��  ��  �� 0 aref aRef H J   ? J R R  S T S K   ? C U U �� V���� 0 a   V m   @ A W W � X X  f o o��   T  Y�� Y J   C H Z Z  [�� [ 1   C F��
�� 
ascr��  ��  ��   '  \ ] \ l     ��������  ��  ��   ]  ^ _ ^ i    ` a ` I      �������� 0 test_lowercase  ��  ��   a k     [ b b  c d c I     e�� f e z�� 	
�� .���:AsRenull��� ��� null��   f �� g h
�� 
Valu g l  	  i���� i I  	  j k�� j z�� 
�� .Txt:LowTnull���     ctxt k m     l l � m m  F O � B � R��  ��  ��   h �� n��
�� 
Equa n m     o o � p p  f o � b � r��   d  q�� q X    [ r�� s r I  6 V t�� u t z�� 	
�� .���:AsErnull��� ��� null��   u �� v w
�� 
Args v n  C H x y x 1   D H��
�� 
pcnt y o   C D���� 0 aref aRef w �� z��
�� 
Equa z K   I Q { { �� |���� 0 errornumber errorNumber | m   L O�����Y��  ��  �� 0 aref aRef s J   ! * } }  ~  ~ K   ! % � � �� ����� 0 a   � m   " # � � � � �  f o o��     ��� � J   % ( � �  ��� � 1   % &��
�� 
ascr��  ��  ��   _  � � � l     ��������  ��  ��   �  � � � i    � � � I      �������� 0 test_capitalize  ��  ��   � k     [ � �  � � � I     ��� � � z�� 	
�� .���:AsRenull��� ��� null��   � �� � �
�� 
Valu � l  	  ����� � I  	  � ��� � z�� 
�� .Txt:CapTnull���     ctxt � m     � � � � �  F O � B � R��  ��  ��   � �� ���
�� 
Equa � m     � � � � �  F o � b � r��   �  ��� � X    [ ��� � � I  6 V ��� � � z�� 	
�� .���:AsErnull��� ��� null��   � �� � �
�� 
Args � n  C H � � � 1   D H��
�� 
pcnt � o   C D���� 0 aref aRef � �� ���
�� 
Equa � K   I Q � � �� ����� 0 errornumber errorNumber � m   L O�����Y��  ��  �� 0 aref aRef � J   ! * � �  � � � K   ! % � � �� ����� 0 a   � m   " # � � � � �  f o o��   �  ��� � J   % ( � �  ��� � 1   % &��
�� 
ascr��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� 0 call_uppercase   �  �� � o      �~�~ 	0 param  �  ��   � l     � � � � I     � ��} � z�| 
�| .Txt:UppTnull���     ctxt � o    �{�{ 	0 param  �}   � X R important: call_NAME handlers contain ONLY the command being tested; nothing else    � � � � �   i m p o r t a n t :   c a l l _ N A M E   h a n d l e r s   c o n t a i n   O N L Y   t h e   c o m m a n d   b e i n g   t e s t e d ;   n o t h i n g   e l s e �  � � � l     �z�y�x�z  �y  �x   �  � � � i    � � � I      �w ��v�w 0 call_lowercase   �  ��u � o      �t�t 	0 param  �u  �v   � I     � ��s � z�r 
�r .Txt:LowTnull���     ctxt � o    �q�q 	0 param  �s   �  � � � l     �p�o�n�p  �o  �n   �  � � � i    � � � I      �m ��l�m 0 call_capitalize   �  ��k � o      �j�j 	0 param  �k  �l   � I     � ��i � z�h 
�h .Txt:CapTnull���     ctxt � o    �g�g 	0 param  �i   �  ��f � l     �e�d�c�e  �d  �c  �f     � � � l     �b�a�`�b  �a  �`   �  ��_ � l     �^�]�\�^  �]  �\  �_       �[ � � ��[   � �Z�Y
�Z 
pimr�Y $0 suite_modifytext suite_ModifyText � �X ��X  �   � � � �W ��V
�W 
cobj �  � �   �U 
�U 
scpt�V   � �T ��S
�T 
cobj �  � �   �R 
�R 
scpt�S   � �Q    ��Q $0 suite_modifytext suite_ModifyText � �P � � � � � � ��P   � �O�N�M�L�K�J�O 0 test_uppercase  �N 0 test_lowercase  �M 0 test_capitalize  �L 0 call_uppercase  �K 0 call_lowercase  �J 0 call_capitalize   � �I )�H�G � ��F�I 0 test_uppercase  �H  �G   � �E�E 0 aref aRef � �D �C  4�B�A 7�@�?   B D�> W�=�<�;�: �9�8�7�6�5
�D 
scpt
�C 
Valu
�B .Txt:UppTnull���     ctxt
�A 
Equa�@ 
�? .���:AsRenull��� ��� null�> 0 a  
�= 
ascr
�< 
kocl
�; 
cobj
�: .corecnte****       ****
�9 
Args
�8 
pcnt�7 0 errornumber errorNumber�6�Y
�5 .���:AsErnull��� ��� null�F �)��/ *�)��/ �j U��� 	UO)��/ *�)��/ �j U��� 	UO B��l_ kvlv[a a l kh  )�a / *a �a ,�a a l� U[OY�� � �4 a�3�2 � ��1�4 0 test_lowercase  �3  �2   � �0�0 0 aref aRef � �/ �.  l�-�, o�+�*�) ��(�'�&�% �$�#�"�!� 
�/ 
scpt
�. 
Valu
�- .Txt:LowTnull���     ctxt
�, 
Equa�+ 
�* .���:AsRenull��� ��� null�) 0 a  
�( 
ascr
�' 
kocl
�& 
cobj
�% .corecnte****       ****
�$ 
Args
�# 
pcnt�" 0 errornumber errorNumber�!�Y
�  .���:AsErnull��� ��� null�1 \)��/ *�)��/ �j U��� 	UO <��l�kvlv[��l kh  )�a / *a �a ,�a a l� U[OY�� � � ��� � ��� 0 test_capitalize  �  �   � �� 0 aref aRef � � �  ��� ���� ����� �����
� 
scpt
� 
Valu
� .Txt:CapTnull���     ctxt
� 
Equa� 
� .���:AsRenull��� ��� null� 0 a  
� 
ascr
� 
kocl
� 
cobj
� .corecnte****       ****
� 
Args
� 
pcnt� 0 errornumber errorNumber��Y
� .���:AsErnull��� ��� null� \)��/ *�)��/ �j U��� 	UO <��l�kvlv[��l kh  )�a / *a �a ,�a a l� U[OY�� � �
 ��	� � ���
 0 call_uppercase  �	 � ��  �  �� 	0 param  �   � �� 	0 param   � � �
� 
scpt
� .Txt:UppTnull���     ctxt� )��/ �j U � � �� �� � ���� 0 call_lowercase  �  �� ���  �  ���� 	0 param  ��   � ���� 	0 param   � �� ��
�� 
scpt
�� .Txt:LowTnull���     ctxt�� )��/ �j U � �� ����� � ����� 0 call_capitalize  �� �� ���  �  ���� 	0 param  ��   � ���� 	0 param   � �� ��
�� 
scpt
�� .Txt:CapTnull���     ctxt�� )��/ �j Uascr  ��ޭ