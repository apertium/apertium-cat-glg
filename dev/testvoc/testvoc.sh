echo "==Catalan->Galician==========================";
bash inconsistency.sh cat-glg ../../../../languages/apertium-cat/apertium-cat.cat.dix > /tmp/cat-glg.testvoc; sh inconsistency-summary.sh /tmp/cat-glg.testvoc cat-glg 
echo ""
echo "==Galician->Catalan===========================";
bash inconsistency.sh glg-cat ../../../../languages/apertium-glg/apertium-glg.glg.dix > /tmp/glg-cat.testvoc; bash inconsistency-summary.sh /tmp/glg-cat.testvoc glg-cat
