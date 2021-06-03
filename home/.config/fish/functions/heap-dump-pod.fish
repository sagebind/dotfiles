function heap-dump-pod -a pod
    kubectl exec $pod -- sh -c 'jmap -dump:file=/tmp/heap.hprof $(pidof java)'
    and kubectl cp $pod:/tmp/heap.hprof $pod.hprof
end
