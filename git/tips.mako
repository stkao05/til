# Rebase a branch that has already merge in the reference branch

Suppose a branch `feature` has already merge some change from the master, which
makes it impossible to rebase normally


- create and checkout branch tmp at branch_a
- reset --soft to branch_b
- commit
