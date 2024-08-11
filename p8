import numpy as np


X=np.array(([2,9],[1,5],[3,6]),dtype=float)
y=np.array(([92],[86],[89]),dtype=float)
x=X/np.amax(X,axis=0)
y=y/100


def sigmoid(X):
    return 1/(1+np.exp(-X))
def derivatives_sigmoid(X):
    return X*(1-X)


epoch=5
lr=0.1


inputlayer_neurons=2
hiddenlayer_neurons=3
output_neurons=1


wh=np.random.uniform(size=(inputlayer_neurons,hiddenlayer_neurons))
bh=np.random.uniform(size=(1,hiddenlayer_neurons))
wout=np.random.uniform(size=(hiddenlayer_neurons,output_neurons))
bout=np.random.uniform(size=(1,output_neurons))


for i in range(epoch):
    hinp1=np.dot(X,wh)
    hinp=hinp1+bh
    hlayer_act=sigmoid(hinp)
    outlinep1=np.dot(hlayer_act,wout)
    outinp=outlinep1+bout
    output=sigmoid(outinp)


    EO=y-output
    outgrad=derivatives_sigmoid(output)
    d_output=EO*outgrad
    EH=d_output.dot(wout.T)
    hiddengrad=derivatives_sigmoid(hlayer_act)
    d_hiddenlayer=EH*hiddengrad


    wout+=hlayer_act.T.dot(d_output)*lr
    wh+=x.T.dot(d_hiddenlayer)*lr


    print("\n------epoch",i+1,"starts-----\n")
    print("input:\n"+str(X))
    print("actual output:\n"+str(y))
    print("predicted output:\n",output)
    print("----epoch-",i+1,"ends-----\n")


//////////////Output :-
------epoch 1 starts-----

input:
[[2. 9.]
 [1. 5.]
 [3. 6.]]
actual output:
[[0.92]
 [0.86]
 [0.89]]
predicted output:
 [[0.92420224]
 [0.91025558]
 [0.92643799]]
----epoch- 1 ends-----


------epoch 2 starts-----

input:
[[2. 9.]
 [1. 5.]
 [3. 6.]]
actual output:
[[0.92]
 [0.86]
 [0.89]]
predicted output:
 [[0.92407415]
 [0.910118  ]
 [0.92631242]]
----epoch- 2 ends-----


------epoch 3 starts-----

input:
[[2. 9.]
 [1. 5.]
 [3. 6.]]
actual output:
[[0.92]
 [0.86]
 [0.89]]
predicted output:
 [[0.92394623]
 [0.90998062]
 [0.92618702]]
----epoch- 3 ends-----


------epoch 4 starts-----

input:
[[2. 9.]
 [1. 5.]
 [3. 6.]]
actual output:
[[0.92]
 [0.86]
 [0.89]]
predicted output:
 [[0.92381847]
 [0.90984345]
 [0.92606178]]
----epoch- 4 ends-----


------epoch 5 starts-----

input:
[[2. 9.]
 [1. 5.]
 [3. 6.]]
actual output:
[[0.92]
 [0.86]
 [0.89]]
predicted output:
 [[0.92369089]
 [0.90970649]
 [0.9259367 ]]
----epoch- 5 ends-----
