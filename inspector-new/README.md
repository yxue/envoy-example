Protocol Sniffing
--

1. Setup iptables

```bash
docker exec -i --privileged -t -u root {container id} bash
```

```bash
./istio-iptables.sh -p 15001 -u 1337 -m REDIRECT -i '*'
```

2. Check iptable rules

```bash
iptables -n -v -t nat -L
```

3. Verify

- `curl google.com`

>[2019-07-22 21:43:53.636][14][debug][filter] [source/extensions/filters/listener/original_dst/original_dst.cc:18] original_dst: New connection accepted

[2019-07-22 21:43:53.636][14][debug][filter] [source/extensions/filters/listener/tls_inspector/tls_inspector.cc:72] tls inspector: new connection accepted

[2019-07-22 21:43:53.636][14][trace][filter] [source/extensions/filters/listener/tls_inspector/tls_inspector.cc:141] tls inspector: recv: 74

[2019-07-22 21:43:53.636][14][trace][filter] [source/extensions/filters/listener/tls_inspector/tls_inspector.cc:162] tls inspector: done: true

[2019-07-22 21:43:53.636][14][debug][filter] [source/extensions/filters/listener/http_inspector/http_inspector.cc:32] http inspector: new connection accepted

[2019-07-22 21:43:53.636][14][trace][filter] [source/extensions/filters/listener/http_inspector/http_inspector.cc:63] http inspector: recv: 74

[2019-07-22 21:43:53.636][14][trace][filter] [source/extensions/filters/listener/http_inspector/http_inspector.cc:103] http inspector: method: GET, request uri: /, protocol: HTTP/1.1

[2019-07-22 21:43:53.636][14][trace][filter] [source/extensions/filters/listener/http_inspector/http_inspector.cc:164] http inspector: done: true

- `curl localhost:8000`

infinite loop (known issue)

>[2019-07-22 21:46:11.120][34][debug][filter] [source/extensions/filters/listener/original_dst/original_dst.cc:18] original_dst: New connection accepted

[2019-07-22 21:46:11.120][34][debug][filter] [source/extensions/filters/listener/tls_inspector/tls_inspector.cc:72] tls inspector: new connection accepted

[2019-07-22 21:46:11.121][34][trace][filter] [source/extensions/filters/listener/tls_inspector/tls_inspector.cc:141] tls inspector: recv: 214

[2019-07-22 21:46:11.121][34][trace][filter] [source/extensions/filters/listener/tls_inspector/tls_inspector.cc:162] tls inspector: done: true

[2019-07-22 21:46:11.121][34][debug][filter] [source/extensions/filters/listener/http_inspector/http_inspector.cc:32] http inspector: new connection accepted

[2019-07-22 21:46:11.121][34][trace][filter] [source/extensions/filters/listener/http_inspector/http_inspector.cc:63] http inspector: recv: 214

[2019-07-22 21:46:11.121][34][trace][filter] [source/extensions/filters/listener/http_inspector/http_inspector.cc:103] http inspector: method: GET, request uri: /, protocol: HTTP/1.1

[2019-07-22 21:46:11.121][34][trace][filter] [source/extensions/filters/listener/http_inspector/http_inspector.cc:164] http inspector: done: true
