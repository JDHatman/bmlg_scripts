FasdUAS 1.101.10   ��   ��    k             l     ����  I    �� ��
�� .sysodelanull��� ��� nmbr  m     ���� ��  ��  ��     	 
 	 l     ��������  ��  ��   
     l     ��  ��    ! Ask for the end user's name     �   6 A s k   f o r   t h e   e n d   u s e r ' s   n a m e      l    ����  I   ��  
�� .sysodlogaskr        TEXT  m       �   0 E n t e r   u s e r ' s   F u l l   N a m e :    ��  
�� 
appr  m    	   �   6 W h o   w i l l   b e   u s i n g   t h i s   M a c ?  �� ��
�� 
dtxt  m   
    �    ��  ��  ��        l     ����   r     ! " ! n     # $ # 1    ��
�� 
ttxt $ 1    ��
�� 
rslt " o      ���� 0 	full_name  ��  ��     % & % l     ��������  ��  ��   &  ' ( ' l     �� ) *��   ) 2 ,Ask for the planned location of the computer    * � + + X A s k   f o r   t h e   p l a n n e d   l o c a t i o n   o f   t h e   c o m p u t e r (  , - , l   D .���� . r    D / 0 / n    @ 1 2 1 4   ; @�� 3
�� 
cobj 3 m   > ?����  2 l   ; 4���� 4 I   ;�� 5 6
�� .gtqpchltns    @   @ ns   5 J    % 7 7  8 9 8 m     : : � ; ;  1 2 1 4 9  < = < m     > > � ? ?  1 2 1 6 =  @ A @ m     B B � C C  1 2 1 9 A  D E D m     F F � G G  1 2 2 1 E  H I H m     J J � K K  1 2 2 5 I  L M L m     N N � O O  1 2 2 6 M  P�� P m    ! Q Q � R R  R e m o t e��   6 �� S T
�� 
appr S m   & ) U U � V V F A s s i g n   t h i s   c o m p u t e r   t o   a   l o c a t i o n . T �� W X
�� 
prmp W m   , / Y Y � Z Z 6 E n t e r   t h e   u s e r ' s   l o c a t i o n :   X �� [��
�� 
inSL [ m   2 5 \ \ � ] ]  1 2 2 1��  ��  ��   0 o      ���� 0 	location1  ��  ��   -  ^ _ ^ l     ��������  ��  ��   _  ` a ` l     �� b c��   b Z TLet the user know that they will need to enter the admin password for the next step.    c � d d � L e t   t h e   u s e r   k n o w   t h a t   t h e y   w i l l   n e e d   t o   e n t e r   t h e   a d m i n   p a s s w o r d   f o r   t h e   n e x t   s t e p . a  e f e l  E P g���� g I  E P�� h i
�� .sysodlogaskr        TEXT h m   E H j j � k kd T h e   n e x t   b o x   w i l l   a s k   y o u   t o   e n t e r   t h e   a d m i n   p a s s w o r d   f o r   t h e   B M L G   I T   A d m i n   a c c o u n t .     T h i s   i s   n e e d e d   i n   o r d e r   f o r   t h i s   p r o g r a m   t o   s u c c e e d .     Y o u   s h o u l d   o n l y   n e e d   t o   e n t e r   i t   o n c e . i �� l��
�� 
appr l m   I L m m � n n , A d m i n i s t r a t o r   p a s s w o r d��  ��  ��   f  o p o l     ��������  ��  ��   p  q r q l     �� s t��   s F @Enter the user name and location into the ARD Information fields    t � u u � E n t e r   t h e   u s e r   n a m e   a n d   l o c a t i o n   i n t o   t h e   A R D   I n f o r m a t i o n   f i e l d s r  v w v l  Q b x���� x I  Q b�� y z
�� .sysoexecTEXT���     TEXT y b   Q Z { | { m   Q T } } � ~ ~ � d e f a u l t s   w r i t e   / L i b r a r y / P r e f e r e n c e s / c o m . a p p l e . R e m o t e D e s k t o p   T e x t 1   | n   T Y  �  1   U Y��
�� 
strq � o   T U���� 0 	full_name   z �� ���
�� 
badm � m   ] ^��
�� boovtrue��  ��  ��   w  � � � l     ��������  ��  ��   �  � � � l  c v ����� � I  c v�� � �
�� .sysoexecTEXT���     TEXT � b   c n � � � m   c f � � � � � � d e f a u l t s   w r i t e   / L i b r a r y / P r e f e r e n c e s / c o m . a p p l e . R e m o t e D e s k t o p   T e x t 2   � n   f m � � � 1   i m��
�� 
strq � o   f i���� 0 	location1   � �� ���
�� 
badm � m   q r��
�� boovtrue��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � ( "Get ComputerName and serial number    � � � � D G e t   C o m p u t e r N a m e   a n d   s e r i a l   n u m b e r �  � � � l  w � ����� � r   w � � � � I  w ~�� ���
�� .sysoexecTEXT���     TEXT � m   w z � � � � � l s c u t i l   - - g e t   C o m p u t e r N a m e   |   t r   ' [ : u p p e r : ] '   ' [ : l o w e r : ] '��   � o      ���� 0 computername  ��  ��   �  � � � l  � � ����� � r   � � � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � m   � � � � � � � � i o r e g   - c   I O P l a t f o r m E x p e r t D e v i c e   - d   2   |   a w k   - F \ "   ' / I O P l a t f o r m S e r i a l N u m b e r / { p r i n t   $ ( N F - 1 ) } '��   � o      ���� 0 serialnumber  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   ���This is important.  Set the HostName and LocalHostName values in /etc/hosts to match the ComputerName. After imaging, all three of these values match already. However, the hostname is subject to random change, which completely breaks its relationship with Puppet.  By running these commands, the HostName and LocalHostname are hard coded into the /etc/hosts file.  This way they will not change.    � � � � T h i s   i s   i m p o r t a n t .     S e t   t h e   H o s t N a m e   a n d   L o c a l H o s t N a m e   v a l u e s   i n   / e t c / h o s t s   t o   m a t c h   t h e   C o m p u t e r N a m e .   A f t e r   i m a g i n g ,   a l l   t h r e e   o f   t h e s e   v a l u e s   m a t c h   a l r e a d y .   H o w e v e r ,   t h e   h o s t n a m e   i s   s u b j e c t   t o   r a n d o m   c h a n g e ,   w h i c h   c o m p l e t e l y   b r e a k s   i t s   r e l a t i o n s h i p   w i t h   P u p p e t .     B y   r u n n i n g   t h e s e   c o m m a n d s ,   t h e   H o s t N a m e   a n d   L o c a l H o s t n a m e   a r e   h a r d   c o d e d   i n t o   t h e   / e t c / h o s t s   f i l e .     T h i s   w a y   t h e y   w i l l   n o t   c h a n g e . �  � � � l  � � ����� � I  � ��� � �
�� .sysoexecTEXT���     TEXT � b   � � � � � m   � � � � � � � , s c u t i l   - - s e t   H o s t N a m e   � o   � ����� 0 computername   � �� ���
�� 
badm � m   � ���
�� boovtrue��  ��  ��   �  � � � l  � � ����� � I  � ��� � �
�� .sysoexecTEXT���     TEXT � b   � � � � � m   � � � � � � � 6 s c u t i l   - - s e t   L o c a l H o s t N a m e   � o   � ����� 0 computername   � �� ���
�� 
badm � m   � ���
�� boovtrue��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �  Add printers    � � � �  A d d   p r i n t e r s �  � � � l  � � ����� � r   � � � � � l  � � ����� � I  � ��� � �
�� .gtqpchltns    @   @ ns   � J   � � � �  � � � m   � � � � � � �  B M L G _ 1 2 1 4 _ M a i n �  � � � m   � � � � � � � * B M L G _ 1 2 1 6 _ F i r s t _ F l o o r �  � � � m   � � � � � � � * B M L G _ 1 2 1 9 _ F i r s t _ F l o o r �  � � � m   � � � � � � � , B M L G _ 1 2 1 9 _ S e c o n d _ F l o o r �  � � � m   � � � � � � � 0 B M L G _ 1 2 2 1 _ B a s e m e n t _ C o l o r �  � � � m   � � � � � � � , B M L G _ 1 2 2 1 _ B a s e m e n t _ M F P �  � � � m   � � � � � � � & B M L G _ 1 2 2 1 _ E x e c u t i v e �  � � � m   � � � � � � � 6 B M L G _ 1 2 2 1 _ F i r s t _ F l o o r _ N o r t h �  � � � m   � � � � � � �  B M L G _ 1 2 2 1 _ K e l l y �  � � � m   � � � � � � � 8 B M L G _ 1 2 2 1 _ S e c o n d _ F l o o r _ N o r t h �  ��� � m   � � � � � � � 8 B M L G _ 1 2 2 1 _ S e c o n d _ F l o o r _ S o u t h��   � �� � �
�� 
appr � m   � � � � �   * S e l e c t   y o u r   p r i n t e r s . � ��
�� 
prmp m   � � � � H i g h l i g h t   t h e   p r i n t e r s   y o u   w o u l d   l i k e   t o   h a v e   i n s t a l l e d .     H o l d   t h e   C O M M A N D   k e y   t o   s e l e c t   m u l t i p l e . ����
�� 
mlsl m   � ���
�� boovtrue��  ��  ��   � o      ���� 0 printer_list  ��  ��   �  l     ��������  ��  ��   	 l  � �
����
 r   � � J   � �����   o      ���� 0 selected_printers  ��  ��  	  l     ��������  ��  ��    l  �-��~ Z   �-�}�| E   � � o   � ��{�{ 0 printer_list   m   � � �  B M L G _ 1 2 1 4 _ M a i n Q   �) k    I �z�y
�z .sysoexecTEXT���     TEXT m   �  � l p a d m i n   - p   B M L G _ 1 2 1 4 _ M a i n   - L   " B M L G   1 2 1 4   M a i n "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 0 2   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   M P \   5 0 0 0   - o   p r i n t e r - i s - s h a r e d = f a l s e   - o   O p t i o n T r a y = 1 C a s s e t t e   - o   F i n i s h e r = F i n K I N G�y   !�x! r  	"#" m  	$$ �%%  B M L G _ 1 2 1 4 _ M a i n# n      &'&  ;  ' o  �w�w 0 selected_printers  �x   R      �v�u�t
�v .ascrerr ****      � ****�u  �t   k  )(( )*) I  �s+�r
�s .sysoexecTEXT���     TEXT+ m  ,, �--� l p a d m i n   - p   B M L G _ 1 2 1 4 _ M a i n   - L   " B M L G   1 2 1 4   M a i n "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 0 2   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   M P \   5 0 0 0 . g z   - o   p r i n t e r - i s - s h a r e d = f a l s e   - o   O p t i o n T r a y = 1 C a s s e t t e   - o   F i n i s h e r = F i n K I N G�r  * .�q. r  !)/0/ m  !$11 �22  B M L G _ 1 2 1 4 _ M a i n0 n      343  ;  '(4 o  $'�p�p 0 selected_printers  �q  �}  �|  �  �~   565 l     �o�n�m�o  �n  �m  6 787 l .g9�l�k9 Z  .g:;�j�i: E  .5<=< o  .1�h�h 0 printer_list  = m  14>> �?? * B M L G _ 1 2 1 6 _ F i r s t _ F l o o r; Q  8c@AB@ k  ;KCC DED I ;B�gF�f
�g .sysoexecTEXT���     TEXTF m  ;>GG �HHl l p a d m i n   - p   B M L G _ 1 2 1 6 _ F i r s t _ F l o o r   - L   " B M L G   1 2 1 6   F i r s t   F l o o r "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 2 4 6   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   5 2 1 0 S R   - o   p r i n t e r - i s - s h a r e d = f a l s e�f  E I�eI r  CKJKJ m  CFLL �MM * B M L G _ 1 2 1 6 _ F i r s t _ F l o o rK n      NON  ;  IJO o  FI�d�d 0 selected_printers  �e  A R      �c�b�a
�c .ascrerr ****      � ****�b  �a  B k  ScPP QRQ I SZ�`S�_
�` .sysoexecTEXT���     TEXTS m  SVTT �UUr l p a d m i n   - p   B M L G _ 1 2 1 6 _ F i r s t _ F l o o r   - L   " B M L G   1 2 1 6   F i r s t   F l o o r "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 2 4 6   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   5 2 1 0 S R . g z   - o   p r i n t e r - i s - s h a r e d = f a l s e�_  R V�^V r  [cWXW m  [^YY �ZZ * B M L G _ 1 2 1 6 _ F i r s t _ F l o o rX n      [\[  ;  ab\ o  ^a�]�] 0 selected_printers  �^  �j  �i  �l  �k  8 ]^] l     �\�[�Z�\  �[  �Z  ^ _`_ l h�a�Y�Xa Z  h�bc�W�Vb E  hoded o  hk�U�U 0 printer_list  e m  knff �gg * B M L G _ 1 2 1 9 _ F i r s t _ F l o o rc Q  r�hijh k  u�kk lml I u|�Tn�S
�T .sysoexecTEXT���     TEXTn m  uxoo �pp� l p a d m i n   - p   B M L G _ 1 2 1 9 _ F i r s t _ F l o o r   - L   " B M L G   1 2 1 9   F i r s t   F l o o r "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 7 6   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   M P \   C 3 0 5   - o   p r i n t e r - i s - s h a r e d = f a l s e   - o   D u p l e x = N o n e�S  m q�Rq r  }�rsr m  }�tt �uu * B M L G _ 1 2 1 9 _ F i r s t _ F l o o rs n      vwv  ;  ��w o  ���Q�Q 0 selected_printers  �R  i R      �P�O�N
�P .ascrerr ****      � ****�O  �N  j k  ��xx yzy I ���M{�L
�M .sysoexecTEXT���     TEXT{ m  ��|| �}}� l p a d m i n   - p   B M L G _ 1 2 1 9 _ F i r s t _ F l o o r   - L   " B M L G   1 2 1 9   F i r s t   F l o o r "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 7 6   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   M P \   C 3 0 5 . g z   - o   p r i n t e r - i s - s h a r e d = f a l s e   - o   D u p l e x = N o n e�L  z ~�K~ r  ��� m  ���� ��� * B M L G _ 1 2 1 9 _ F i r s t _ F l o o r� n      ���  ;  ��� o  ���J�J 0 selected_printers  �K  �W  �V  �Y  �X  ` ��� l     �I�H�G�I  �H  �G  � ��� l ����F�E� Z  �����D�C� E  ����� o  ���B�B 0 printer_list  � m  ���� ��� , B M L G _ 1 2 1 9 _ S e c o n d _ F l o o r� Q  ������ k  ���� ��� I ���A��@
�A .sysoexecTEXT���     TEXT� m  ���� ���p l p a d m i n   - p   B M L G _ 1 2 1 9 _ S e c o n d _ F l o o r   - L   " B M L G   1 2 1 9   S e c o n d   F l o o r "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 2 4 7   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   5 2 1 0 S R   - o   p r i n t e r - i s - s h a r e d = f a l s e�@  � ��?� r  ����� m  ���� ��� , B M L G _ 1 2 1 9 _ S e c o n d _ F l o o r� n      ���  ;  ��� o  ���>�> 0 selected_printers  �?  � R      �=�<�;
�= .ascrerr ****      � ****�<  �;  � k  ���� ��� I ���:��9
�: .sysoexecTEXT���     TEXT� m  ���� ���v l p a d m i n   - p   B M L G _ 1 2 1 9 _ S e c o n d _ F l o o r   - L   " B M L G   1 2 1 9   S e c o n d   F l o o r "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 2 4 7   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   5 2 1 0 S R . g z   - o   p r i n t e r - i s - s h a r e d = f a l s e�9  � ��8� r  ����� m  ���� ��� , B M L G _ 1 2 1 9 _ S e c o n d _ F l o o r� n      ���  ;  ��� o  ���7�7 0 selected_printers  �8  �D  �C  �F  �E  � ��� l     �6�5�4�6  �5  �4  � ��� l ���3�2� Z  ����1�0� E  ����� o  ���/�/ 0 printer_list  � m  ���� ��� 0 B M L G _ 1 2 2 1 _ B a s e m e n t _ C o l o r� Q  ����� k  ���� ��� I ���.��-
�. .sysoexecTEXT���     TEXT� m  ���� ���x l p a d m i n   - p   B M L G _ 1 2 2 1 _ B a s e m e n t _ C o l o r   - L   " B M L G   1 2 2 1   B a s e m e n t   C o l o r "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 2 1   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   C 4 0 0 D N   - o   p r i n t e r - i s - s h a r e d = f a l s e�-  � ��,� r  ����� m  ���� ��� 0 B M L G _ 1 2 2 1 _ B a s e m e n t _ C o l o r� n      ���  ;  ��� o  ���+�+ 0 selected_printers  �,  � R      �*�)�(
�* .ascrerr ****      � ****�)  �(  � k  �� ��� I �'��&
�' .sysoexecTEXT���     TEXT� m  �� ���~ l p a d m i n   - p   B M L G _ 1 2 2 1 _ B a s e m e n t _ C o l o r   - L   " B M L G   1 2 2 1   B a s e m e n t   C o l o r "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 2 1   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   C 4 0 0 D N . g z   - o   p r i n t e r - i s - s h a r e d = f a l s e�&  � ��%� r  	��� m  	�� ��� 0 B M L G _ 1 2 2 1 _ B a s e m e n t _ C o l o r� n      ���  ;  � o  �$�$ 0 selected_printers  �%  �1  �0  �3  �2  � ��� l     �#�"�!�#  �"  �!  � ��� l O�� �� Z  O����� E  ��� o  �� 0 printer_list  � m  �� ��� , B M L G _ 1 2 2 1 _ B a s e m e n t _ M F P� Q   K���� k  #3�� ��� I #*���
� .sysoexecTEXT���     TEXT� m  #&�� ���p l p a d m i n   - p   B M L G _ 1 2 2 1 _ B a s e m e n t _ M F P   - L   " B M L G   1 2 2 1   B a s e m e n t   M F P "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 3 1   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   5 2 1 0 S F   - o   p r i n t e r - i s - s h a r e d = f a l s e�  � ��� r  +3��� m  +.�� ��� , B M L G _ 1 2 2 1 _ B a s e m e n t _ M F P� n      ���  ;  12� o  .1�� 0 selected_printers  �  � R      ���
� .ascrerr ****      � ****�  �  � k  ;K�� ��� I ;B���
� .sysoexecTEXT���     TEXT� m  ;>�� ���v l p a d m i n   - p   B M L G _ 1 2 2 1 _ B a s e m e n t _ M F P   - L   " B M L G   1 2 2 1   B a s e m e n t   M F P "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 3 1   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   5 2 1 0 S F . g z   - o   p r i n t e r - i s - s h a r e d = f a l s e�  � ��� r  CK��� m  CF�� ��� , B M L G _ 1 2 2 1 _ B a s e m e n t _ M F P� n      ���  ;  IJ� o  FI�� 0 selected_printers  �  �  �  �   �  � ��� l     ����  �  �  � � � l P��� Z  P���
 E  PW o  PS�	�	 0 printer_list   m  SV � & B M L G _ 1 2 2 1 _ E x e c u t i v e Q  Z�	
 k  ]m  I ]d��
