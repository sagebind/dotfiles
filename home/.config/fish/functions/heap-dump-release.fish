function heap-dump-release -a release
    for pod in (kubectl get pod -l release=$release -o name | cut -d/ -f2)
        kubectl exec $pod -- sh -c 'jmap -dump:file=/tmp/heap.hprof $(pidof java)'
        and kubectl cp $pod:/tmp/heap.hprof $pod.hprof
    end
end
