dict="/usr/share/dict/british-english-insane"
word1=$(shuf $dict 2>/dev/null | grep 'es$' 2>/dev/null| tr '[A-Z]' '[a-z]' 2>/dev/null | head -n 1 2>/dev/null)
word2=$(shuf $dict 2>/dev/null | grep 'ies$' 2>/dev/null| tr '[A-Z]' '[a-z]' 2>/dev/null | head -n 1 2>/dev/null)
echo "That really $word1 my $word2."