� .sysoexecTEXT���     TEXT m  ]` �` l p a d m i n   - p   B M L G _ 1 2 2 1 _ E x e c u t i v e   - L   " B M L G   1 2 2 1   E x e c u t i v e "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 2 9   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   M P \   C 3 0 5   - o   p r i n t e r - i s - s h a r e d = f a l s e�   � r  em m  eh � & B M L G _ 1 2 2 1 _ E x e c u t i v e n        ;  kl o  hk�� 0 selected_printers  �  	 R      ���
� .ascrerr ****      � ****�  �  
 k  u�  I u|�� 
� .sysoexecTEXT���     TEXT m  ux �f l p a d m i n   - p   B M L G _ 1 2 2 1 _ E x e c u t i v e   - L   " B M L G   1 2 2 1   E x e c u t i v e "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 2 9   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   M P \   C 3 0 5 . g z   - o   p r i n t e r - i s - s h a r e d = f a l s e�    �� r  }�  m  }�!! �"" & B M L G _ 1 2 2 1 _ E x e c u t i v e  n      #$#  ;  ��$ o  ������ 0 selected_printers  ��  �  �
  �  �    %&% l     ��������  ��  ��  & '(' l ��)����) Z  ��*+����* E  ��,-, o  ������ 0 printer_list  - m  ��.. �// 6 B M L G _ 1 2 2 1 _ F i r s t _ F l o o r _ N o r t h+ Q  ��0120 k  ��33 454 I ����6��
