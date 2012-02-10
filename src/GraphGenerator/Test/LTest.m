axiom = 'a'

rules = [];
rules(1).before = 'a';
rules(1).after = 'ab';

rules(2).before = 'b';
rules(2).after = 'cc';

l1 = LSystemRewrite1(axiom, rules);
AssertEquals('ab' == l1)

l2 = LSystemRewrite1(l1, rules);
AssertEquals('abcc' == l2)

l_2 = LSystemRewriteN(axiom, rules, 2);
AssertEquals('abcc' == l_2)


rules(3).before = 'ab';
rules(3).after = 'cab';
l_3 = LSystemRewriteN(axiom, rules, 2);
AssertEquals('cab' == l_3);


l_4 = LSystemRewriteN(axiom, rules, 3);
AssertEquals('ccab' == l_4);

