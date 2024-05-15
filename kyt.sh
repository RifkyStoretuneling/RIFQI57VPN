#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�
��  ��� }���o������    P��z�.��l�J$�Қh�F����f�@4 4 �H�AB&S�P�� #M�4~� �L��2#�G�=F��  hh h 0M�FFM h20�h4i��4 I �4di���O�4� d�m&&�4��3�c��oe�vV�^F������%+OΘ윭DFuL���^�TU_L�*�������qk�"���$>4x�t
�Y���4g_�!c�<0BF��+�\�Z�=�K<�M~�c%pX�nQɇٷ�^8���ŽlU����2H� ��2t末h���~:-j�4U
�
��%�M��tϫ�U$�z���M��Y�8���e��0���]��^kG1��
O�:%|�VN/'+�b`:"G��-�p��GM�LSX
�*>�Aؗf�i��'OE �vY-{\TNʵ$b6����V�.m�����#�g��6{��!�1>O�;HSy���~�F��[�<��CZ�N��%%}]Al-4�F=+m���0z�R	,���x�x�����������T<�=�-0���/1
oG�1�H��F'�P���kj�9y͐Z+��, �)>�+����F����v�f�c��4i�!kߊ�*��PG��"cL�'Kjr�,����X���e��c�c�Ì�:����j��őepd������l���{0��.��f��ۯ���_��_&T$������(��iK�:�oVbԾ'YkC�F�t�M�_�5cMQ��&��U�E��9��]	� ��Μ:)�-YB4bYgH���7zѽ���]�l^���ȍC#S��a�Ȧ�f6.�d0��<����1�<��f%EFJu��x�R{�Z���֥7T�M8�)��<h�"y�6�$�$<n1�i��̚FNfB�۴�TJVČ�7��GI!��ڬ0͚9�d� S^d���#�[�5T�e��tL����.�Y��Rm�CQ�
���uR��I/��K�!%Z�rE8P��
��