�� .sysoexecTEXT���     TEXT6 m  ��77 �88� l p a d m i n   - p   B M L G _ 1 2 2 1 _ F i r s t _ F l o o r _ N o r t h   - L   " B M L G   1 2 2 1   F i r s t   F l o o r   N o r t h "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 4 5   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   M P \   4 0 0 1   - o   p r i n t e r - i s - s h a r e d = f a l s e��  5 9��9 r  ��:;: m  ��<< �== 6 B M L G _ 1 2 2 1 _ F i r s t _ F l o o r _ N o r t h; n      >?>  ;  ��? o  ������ 0 selected_printers  ��  1 R      ������
�� .ascrerr ****      � ****��  ��  2 k  ��@@ ABA I ����C��
�� .sysoexecTEXT���     TEXTC m  ��DD �EE� l p a d m i n   - p   B M L G _ 1 2 2 1 _ F i r s t _ F l o o r _ N o r t h   - L   " B M L G   1 2 2 1   F i r s t   F l o o r   N o r t h "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 4 5   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   M P \   4 0 0 1 . g z   - o   p r i n t e r - i s - s h a r e d = f a l s e��  B F��F r  ��GHG m  ��II �JJ 6 B M L G _ 1 2 2 1 _ F i r s t _ F l o o r _ N o r t hH n      KLK  ;  ��L o  ������ 0 selected_printers  ��  ��  ��  ��  ��  ( MNM l     ��������  ��  ��  N OPO l ��Q����Q Z  ��RS����R E  ��TUT o  ������ 0 printer_list  U m  ��VV �WW  B M L G _ 1 2 2 1 _ K e l l yS k  ��XX YZY I ����[��
�� .sysoexecTEXT���     TEXT[ m  ��\\ �]]� l p a d m i n   - p   B M L G _ 1 2 2 1 _ K e l l y   - L   " B M L G   1 2 2 1   b u i l d i n g   K e l l y ' s   o f f i c e "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 1 9   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   C 2 4 2 D N . p p d   - o   p r i n t e r - i s - s h a r e d = f a l s e��  Z ^��^ r  ��_`_ m  ��aa �bb  B M L G _ 1 2 2 1 _ K e l l y` n      cdc  ;  ��d o  ������ 0 selected_printers  ��  ��  ��  ��  ��  P efe l     ��������  ��  ��  f ghg l �i����i Z  �jk����j E  ��lml o  ������ 0 printer_list  m m  ��nn �oo 8 B M L G _ 1 2 2 1 _ S e c o n d _ F l o o r _ N o r t hk Q  �pqrp k  � ss tut I ����v��
�� .sysoexecTEXT���     TEXTv m  ��ww �xx� l p a d m i n   - p   B M L G _ 1 2 2 1 _ S e c o n d _ F l o o r _ N o r t h   - L   " B M L G   1 2 2 1   S e c o n d   F l o o r   N o r t h "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 3 6   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   5 2 1 0 S F   - o   p r i n t e r - i s - s h a r e d = f a l s e��  u y��y r  � z{z m  ��|| �}} 8 B M L G _ 1 2 2 1 _ S e c o n d _ F l o o r _ N o r t h{ n      ~~  ;  �� o  ������ 0 selected_printers  ��  q R      ������
�� .ascrerr ****      � ****��  ��  r k  �� ��� I �����
�� .sysoexecTEXT���     TEXT� m  �� ���� l p a d m i n   - p   B M L G _ 1 2 2 1 _ S e c o n d _ F l o o r _ N o r t h   - L   " B M L G   1 2 2 1   S e c o n d   F l o o r   N o r t h "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 3 6   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   5 2 1 0 S F . g z   - o   p r i n t e r - i s - s h a r e d = f a l s e��  � ���� r  ��� m  �� ��� 8 B M L G _ 1 2 2 1 _ S e c o n d _ F l o o r _ N o r t h� n      ���  ;  � o  ���� 0 selected_printers  ��  ��  ��  ��  ��  h ��� l     ��������  ��  ��  � ��� l V������ Z  V������� E  $��� o   ���� 0 printer_list  � m   #�� ��� 8 B M L G _ 1 2 2 1 _ S e c o n d _ F l o o r _ S o u t h� Q  'R���� k  *:�� ��� I *1�����
�� .sysoexecTEXT���     TEXT� m  *-�� ���� l p a d m i n   - p   B M L G _ 1 2 2 1 _ S e c o n d _ F l o o r _ S o u t h   - L   " B M L G   1 2 2 1   S e c o n d   F l o o r   S o u t h "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 3 5   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   5 2 1 0 S F   - o   p r i n t e r - i s - s h a r e d = f a l s e��  � ���� r  2:��� m  25�� ��� 8 B M L G _ 1 2 2 1 _ S e c o n d _ F l o o r _ S o u t h� n      ���  ;  89� o  58���� 0 selected_printers  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � k  BR�� ��� I BI�����
�� .sysoexecTEXT���     TEXT� m  BE�� ���� l p a d m i n   - p   B M L G _ 1 2 2 1 _ S e c o n d _ F l o o r _ S o u t h   - L   " B M L G   1 2 2 1   S e c o n d   F l o o r   S o u t h "   - E   - v   l p d : / / 1 0 . 2 0 0 . 3 . 1 3 5   - P   / L i b r a r y / P r i n t e r s / P P D s / C o n t e n t s / R e s o u r c e s / R I C O H \   A f i c i o \   S P \   5 2 1 0 S F . g z   - o   p r i n t e r - i s - s h a r e d = f a l s e��  � ���� r  JR��� m  JM�� ��� 8 B M L G _ 1 2 2 1 _ S e c o n d _ F l o o r _ S o u t h� n      ���  ;  PQ� o  MP���� 0 selected_printers  ��  ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l Wj������ r  Wj��� I Wf�����
�� .sysoexecTEXT���     TEXT� b  Wb��� b  W^��� m  WZ�� ��� 
 e c h o  � o  Z]���� 0 selected_printers  � m  ^a�� ��� 6   |   s e d   - e   $ ' s / B M L G / \ \ \ n & / g '��  � o      ���� 0 selected_printers_email  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  Prompt to bind to AD   � ��� ( P r o m p t   t o   b i n d   t o   A D� ��� l     ������  � * $if language_choice is "English" then   � ��� H i f   l a n g u a g e _ c h o i c e   i s   " E n g l i s h "   t h e n� ��� l     ������  � � �	set choice1 to display dialog "Would you like to bind to Active Directory?" with title "Active Directory" buttons {"Yes", "No"} default button "Yes"   � ���* 	 s e t   c h o i c e 1   t o   d i s p l a y   d i a l o g   " W o u l d   y o u   l i k e   t o   b i n d   t o   A c t i v e   D i r e c t o r y ? "   w i t h   t i t l e   " A c t i v e   D i r e c t o r y "   b u t t o n s   { " Y e s " ,   " N o " }   d e f a u l t   b u t t o n   " Y e s "� ��� l     ������  � / )else if language_choice is "Espa�ol" then   � ��� R e l s e   i f   l a n g u a g e _ c h o i c e   i s   " E s p a � o l "   t h e n� ��� l     ������  � � �	set choice1 to display dialog "�Le gustar�a unirse a Active Directory?" with title "Active Directory" buttons {"Yes", "No"} default button "Yes"   � ���" 	 s e t   c h o i c e 1   t o   d i s p l a y   d i a l o g   " � L e   g u s t a r � a   u n i r s e   a   A c t i v e   D i r e c t o r y ? "   w i t h   t i t l e   " A c t i v e   D i r e c t o r y "   b u t t o n s   { " Y e s " ,   " N o " }   d e f a u l t   b u t t o n   " Y e s "� ��� l     ������  �  end if   � ���  e n d   i f� ��� l     ��������  ��  ��  � ��� l     ������  � 8 2Bind to AD using binding package already on system   � ��� d B i n d   t o   A D   u s i n g   b i n d i n g   p a c k a g e   a l r e a d y   o n   s y s t e m� ��� l     ������  � 1 +if button returned of choice1 is "Yes" then   � ��� V i f   b u t t o n   r e t u r n e d   o f   c h o i c e 1   i s   " Y e s "   t h e n� ��� l     ������  � � �	display dialog "Binding to Active Directory will take a moment...  You will be prompted when it is finished." with title "Active Directory" buttons {"I Understand"} default button "I Understand"   � ���� 	 d i s p l a y   d i a l o g   " B i n d i n g   t o   A c t i v e   D i r e c t o r y   w i l l   t a k e   a   m o m e n t . . .     Y o u   w i l l   b e   p r o m p t e d   w h e n   i t   i s   f i n i s h e d . "   w i t h   t i t l e   " A c t i v e   D i r e c t o r y "   b u t t o n s   { " I   U n d e r s t a n d " }   d e f a u l t   b u t t o n   " I   U n d e r s t a n d "� ��� l     ������  � i c	do shell script "installer -pkg /Users/Shared/ad_bind.pkg -target /" with administrator privileges   � ��� � 	 d o   s h e l l   s c r i p t   " i n s t a l l e r   - p k g   / U s e r s / S h a r e d / a d _ b i n d . p k g   - t a r g e t   / "   w i t h   a d m i n i s t r a t o r   p r i v i l e g e s� ��� l     ������  � I C	display dialog "Binding is finished" with title "Active Directory"   � ��� � 	 d i s p l a y   d i a l o g   " B i n d i n g   i s   f i n i s h e d "   w i t h   t i t l e   " A c t i v e   D i r e c t o r y "�    l     ����    end if    �  e n d   i f  l     ��������  ��  ��    l     ��	
