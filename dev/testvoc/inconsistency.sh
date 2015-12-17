TMPDIR=/tmp

if [[ $1 = "glg-cat" ]]; then

lt-expand $2 | grep -v REGEX | grep -v '<prn><enc>' | sed 's/:>:/%/g' | grep -v ':<:' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |\
        apertium-pretransfer|\
        lt-proc -b ../../glg-cat.autobil.bin |\
        apertium-transfer -b ../../apertium-cat-glg.glg-cat.t1x  ../../glg-cat.t1x.bin | tee $TMPDIR/tmp_testvoc2.txt |\
        lt-proc -d ../../glg-cat.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g' | grep -v '\^@'

elif [[ $1 = "cat-glg" ]]; then

lt-expand $2 | grep -v REGEX | grep -v '<prn><enc>' | sed 's/:>:/%/g' | grep -v ':<:' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |\
        apertium-pretransfer|\
        lt-proc -b ../../cat-glg.autobil.bin |\
        apertium-transfer -b ../../apertium-cat-glg.cat-glg.t1x  ../../cat-glg.t1x.bin | tee $TMPDIR/tmp_testvoc2.txt |\
        lt-proc -d ../../cat-glg.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g' | grep -v '\^@'

else
	echo "sh inconsistency.sh <direction>";
fi