��  	 s mAsk for the name of the tech that imaged the machine.  This way I'll know who to email when I've approved it.   
 � � A s k   f o r   t h e   n a m e   o f   t h e   t e c h   t h a t   i m a g e d   t h e   m a c h i n e .     T h i s   w a y   I ' l l   k n o w   w h o   t o   e m a i l   w h e n   I ' v e   a p p r o v e d   i t .  l kz���� I kz��
�� .sysodlogaskr        TEXT m  kn � t E n t e r   t h e   f u l l   n a m e   o f   t h e   I T   p e r s o n   w h o   i m a g e d   t h i s   M a c :   ��
�� 
appr m  or � ( A   F e w   M o r e   T h i n g s . . . ����
�� 
dtxt m  sv �  ��  ��  ��    l {����� r  {� n  {~  1  |~��
�� 
ttxt  1  {|��
�� 
rslt o      ���� 0 	tech_name  ��  ��   !"! l     ��������  ��  ��  " #$# l     ��%&��  % A ;Ask for a reason for imaging.  Just because I like to know.   & �'' v A s k   f o r   a   r e a s o n   f o r   i m a g i n g .     J u s t   b e c a u s e   I   l i k e   t o   k n o w .$ ()( l ��*����* r  ��+,+ n  ��-.- 4  ����/
�� 
cobj/ m  ������ . l ��0����0 I ����12
�� .gtqpchltns    @   @ ns  1 J  ��33 454 m  ��66 �77  N e w   H i r e5 898 m  ��:: �;; . E n d   o f   L i f e   R e p l a c e m e n t9 <=< m  ��>> �??  T r o u b l e s h o o t i n g= @A@ m  ��BB �CC  T e s t i n gA D��D m  ��EE �FF  O t h e r . . .��  2 ��GH
�� 
apprG m  ��II �JJ ( A   F e w   M o r e   T h i n g s . . .H ��KL
�� 
prmpK m  ��MM �NN 2 W h y   w a s   t h i s   M a c   i m a g e d ?  L ��O�
�� 
inSLO m  ��PP �QQ  T r o u b l e s h o o t i n g�  ��  ��  , o      �~�~ 
0 reason  ��  ��  ) RSR l ��T�}�|T Z  ��UV�{�zU = ��WXW o  ���y�y 
0 reason  X m  ��YY �ZZ  O t h e r . . .V k  ��[[ \]\ I ���x^_
�x .sysodlogaskr        TEXT^ m  ��`` �aa : P l e a s e   e n t e r   a   c u s t o m   r e a s o n :_ �wbc
�w 
apprb m  ��dd �ee  O t h e r   r e a s o nc �vf�u
�v 
dtxtf m  ��gg �hh  �u  ] i�ti r  ��jkj n  ��lml 1  ���s
�s 
ttxtm 1  ���r
�r 
rsltk o      �q�q 
0 reason  �t  �{  �z  �}  �|  S non l     �p�o�n�p  �o  �n  o pqp l     �mrs�m  r � �set mac_condition to item 1 of (choose from list {"Brand New", "Existing"} with title "A Few More Things..." with prompt "Is this a brand new Mac or an existing one? " default items "Brand New")   s �tt� s e t   m a c _ c o n d i t i o n   t o   i t e m   1   o f   ( c h o o s e   f r o m   l i s t   { " B r a n d   N e w " ,   " E x i s t i n g " }   w i t h   t i t l e   " A   F e w   M o r e   T h i n g s . . . "   w i t h   p r o m p t   " I s   t h i s   a   b r a n d   n e w   M a c   o r   a n   e x i s t i n g   o n e ?   "   d e f a u l t   i t e m s   " B r a n d   N e w " )q uvu l     �l�k�j�l  �k  �j  v wxw l     �iyz�i  y I Cif mac_condition is "Existing" or mac_condition is "Existente" then   z �{{ � i f   m a c _ c o n d i t i o n   i s   " E x i s t i n g "   o r   m a c _ c o n d i t i o n   i s   " E x i s t e n t e "   t h e nx |}| l     �h~�h  ~ � �	set name_change to item 1 of (choose from list {"Same", "Different"} with title "A Few More Things..." with prompt "Is the computer name you entered earlier the same or different from what this Mac was previously named? " default items "Same")    ���� 	 s e t   n a m e _ c h a n g e   t o   i t e m   1   o f   ( c h o o s e   f r o m   l i s t   { " S a m e " ,   " D i f f e r e n t " }   w i t h   t i t l e   " A   F e w   M o r e   T h i n g s . . . "   w i t h   p r o m p t   " I s   t h e   c o m p u t e r   n a m e   y o u   e n t e r e d   e a r l i e r   t h e   s a m e   o r   d i f f e r e n t   f r o m   w h a t   t h i s   M a c   w a s   p r e v i o u s l y   n a m e d ?   "   d e f a u l t   i t e m s   " S a m e " )} ��� l     �g���g  �  	else   � ��� 
 	 e l s e� ��� l     �f���f  �  		set name_change to ""   � ��� . 	 	 s e t   n a m e _ c h a n g e   t o   " "� ��� l     �e���e  �  	end if   � ���  	 e n d   i f� ��� l     �d���d  �  	   � ���  	� ��� l     �c���c  � ) #	if name_change is "Different" then   � ��� F 	 i f   n a m e _ c h a n g e   i s   " D i f f e r e n t "   t h e n� ��� l     �b���b  � l f		display dialog "What was the old computer name?" with title "A Few More Things..." default answer ""   � ��� � 	 	 d i s p l a y   d i a l o g   " W h a t   w a s   t h e   o l d   c o m p u t e r   n a m e ? "   w i t h   t i t l e   " A   F e w   M o r e   T h i n g s . . . "   d e f a u l t   a n s w e r   " "� ��� l     �a���a  � / )		set old_name to text returned of result   � ��� R 	 	 s e t   o l d _ n a m e   t o   t e x t   r e t u r n e d   o f   r e s u l t� ��� l     �`���`  �  	else   � ��� 
 	 e l s e� ��� l     �_���_  �  		set old_name to ""   � ��� ( 	 	 s e t   o l d _ n a m e   t o   " "� ��� l     �^���^  �  	end if   � ���  	 e n d   i f� ��� l     �]���]  � 
 else   � ���  e l s e� ��� l     �\���\  �  	set name_change to "n/a"   � ��� 2 	 s e t   n a m e _ c h a n g e   t o   " n / a "� ��� l     �[���[  �  	set old_name to "n/a"   � ��� , 	 s e t   o l d _ n a m e   t o   " n / a "� ��� l     �Z���Z  �  end if   � ���  e n d   i f� ��� l     �Y�X�W�Y  �X  �W  � ��� l     �V���V  � 2 ,Reminder to not grant admin rights to users.   � ��� X R e m i n d e r   t o   n o t   g r a n t   a d m i n   r i g h t s   t o   u s e r s .� ��� l     �U���U  ���	display dialog "Every user should log in with their domain account. Do not create local accounts. Do not grant users admin rights. If they need to install anything that is not already available in Managed Software Center, have them contact the CAC at extension 4000. If you have any questions, please contact Jason Hatman (jason.hatman@fotlinc.com)." with title "Reminder" buttons {"I understand"} default button "I understand"   � ���X 	 d i s p l a y   d i a l o g   " E v e r y   u s e r   s h o u l d   l o g   i n   w i t h   t h e i r   d o m a i n   a c c o u n t .   D o   n o t   c r e a t e   l o c a l   a c c o u n t s .   D o   n o t   g r a n t   u s e r s   a d m i n   r i g h t s .   I f   t h e y   n e e d   t o   i n s t a l l   a n y t h i n g   t h a t   i s   n o t   a l r e a d y   a v a i l a b l e   i n   M a n a g e d   S o f t w a r e   C e n t e r ,   h a v e   t h e m   c o n t a c t   t h e   C A C   a t   e x t e n s i o n   4 0 0 0 .   I f   y o u   h a v e   a n y   q u e s t i o n s ,   p l e a s e   c o n t a c t   J a s o n   H a t m a n   ( j a s o n . h a t m a n @ f o t l i n c . c o m ) . "   w i t h   t i t l e   " R e m i n d e r "   b u t t o n s   { " I   u n d e r s t a n d " }   d e f a u l t   b u t t o n   " I   u n d e r s t a n d "� ��� l     �T�S�R�T  �S  �R  � ��� l     �Q���Q  �  Get current IP address   � ��� , G e t   c u r r e n t   I P   a d d r e s s� ��� l �g��P�O� Q  �g���� r  ����� I ���N��M
�N .sysoexecTEXT���     TEXT� m  ���� ��� , i p c o n f i g   g e t i f a d d r   e n 0�M  � o      �L�L 0 	ipaddress  � R      �K�J�I
�K .ascrerr ****      � ****�J  �I  � Q  �g���� r  � ��� I ���H��G
�H .sysoexecTEXT���     TEXT� m  ���� ��� , i p c o n f i g   g e t i f a d d r   e n 1�G  � o      �F�F 0 	ipaddress  � R      �E�D�C
�E .ascrerr ****      � ****�D  �C  � Q  g���� r  ��� I �B��A
�B .sysoexecTEXT���     TEXT� m  �� ��� , i p c o n f i g   g e t i f a d d r   e n 2�A  � o      �@�@ 0 	ipaddress  � R      �?�>�=
�? .ascrerr ****      � ****�>  �=  � Q  g���� r  !,��� I !(�<��;
�< .sysoexecTEXT���     TEXT� m  !$�� ��� , i p c o n f i g   g e t i f a d d r   e n 3�;  � o      �:�: 0 	ipaddress  � R      �9�8�7
�9 .ascrerr ****      � ****�8  �7  � Q  4g���� r  7B   I 7>�6�5
�6 .sysoexecTEXT���     TEXT m  7: � , i p c o n f i g   g e t i f a d d r   e n 4�5   o      �4�4 0 	ipaddress  � R      �3�2�1
�3 .ascrerr ****      � ****�2  �1  � Q  Jg r  MX	 I MT�0
�/
�0 .sysoexecTEXT���     TEXT
 m  MP � , i p c o n f i g   g e t i f a d d r   e n 5�/  	 o      �.�. 0 	ipaddress   R      �-�,�+
�- .ascrerr ****      � ****�,  �+   r  `g m  `c � J T h e   I P   a d d r e s s   c o u l d   n o t   b e   o b t a i n e d . o      �*�* 0 	ipaddress  �P  �O  �  l     �)�(�'�)  �(  �'    l     �&�&   T NObtain the container that the computer was put into during the AD Bind process    � � O b t a i n   t h e   c o n t a i n e r   t h a t   t h e   c o m p u t e r   w a s   p u t   i n t o   d u r i n g   t h e   A D   B i n d   p r o c e s s  l     �%�%  .(set computerou to do shell script "dscl \"/Active Directory/HQ_FRUIT/orchard.fruit.com\" -read /Computers/" & computername & "$ | grep -A 2 dsAttrTypeNative:distinguishedName | grep CN | awk '{print substr($0,index($0,\"CN\"))}' | tr ',' '\\n' | grep OU | cut -c 4- | tail -r | paste -sd \">\" -"    �P s e t   c o m p u t e r o u   t o   d o   s h e l l   s c r i p t   " d s c l   \ " / A c t i v e   D i r e c t o r y / H Q _ F R U I T / o r c h a r d . f r u i t . c o m \ "   - r e a d   / C o m p u t e r s / "   &   c o m p u t e r n a m e   &   " $   |   g r e p   - A   2   d s A t t r T y p e N a t i v e : d i s t i n g u i s h e d N a m e   |   g r e p   C N   |   a w k   ' { p r i n t   s u b s t r ( $ 0 , i n d e x ( $ 0 , \ " C N \ " ) ) } '   |   t r   ' , '   ' \ \ n '   |   g r e p   O U   |   c u t   - c   4 -   |   t a i l   - r   |   p a s t e   - s d   \ " > \ "   - "  l     �$�#�"�$  �#  �"     l     �!!"�!  ! � �Send an email to Brock, Cody, and Jason notifying them of the newly imaged machine.  Or just Jason if it's for testing.  Saves on spam.   " �## S e n d   a n   e m a i l   t o   B r o c k ,   C o d y ,   a n d   J a s o n   n o t i f y i n g   t h e m   o f   t h e   n e w l y   i m a g e d   m a c h i n e .     O r   j u s t   J a s o n   i f   i t ' s   f o r   t e s t i n g .     S a v e s   o n   s p a m .  $%$ l h�&� �& I h��'�
� .sysoexecTEXT���     TEXT' b  h�()( b  h�*+* b  h�,-, b  h�./. b  h�010 b  h�232 b  h�454 b  h�676 b  h�898 b  h}:;: b  hy<=< b  hu>?> b  hs@A@ b  hoBCB m  hkDD �EE T e c h o   " A   c o m p u t e r   h a s   b e e n   n e w l y   i m a g e d   b y  C o  kn�� 0 	tech_name  A m  orFF �GG L .   \ n T h e   U s e r   o f   t h i s   c o m p u t e r   w i l l   b e  ? o  st�� 0 	full_name  = m  uxHH �II 0 .   \ n T h e   C o m p u t e r N a m e   i s  ; o  y|�� 0 computername  9 m  }�JJ �KK 0   \ n T h e   s e r i a l   n u m b e r   i s  7 o  ���� 0 serialnumber  5 m  ��LL �MM : . \ n T h e   c u r r e n t   I P   a d d r e s s   i s  3 o  ���� 0 	ipaddress  1 m  ��NN �OO h . \ n T h e   t e c h   s a i d   i t   w a s   i m a g e d   o r   r e i m a g e d   b e c a u s e :  / o  ���� 
0 reason  - m  ��PP �QQ � .   \ n \ n H e r e   a r e   t h e   p r i n t e r s   ( i f   a n y )   t h a t   w e r e   s e l e c t e d   t o   b e   i n s t a l l e d   o n   t h i s   m a c h i n e : \ n+ o  ���� 0 selected_printers_email  ) m  ��RR �SS \ "   |   m a i l   - s   " N e w   I m a g e "     j a s o n . h a t m a n @ b m l g . n e t�  �   �  % TUT l     ����  �  �  U VWV l     �XY�  X 8 2Remove the Launch Agent that launched this script.   Y �ZZ d R e m o v e   t h e   L a u n c h   A g e n t   t h a t   l a u n c h e d   t h i s   s c r i p t .W [\[ l ��]��] I ���^_
� .sysoexecTEXT���     TEXT^ m  ��`` �aa h r m   / L i b r a r y / L a u n c h A g e n t s / c o m . b m l g . s h a r i n g _ i n f o . p l i s t_ �b�
� 
badmb m  ���
� boovtrue�  �  �  \ cdc l     ��
�	�  �
  �	  d efe l     �gh�  g  Remove this script.   h �ii & R e m o v e   t h i s   s c r i p t .f jkj l ��l��l I ���mn
� .sysoexecTEXT���     TEXTm m  ��oo �pp ^ r m   - r f d   / u s r / l o c a l / b m l g _ a s s e t s / s h a r i n g _ i n f o . a p pn �q�
� 
badmq m  ���
� boovtrue�  �  �  k rsr l     �� ���  �   ��  s tut l     ��vw��  v 6 0Remove the receipts associated with this script.   w �xx ` R e m o v e   t h e   r e c e i p t s   a s s o c i a t e d   w i t h   t h i s   s c r i p t .u yzy l ��{����{ I ����|}
�� .sysoexecTEXT���     TEXT| m  ��~~ � L p k g u t i l   - - f o r g e t   c o m . b m l g . s h a r i n g _ i n f o} �����
�� 
badm� m  ����
�� boovtrue��  ��  ��  z ��� l     ��������  ��  ��  � ��� l     ������  �  Remove munki   � ���  R e m o v e   m u n k i� ��� l �q������ Q  �q����� k  �h�� ��� I ������
�� .sysoexecTEXT���     TEXT� m  ���� ��� | l a u n c h c t l   u n l o a d   / L i b r a r y / L a u n c h D a e m o n s / c o m . g o o g l e c o d e . m u n k i . *� �����
�� 
badm� m  ����
�� boovtrue��  � ��� I ������
�� .sysoexecTEXT���     TEXT� m  ���� ��� x r m   - r f   " / A p p l i c a t i o n s / U t i l i t i e s / M a n a g e d   S o f t w a r e   U p d a t e . a p p "� �����
�� 
badm� m  ����
�� boovtrue��  � ��� I ������
�� .sysoexecTEXT���     TEXT� m  ���� ��� d r m   - r f   " / A p p l i c a t i o n s / M a n a g e d   S o f t w a r e   C e n t e r . a p p "� �����
�� 
badm� m  ����
�� boovtrue��  � ��� I ������
�� .sysoexecTEXT���     TEXT� m  ���� ��� f r m   - f   / L i b r a r y / L a u n c h D a e m o n s / c o m . g o o g l e c o d e . m u n k i . *� �����
�� 
badm� m  ����
�� boovtrue��  � ��� I �����
�� .sysoexecTEXT���     TEXT� m  � �� ��� d r m   - f   / L i b r a r y / L a u n c h A g e n t s / c o m . g o o g l e c o d e . m u n k i . *� �����
�� 
badm� m  ��
�� boovtrue��  � ��� I 	����
�� .sysoexecTEXT���     TEXT� m  	�� ��� D r m   - r f   " / L i b r a r y / M a n a g e d   I n s t a l l s "� �����
�� 
badm� m  ��
�� boovtrue��  � ��� I  ����
�� .sysoexecTEXT���     TEXT� m  �� ��� ` r m   - f   / L i b r a r y / P r e f e r e n c e s / M a n a g e d I n s t a l l s . p l i s t� �����
�� 
badm� m  ��
�� boovtrue��  � ��� I !,����
�� .sysoexecTEXT���     TEXT� m  !$�� ��� . r m   - r f   / u s r / l o c a l / m u n k i� �����
�� 
badm� m  '(��
�� boovtrue��  � ��� I -8����
�� .sysoexecTEXT���     TEXT� m  -0�� ��� * r m   / e t c / p a t h s . d / m u n k i� �����
�� 
badm� m  34��
�� boovtrue��  � ��� I 9D����
�� .sysoexecTEXT���     TEXT� m  9<�� ��� V p k g u t i l   - - f o r g e t   c o m . g o o g l e c o d e . m u n k i . a d m i n� �����
�� 
badm� m  ?@��
�� boovtrue��  � ��� I EP����
�� .sysoexecTEXT���     TEXT� m  EH�� ��� R p k g u t i l   - - f o r g e t   c o m . g o o g l e c o d e . m u n k i . a p p� �����
�� 
badm� m  KL��
�� boovtrue��  � ��� I Q\����
�� .sysoexecTEXT���     TEXT� m  QT�� ��� T p k g u t i l   - - f o r g e t   c o m . g o o g l e c o d e . m u n k i . c o r e� �����
�� 
badm� m  WX��
�� boovtrue��  � ���� I ]h����
�� .sysoexecTEXT���     TEXT� m  ]`�� ��� Z p k g u t i l   - - f o r g e t   c o m . g o o g l e c o d e . m u n k i . l a u n c h d� �����
�� 
badm� m  cd��
�� boovtrue��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � ; 5Remove the munki_settings and repo_settings profiles.   � ��� j R e m o v e   t h e   m u n k i _ s e t t i n g s   a n d   r e p o _ s e t t i n g s   p r o f i l e s .� ��� l r������� Q  r������ k  u��� ��� I u�����
�� .sysoexecTEXT���     TEXT� m  ux�� ��� : p r o f i l e s   - R   - p   m u n k i _ s e t t i n g s� �����
�� 
badm� m  {|��
�� boovtrue��  � ��� I ������
�� .sysoexecTEXT���     TEXT� m  ��   � J p r o f i l e s   - R   - p   m u n k i _ s e t t i n g s _ n o a p p l e� ����
�� 
badm m  ����
�� boovtrue��  �  I ����
�� .sysoexecTEXT���     TEXT m  �� � 8 p r o f i l e s   - R   - p   r e p o _ s e t t i n g s ��	��
�� 
badm	 m  ����
�� boovtrue��   

 I ����
�� .sysoexecTEXT���     TEXT m  �� � r p k g u t i l   - - f o r g e t   c o m . g i t h u b . m a k e p r o f i l e p k g . m u n k i _ s e t t i n g s ����
�� 
badm m  ����
�� boovtrue��    I ����
�� .sysoexecTEXT���     TEXT m  �� � p p k g u t i l   - - f o r g e t   c o m . g i t h u b . m a k e p r o f i l e p k g . r e p o _ s e t t i n g s ����
�� 
badm m  ����
�� boovtrue��   �� I ����
�� .sysoexecTEXT���     TEXT m  �� � ` p k g u t i l   - - f o r g e t   c o m . j a s o n h a t m a n . m u n k i _ k i c k s t a r t ����
�� 
badm m  ����
�� boovtrue��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��  �  l     ��������  ��  ��    !  l     ��"#��  " z tLet the user know that Imaging is finished and that Client Technologies will assist with the assignment of policies.   # �$$ � L e t   t h e   u s e r   k n o w   t h a t   I m a g i n g   i s   f i n i s h e d   a n d   t h a t   C l i e n t   T e c h n o l o g i e s   w i l l   a s s i s t   w i t h   t h e   a s s i g n m e n t   o f   p o l i c i e s .! %&% l ��'����' I ����()
�� .sysodlogaskr        TEXT( m  ��** �++L I m a g i n g   i s   n o w   f i n i s h e d .   T h e   I T   S u p p o r t   E n g i n e e r   h a s   b e e n   s e n t   a n   e m a i l   w i t h   a l l   o f   t h i s   i n f o r m a t i o n .   H e   w i l l   a s s i s t   i n   a p p l y i n g   p o l i c i e s   t o   t h i s   c o m p u t e r .   T h a n k   y o u .) ��,��
�� 
appr, m  ��-- �..   I m a g i n g   c o m p l e t e��  ��  ��  & /��/ l     ��������  ��  ��  ��       ��01��  0 ��
�� .aevtoappnull  �   � ****1 ��2����34��
�� .aevtoappnull  �   � ****2 k    �55  66  77  88  ,99  e::  v;;  �<<  �==  �>>  �??  �@@  �AA BB CC 7DD _EE �FF �GG �HH �II 'JJ OKK gLL �MM �NN OO PP (QQ RRR �SS $TT [UU jVV yWW �XX �YY %����  ��  ��  3  4 ��� �� � �~�}�|�{�z : > B F J N Q�y U�x Y�w \�v�u�t�s j m }�r�q�p � ��o ��n � � � � � � � � � � � � ��m ��l�k�j$�i�h,1>GLTYfot|����������������!.7<DIV\anw|����������g�f6:>BE�eIMP�dY`dg��c���DFHJLNPR`o~�������������� *-
�� .sysodelanull��� ��� nmbr
�� 
appr
� 
dtxt�~ 
�} .sysodlogaskr        TEXT
�| 
rslt
�{ 
ttxt�z 0 	full_name  �y 
�x 
prmp
�w 
inSL�v 
�u .gtqpchltns    @   @ ns  
�t 
cobj�s 0 	location1  
�r 
strq
�q 
badm
�p .sysoexecTEXT���     TEXT�o 0 computername  �n 0 serialnumber  �m 
�l 
mlsl�k 0 printer_list  �j 0 selected_printers  �i  �h  �g 0 selected_printers_email  �f 0 	tech_name  �e �d 
0 reason  �c 0 	ipaddress  ���mj  O������ O��,E�O�����a a a v�a a a a a a  a k/E` Oa �a l Oa �a ,%a  el !Oa "_ a ,%a  el !Oa #j !E` $Oa %j !E` &Oa '_ $%a  el !Oa (_ $%a  el !Oa )a *a +a ,a -a .a /a 0a 1a 2a 3a 4v�a 5a a 6a 7ea  E` 8OjvE` 9O_ 8a : 0 a ;j !Oa <_ 96FW X = >a ?j !Oa @_ 96FY hO_ 8a A 0 a Bj !Oa C_ 96FW X = >a Dj !Oa E_ 96FY hO_ 8a F 0 a Gj !Oa H_ 96FW X = >a Ij !Oa J_ 96FY hO_ 8a K 0 a Lj !Oa M_ 96FW X = >a Nj !Oa O_ 96FY hO_ 8a P 0 a Qj !Oa R_ 96FW X = >a Sj !Oa T_ 96FY hO_ 8a U 0 a Vj !Oa W_ 96FW X = >a Xj !Oa Y_ 96FY hO_ 8a Z 0 a [j !Oa \_ 96FW X = >a ]j !Oa ^_ 96FY hO_ 8a _ 0 a `j !Oa a_ 96FW X = >a bj !Oa c_ 96FY hO_ 8a d a ej !Oa f_ 96FY hO_ 8a g 0 a hj !Oa i_ 96FW X = >a jj !Oa k_ 96FY hO_ 8a l 0 a mj !Oa n_ 96FW X = >a oj !Oa p_ 96FY hOa q_ 9%a r%j !E` sOa t�a u�a v� O��,E` wOa xa ya za {a |a }v�a ~a a a a �a  a k/E` �O_ �a �  a ��a ��a �� O��,E` �Y hO a �j !E` �W |X = > a �j !E` �W fX = > a �j !E` �W PX = > a �j !E` �W :X = > a �j !E` �W $X = > a �j !E` �W X = >a �E` �Oa �_ w%a �%�%a �%_ $%a �%_ &%a �%_ �%a �%_ �%a �%_ s%a �%j !Oa �a  el !Oa �a  el !Oa �a  el !O �a �a  el !Oa �a  el !Oa �a  el !Oa �a  el !Oa �a  el !Oa �a  el !Oa �a  el !Oa �a  el !Oa �a  el !Oa �a  el !Oa �a  el !Oa �a  el !Oa �a  el !W X = >hO La �a  el !Oa �a  el !Oa �a  el !Oa �a  el !Oa �a  el !Oa �a  el !W X = >hOa ��a �l  ascr  ��ޭ