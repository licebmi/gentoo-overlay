# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="A reverse proxy that provides authentication with Google, Azure and more"
HOMEPAGE="https://github.com/oauth2-proxy/oauth2-proxy"
SRC_URI="https://github.com/oauth2-proxy/oauth2-proxy/archive/refs/tags/v7.1.3.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"

SLOT="0"

DEPEND="
	dev-go/golangci-lint-bin
"

RDEPEND="
	acct-group/oauth2-proxy
	acct-user/oauth2-proxy
"

EGO_SUM=(
	"cloud.google.com/go v0.26.0/go.mod"
	"cloud.google.com/go v0.34.0/go.mod"
	"cloud.google.com/go v0.38.0"
	"cloud.google.com/go v0.38.0/go.mod"
	"github.com/Bose/minisentinel v0.0.0-20200130220412-917c5a9223bb"
	"github.com/Bose/minisentinel v0.0.0-20200130220412-917c5a9223bb/go.mod"
	"github.com/BurntSushi/toml v0.3.1"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/FZambia/sentinel v1.0.0"
	"github.com/FZambia/sentinel v1.0.0/go.mod"
	"github.com/Knetic/govaluate v3.0.1-0.20171022003610-9aa49832a739+incompatible/go.mod"
	"github.com/NYTimes/gziphandler v0.0.0-20170623195520-56545f4a5d46/go.mod"
	"github.com/OneOfOne/xxhash v1.2.2/go.mod"
	"github.com/PuerkitoBio/purell v1.0.0/go.mod"
	"github.com/PuerkitoBio/urlesc v0.0.0-20160726150825-5bd2802263f2/go.mod"
	"github.com/Shopify/sarama v1.19.0/go.mod"
	"github.com/Shopify/toxiproxy v2.1.4+incompatible/go.mod"
	"github.com/VividCortex/gohistogram v1.0.0/go.mod"
	"github.com/afex/hystrix-go v0.0.0-20180502004556-fa1af6a1f4f5/go.mod"
	"github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc/go.mod"
	"github.com/alecthomas/template v0.0.0-20190718012654-fb15b899a751/go.mod"
	"github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf/go.mod"
	"github.com/alecthomas/units v0.0.0-20190717042225-c3de453c63f4/go.mod"
	"github.com/alecthomas/units v0.0.0-20190924025748-f65c72e2690d/go.mod"
	"github.com/alicebob/gopher-json v0.0.0-20180125190556-5a6b3ba71ee6/go.mod"
	"github.com/alicebob/gopher-json v0.0.0-20200520072559-a9ecdc9d1d3a"
	"github.com/alicebob/gopher-json v0.0.0-20200520072559-a9ecdc9d1d3a/go.mod"
	"github.com/alicebob/miniredis/v2 v2.11.1/go.mod"
	"github.com/alicebob/miniredis/v2 v2.13.0"
	"github.com/alicebob/miniredis/v2 v2.13.0/go.mod"
	"github.com/apache/thrift v0.12.0/go.mod"
	"github.com/apache/thrift v0.13.0/go.mod"
	"github.com/armon/circbuf v0.0.0-20150827004946-bbbad097214e/go.mod"
	"github.com/armon/consul-api v0.0.0-20180202201655-eb2c6b5be1b6/go.mod"
	"github.com/armon/go-metrics v0.0.0-20180917152333-f0300d1749da/go.mod"
	"github.com/armon/go-radix v0.0.0-20180808171621-7fddfc383310/go.mod"
	"github.com/aryann/difflib v0.0.0-20170710044230-e206f873d14a/go.mod"
	"github.com/aws/aws-lambda-go v1.13.3/go.mod"
	"github.com/aws/aws-sdk-go v1.27.0/go.mod"
	"github.com/aws/aws-sdk-go-v2 v0.18.0/go.mod"
	"github.com/benbjohnson/clock v1.1.1-0.20210213131748-c97fc7b6bee0"
	"github.com/benbjohnson/clock v1.1.1-0.20210213131748-c97fc7b6bee0/go.mod"
	"github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973/go.mod"
	"github.com/beorn7/perks v1.0.0/go.mod"
	"github.com/beorn7/perks v1.0.1"
	"github.com/beorn7/perks v1.0.1/go.mod"
	"github.com/bgentry/speakeasy v0.1.0/go.mod"
	"github.com/bitly/go-simplejson v0.5.0"
	"github.com/bitly/go-simplejson v0.5.0/go.mod"
	"github.com/bmizerany/assert v0.0.0-20160611221934-b7ed37b82869"
	"github.com/bmizerany/assert v0.0.0-20160611221934-b7ed37b82869/go.mod"
	"github.com/casbin/casbin/v2 v2.1.2/go.mod"
	"github.com/cenkalti/backoff v2.2.1+incompatible/go.mod"
	"github.com/census-instrumentation/opencensus-proto v0.2.1/go.mod"
	"github.com/cespare/xxhash v1.1.0"
	"github.com/cespare/xxhash v1.1.0/go.mod"
	"github.com/cespare/xxhash/v2 v2.1.1"
	"github.com/cespare/xxhash/v2 v2.1.1/go.mod"
	"github.com/chzyer/logex v1.1.10/go.mod"
	"github.com/chzyer/readline v0.0.0-20180603132655-2972be24d48e/go.mod"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1/go.mod"
	"github.com/clbanning/x2j v0.0.0-20191024224557-825249438eec/go.mod"
	"github.com/client9/misspell v0.3.4/go.mod"
	"github.com/cockroachdb/datadriven v0.0.0-20190809214429-80d97fb3cbaa/go.mod"
	"github.com/codahale/hdrhistogram v0.0.0-20161010025455-3a0bb77429bd/go.mod"
	"github.com/coreos/bbolt v1.3.2/go.mod"
	"github.com/coreos/etcd v3.3.13+incompatible/go.mod"
	"github.com/coreos/go-oidc v2.2.1+incompatible"
	"github.com/coreos/go-oidc v2.2.1+incompatible/go.mod"
	"github.com/coreos/go-semver v0.2.0/go.mod"
	"github.com/coreos/go-systemd v0.0.0-20180511133405-39ca1b05acc7/go.mod"
	"github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e/go.mod"
	"github.com/coreos/pkg v0.0.0-20160727233714-3ac0863d7acf/go.mod"
	"github.com/coreos/pkg v0.0.0-20180928190104-399ea9e2e55f/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d/go.mod"
	"github.com/creack/pty v1.1.7/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dgrijalva/jwt-go v3.2.0+incompatible"
	"github.com/dgrijalva/jwt-go v3.2.0+incompatible/go.mod"
	"github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f"
	"github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f/go.mod"
	"github.com/dgryski/go-sip13 v0.0.0-20181026042036-e10d5fee7954/go.mod"
	"github.com/docker/spdystream v0.0.0-20160310174837-449fdfce4d96/go.mod"
	"github.com/docopt/docopt-go v0.0.0-20180111231733-ee0de3bc6815/go.mod"
	"github.com/dustin/go-humanize v0.0.0-20171111073723-bb3d318650d4/go.mod"
	"github.com/eapache/go-resiliency v1.1.0/go.mod"
	"github.com/eapache/go-xerial-snappy v0.0.0-20180814174437-776d5712da21/go.mod"
	"github.com/eapache/queue v1.1.0/go.mod"
	"github.com/edsrzf/mmap-go v1.0.0/go.mod"
	"github.com/elazarl/goproxy v0.0.0-20180725130230-947c36da3153/go.mod"
	"github.com/emicklei/go-restful v0.0.0-20170410110728-ff4f55a20633/go.mod"
	"github.com/envoyproxy/go-control-plane v0.6.9/go.mod"
	"github.com/envoyproxy/go-control-plane v0.9.1-0.20191026205805-5f8ba28d4473/go.mod"
	"github.com/envoyproxy/protoc-gen-validate v0.1.0/go.mod"
	"github.com/evanphx/json-patch v4.9.0+incompatible/go.mod"
	"github.com/fatih/color v1.7.0/go.mod"
	"github.com/franela/goblin v0.0.0-20200105215937-c9ffbefa60db/go.mod"
	"github.com/franela/goreq v0.0.0-20171204163338-bcd34c9993f8/go.mod"
	"github.com/frankban/quicktest v1.10.0"
	"github.com/frankban/quicktest v1.10.0/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/fsnotify/fsnotify v1.4.9"
	"github.com/fsnotify/fsnotify v1.4.9/go.mod"
	"github.com/ghodss/yaml v0.0.0-20150909031657-73d445a93680/go.mod"
	"github.com/ghodss/yaml v1.0.0/go.mod"
	"github.com/ghodss/yaml v1.0.1-0.20190212211648-25d852aebe32"
	"github.com/ghodss/yaml v1.0.1-0.20190212211648-25d852aebe32/go.mod"
	"github.com/go-kit/kit v0.8.0/go.mod"
	"github.com/go-kit/kit v0.9.0/go.mod"
	"github.com/go-kit/kit v0.10.0/go.mod"
	"github.com/go-logfmt/logfmt v0.3.0/go.mod"
	"github.com/go-logfmt/logfmt v0.4.0/go.mod"
	"github.com/go-logfmt/logfmt v0.5.0/go.mod"
	"github.com/go-logr/logr v0.1.0/go.mod"
	"github.com/go-logr/logr v0.2.0"
	"github.com/go-logr/logr v0.2.0/go.mod"
	"github.com/go-openapi/jsonpointer v0.0.0-20160704185906-46af16f9f7b1/go.mod"
	"github.com/go-openapi/jsonreference v0.0.0-20160704190145-13c6e3589ad9/go.mod"
	"github.com/go-openapi/spec v0.0.0-20160808142527-6aced65f8501/go.mod"
	"github.com/go-openapi/swag v0.0.0-20160704191624-1d0bd113de87/go.mod"
	"github.com/go-redis/redis/v8 v8.2.3"
	"github.com/go-redis/redis/v8 v8.2.3/go.mod"
	"github.com/go-sql-driver/mysql v1.4.0/go.mod"
	"github.com/go-stack/stack v1.8.0/go.mod"
	"github.com/gogo/googleapis v1.1.0/go.mod"
	"github.com/gogo/protobuf v1.1.1/go.mod"
	"github.com/gogo/protobuf v1.2.0/go.mod"
	"github.com/gogo/protobuf v1.2.1/go.mod"
	"github.com/gogo/protobuf v1.3.1/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/groupcache v0.0.0-20160516000752-02826c3e7903/go.mod"
	"github.com/golang/groupcache v0.0.0-20190129154638-5b532d6fd5ef/go.mod"
	"github.com/golang/groupcache v0.0.0-20190702054246-869f871628b6/go.mod"
	"github.com/golang/groupcache v0.0.0-20191227052852-215e87163ea7"
	"github.com/golang/groupcache v0.0.0-20191227052852-215e87163ea7/go.mod"
	"github.com/golang/mock v1.1.1/go.mod"
	"github.com/golang/mock v1.2.0/go.mod"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.3.2/go.mod"
	"github.com/golang/protobuf v1.3.3/go.mod"
	"github.com/golang/protobuf v1.3.4/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1.0.20200221234624-67d41d38c208/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.2/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.4.0.20200313231945-b860323f09d0/go.mod"
	"github.com/golang/protobuf v1.4.0/go.mod"
	"github.com/golang/protobuf v1.4.1/go.mod"
	"github.com/golang/protobuf v1.4.2/go.mod"
	"github.com/golang/protobuf v1.4.3"
	"github.com/golang/protobuf v1.4.3/go.mod"
	"github.com/golang/snappy v0.0.0-20180518054509-2e65f85255db/go.mod"
	"github.com/gomodule/redigo v1.7.1-0.20190322064113-39e2c31b7ca3/go.mod"
	"github.com/gomodule/redigo v1.8.1"
	"github.com/gomodule/redigo v1.8.1/go.mod"
	"github.com/google/btree v0.0.0-20180813153112-4030bb1f1f0c/go.mod"
	"github.com/google/btree v1.0.0/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-cmp v0.3.0/go.mod"
	"github.com/google/go-cmp v0.3.1/go.mod"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/google/go-cmp v0.5.1"
	"github.com/google/go-cmp v0.5.1/go.mod"
	"github.com/google/gofuzz v1.0.0/go.mod"
	"github.com/google/gofuzz v1.1.0/go.mod"
	"github.com/google/martian v2.1.0+incompatible/go.mod"
	"github.com/google/pprof v0.0.0-20181206194817-3ea8567a2e57/go.mod"
	"github.com/google/renameio v0.1.0/go.mod"
	"github.com/google/uuid v1.0.0/go.mod"
	"github.com/google/uuid v1.1.1/go.mod"
	"github.com/google/uuid v1.2.0"
	"github.com/google/uuid v1.2.0/go.mod"
	"github.com/googleapis/gax-go/v2 v2.0.4/go.mod"
	"github.com/googleapis/gax-go/v2 v2.0.5"
	"github.com/googleapis/gax-go/v2 v2.0.5/go.mod"
	"github.com/googleapis/gnostic v0.4.1/go.mod"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1/go.mod"
	"github.com/gorilla/context v1.1.1/go.mod"
	"github.com/gorilla/mux v1.6.2/go.mod"
	"github.com/gorilla/mux v1.7.3/go.mod"
	"github.com/gorilla/websocket v0.0.0-20170926233335-4201258b820c/go.mod"
	"github.com/gorilla/websocket v1.4.0/go.mod"
	"github.com/grpc-ecosystem/go-grpc-middleware v1.0.0/go.mod"
	"github.com/grpc-ecosystem/go-grpc-middleware v1.0.1-0.20190118093823-f849b5445de4/go.mod"
	"github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0/go.mod"
	"github.com/grpc-ecosystem/grpc-gateway v1.9.0/go.mod"
	"github.com/grpc-ecosystem/grpc-gateway v1.9.5/go.mod"
	"github.com/hashicorp/consul/api v1.3.0/go.mod"
	"github.com/hashicorp/consul/sdk v0.3.0/go.mod"
	"github.com/hashicorp/errwrap v1.0.0/go.mod"
	"github.com/hashicorp/go-cleanhttp v0.5.1/go.mod"
	"github.com/hashicorp/go-immutable-radix v1.0.0/go.mod"
	"github.com/hashicorp/go-msgpack v0.5.3/go.mod"
	"github.com/hashicorp/go-multierror v1.0.0/go.mod"
	"github.com/hashicorp/go-rootcerts v1.0.0/go.mod"
	"github.com/hashicorp/go-sockaddr v1.0.0/go.mod"
	"github.com/hashicorp/go-syslog v1.0.0/go.mod"
	"github.com/hashicorp/go-uuid v1.0.0/go.mod"
	"github.com/hashicorp/go-uuid v1.0.1/go.mod"
	"github.com/hashicorp/go-version v1.2.0/go.mod"
	"github.com/hashicorp/go.net v0.0.1/go.mod"
	"github.com/hashicorp/golang-lru v0.5.0/go.mod"
	"github.com/hashicorp/golang-lru v0.5.1/go.mod"
	"github.com/hashicorp/hcl v1.0.0"
	"github.com/hashicorp/hcl v1.0.0/go.mod"
	"github.com/hashicorp/logutils v1.0.0/go.mod"
	"github.com/hashicorp/mdns v1.0.0/go.mod"
	"github.com/hashicorp/memberlist v0.1.3/go.mod"
	"github.com/hashicorp/serf v0.8.2/go.mod"
	"github.com/hpcloud/tail v1.0.0/go.mod"
	"github.com/hudl/fargo v1.3.0/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.0/go.mod"
	"github.com/influxdata/influxdb1-client v0.0.0-20191209144304-8bf82d3c094d/go.mod"
	"github.com/jmespath/go-jmespath v0.0.0-20180206201540-c2b33e8439af/go.mod"
	"github.com/jonboulle/clockwork v0.1.0/go.mod"
	"github.com/jpillora/backoff v1.0.0/go.mod"
	"github.com/json-iterator/go v1.1.6/go.mod"
	"github.com/json-iterator/go v1.1.7/go.mod"
	"github.com/json-iterator/go v1.1.8/go.mod"
	"github.com/json-iterator/go v1.1.9/go.mod"
	"github.com/json-iterator/go v1.1.10/go.mod"
	"github.com/jstemmer/go-junit-report v0.0.0-20190106144839-af01ea7f8024/go.mod"
	"github.com/jtolds/gls v4.20.0+incompatible"
	"github.com/jtolds/gls v4.20.0+incompatible/go.mod"
	"github.com/julienschmidt/httprouter v1.2.0/go.mod"
	"github.com/julienschmidt/httprouter v1.3.0/go.mod"
	"github.com/justinas/alice v1.2.0"
	"github.com/justinas/alice v1.2.0/go.mod"
	"github.com/kisielk/errcheck v1.1.0/go.mod"
	"github.com/kisielk/errcheck v1.2.0/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.3/go.mod"
	"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pretty v0.2.0"
	"github.com/kr/pretty v0.2.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/lightstep/lightstep-tracer-common/golang/gogo v0.0.0-20190605223551-bc2310a04743/go.mod"
	"github.com/lightstep/lightstep-tracer-go v0.18.1/go.mod"
	"github.com/lyft/protoc-gen-validate v0.0.13/go.mod"
	"github.com/magiconair/properties v1.8.1"
	"github.com/magiconair/properties v1.8.1/go.mod"
	"github.com/mailru/easyjson v0.0.0-20160728113105-d5b7844b561a/go.mod"
	"github.com/matryer/is v1.2.0"
	"github.com/matryer/is v1.2.0/go.mod"
	"github.com/mattn/go-colorable v0.0.9/go.mod"
	"github.com/mattn/go-isatty v0.0.3/go.mod"
	"github.com/mattn/go-isatty v0.0.4/go.mod"
	"github.com/mattn/go-runewidth v0.0.2/go.mod"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod"
	"github.com/mbland/hmacauth v0.0.0-20170912233209-44256dfd4bfa"
	"github.com/mbland/hmacauth v0.0.0-20170912233209-44256dfd4bfa/go.mod"
	"github.com/miekg/dns v1.0.14/go.mod"
	"github.com/mitchellh/cli v1.0.0/go.mod"
	"github.com/mitchellh/go-homedir v1.0.0/go.mod"
	"github.com/mitchellh/go-testing-interface v1.0.0/go.mod"
	"github.com/mitchellh/gox v0.4.0/go.mod"
	"github.com/mitchellh/iochan v1.0.0/go.mod"
	"github.com/mitchellh/mapstructure v0.0.0-20160808181253-ca63d7c062ee/go.mod"
	"github.com/mitchellh/mapstructure v1.1.2"
	"github.com/mitchellh/mapstructure v1.1.2/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742/go.mod"
	"github.com/modern-go/reflect2 v1.0.1/go.mod"
	"github.com/munnerz/goautoneg v0.0.0-20120707110453-a547fc61f48d/go.mod"
	"github.com/mwitkow/go-conntrack v0.0.0-20161129095857-cc309e4a2223/go.mod"
	"github.com/mwitkow/go-conntrack v0.0.0-20190716064945-2f068394615f/go.mod"
	"github.com/mxk/go-flowrate v0.0.0-20140419014527-cca7078d478f/go.mod"
	"github.com/nats-io/jwt v0.3.0/go.mod"
	"github.com/nats-io/jwt v0.3.2/go.mod"
	"github.com/nats-io/nats-server/v2 v2.1.2/go.mod"
	"github.com/nats-io/nats.go v1.9.1/go.mod"
	"github.com/nats-io/nkeys v0.1.0/go.mod"
	"github.com/nats-io/nkeys v0.1.3/go.mod"
	"github.com/nats-io/nuid v1.0.1/go.mod"
	"github.com/nxadm/tail v1.4.4"
	"github.com/nxadm/tail v1.4.4/go.mod"
	"github.com/oauth2-proxy/tools/reference-gen v0.0.0-20210118095127-56ffd7384404"
	"github.com/oauth2-proxy/tools/reference-gen v0.0.0-20210118095127-56ffd7384404/go.mod"
	"github.com/oklog/oklog v0.3.2/go.mod"
	"github.com/oklog/run v1.0.0/go.mod"
	"github.com/oklog/ulid v1.3.1/go.mod"
	"github.com/olekukonko/tablewriter v0.0.0-20170122224234-a0225b3f23b5/go.mod"
	"github.com/onsi/ginkgo v0.0.0-20170829012221-11459a886d9c/go.mod"
	"github.com/onsi/ginkgo v1.6.0/go.mod"
	"github.com/onsi/ginkgo v1.7.0/go.mod"
	"github.com/onsi/ginkgo v1.11.0/go.mod"
	"github.com/onsi/ginkgo v1.12.1/go.mod"
	"github.com/onsi/ginkgo v1.14.1"
	"github.com/onsi/ginkgo v1.14.1/go.mod"
	"github.com/onsi/gomega v0.0.0-20170829124025-dcabb60a477c/go.mod"
	"github.com/onsi/gomega v1.4.3/go.mod"
	"github.com/onsi/gomega v1.7.0/go.mod"
	"github.com/onsi/gomega v1.7.1/go.mod"
	"github.com/onsi/gomega v1.10.1/go.mod"
	"github.com/onsi/gomega v1.10.2"
	"github.com/onsi/gomega v1.10.2/go.mod"
	"github.com/op/go-logging v0.0.0-20160315200505-970db520ece7/go.mod"
	"github.com/opentracing-contrib/go-observer v0.0.0-20170622124052-a52f23424492/go.mod"
	"github.com/opentracing/basictracer-go v1.0.0/go.mod"
	"github.com/opentracing/opentracing-go v1.0.2/go.mod"
	"github.com/opentracing/opentracing-go v1.1.0/go.mod"
	"github.com/openzipkin-contrib/zipkin-go-opentracing v0.4.5/go.mod"
	"github.com/openzipkin/zipkin-go v0.1.6/go.mod"
	"github.com/openzipkin/zipkin-go v0.2.1/go.mod"
	"github.com/openzipkin/zipkin-go v0.2.2/go.mod"
	"github.com/pact-foundation/pact-go v1.0.4/go.mod"
	"github.com/pascaldekloe/goe v0.0.0-20180627143212-57f6aae5913c/go.mod"
	"github.com/pborman/uuid v1.2.0/go.mod"
	"github.com/pelletier/go-toml v1.2.0"
	"github.com/pelletier/go-toml v1.2.0/go.mod"
	"github.com/performancecopilot/speed v3.0.0+incompatible/go.mod"
	"github.com/pierrec/lz4 v1.0.2-0.20190131084431-473cd7ce01a1/go.mod"
	"github.com/pierrec/lz4 v2.0.5+incompatible/go.mod"
	"github.com/pierrec/lz4 v2.5.2+incompatible"
	"github.com/pierrec/lz4 v2.5.2+incompatible/go.mod"
	"github.com/pkg/errors v0.8.0/go.mod"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pkg/profile v1.2.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/posener/complete v1.1.1/go.mod"
	"github.com/pquerna/cachecontrol v0.0.0-20180517163645-1555304b9b35"
	"github.com/pquerna/cachecontrol v0.0.0-20180517163645-1555304b9b35/go.mod"
	"github.com/prometheus/client_golang v0.9.1/go.mod"
	"github.com/prometheus/client_golang v0.9.3-0.20190127221311-3c4408c8b829/go.mod"
	"github.com/prometheus/client_golang v0.9.3/go.mod"
	"github.com/prometheus/client_golang v1.0.0/go.mod"
	"github.com/prometheus/client_golang v1.3.0/go.mod"
	"github.com/prometheus/client_golang v1.7.1/go.mod"
	"github.com/prometheus/client_golang v1.9.0"
	"github.com/prometheus/client_golang v1.9.0/go.mod"
	"github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190115171406-56726106282f/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190812154241-14fe0d1b01d4/go.mod"
	"github.com/prometheus/client_model v0.1.0/go.mod"
	"github.com/prometheus/client_model v0.2.0"
	"github.com/prometheus/client_model v0.2.0/go.mod"
	"github.com/prometheus/common v0.0.0-20181113130724-41aa239b4cce/go.mod"
	"github.com/prometheus/common v0.2.0/go.mod"
	"github.com/prometheus/common v0.4.0/go.mod"
	"github.com/prometheus/common v0.4.1/go.mod"
	"github.com/prometheus/common v0.7.0/go.mod"
	"github.com/prometheus/common v0.10.0/go.mod"
	"github.com/prometheus/common v0.15.0"
	"github.com/prometheus/common v0.15.0/go.mod"
	"github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d/go.mod"
	"github.com/prometheus/procfs v0.0.0-20190117184657-bf6a532e95b1/go.mod"
	"github.com/prometheus/procfs v0.0.0-20190507164030-5867b95ac084/go.mod"
	"github.com/prometheus/procfs v0.0.2/go.mod"
	"github.com/prometheus/procfs v0.0.8/go.mod"
	"github.com/prometheus/procfs v0.1.3/go.mod"
	"github.com/prometheus/procfs v0.2.0"
	"github.com/prometheus/procfs v0.2.0/go.mod"
	"github.com/prometheus/tsdb v0.7.1/go.mod"
	"github.com/rcrowley/go-metrics v0.0.0-20181016184325-3113b8401b8a/go.mod"
	"github.com/rogpeppe/fastuuid v0.0.0-20150106093220-6724a57986af/go.mod"
	"github.com/rogpeppe/go-internal v1.3.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.0.1/go.mod"
	"github.com/ryanuber/columnize v0.0.0-20160712163229-9b3edd62028f/go.mod"
	"github.com/samuel/go-zookeeper v0.0.0-20190923202752-2cc03de413da/go.mod"
	"github.com/sean-/seed v0.0.0-20170313163322-e2103e2c3529/go.mod"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0/go.mod"
	"github.com/sirupsen/logrus v1.2.0/go.mod"
	"github.com/sirupsen/logrus v1.4.2/go.mod"
	"github.com/sirupsen/logrus v1.6.0/go.mod"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d/go.mod"
	"github.com/smartystreets/goconvey v1.6.4"
	"github.com/smartystreets/goconvey v1.6.4/go.mod"
	"github.com/soheilhy/cmux v0.1.4/go.mod"
	"github.com/sony/gobreaker v0.4.1/go.mod"
	"github.com/spaolacci/murmur3 v0.0.0-20180118202830-f09979ecbc72/go.mod"
	"github.com/spf13/afero v1.1.2"
	"github.com/spf13/afero v1.1.2/go.mod"
	"github.com/spf13/cast v1.3.0"
	"github.com/spf13/cast v1.3.0/go.mod"
	"github.com/spf13/cobra v0.0.3/go.mod"
	"github.com/spf13/jwalterweatherman v1.0.0"
	"github.com/spf13/jwalterweatherman v1.0.0/go.mod"
	"github.com/spf13/pflag v0.0.0-20170130214245-9ff6c6923cff/go.mod"
	"github.com/spf13/pflag v1.0.1/go.mod"
	"github.com/spf13/pflag v1.0.3/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/spf13/viper v1.6.3"
	"github.com/spf13/viper v1.6.3/go.mod"
	"github.com/streadway/amqp v0.0.0-20190404075320-75d898a42a94/go.mod"
	"github.com/streadway/amqp v0.0.0-20190827072141-edfb9018d271/go.mod"
	"github.com/streadway/handy v0.0.0-20190108123426-d5acb3125c2a/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.1.1"
	"github.com/stretchr/objx v0.1.1/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/stretchr/testify v1.6.1"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/subosito/gotenv v1.2.0"
	"github.com/subosito/gotenv v1.2.0/go.mod"
	"github.com/tmc/grpc-websocket-proxy v0.0.0-20170815181823-89b8d40f7ca8/go.mod"
	"github.com/tmc/grpc-websocket-proxy v0.0.0-20190109142713-0ad062ec5ee5/go.mod"
	"github.com/urfave/cli v1.20.0/go.mod"
	"github.com/urfave/cli v1.22.1/go.mod"
	"github.com/vmihailenco/msgpack/v4 v4.3.11"
	"github.com/vmihailenco/msgpack/v4 v4.3.11/go.mod"
	"github.com/vmihailenco/tagparser v0.1.1"
	"github.com/vmihailenco/tagparser v0.1.1/go.mod"
	"github.com/xiang90/probing v0.0.0-20190116061207-43a291ad63a2/go.mod"
	"github.com/xordataexchange/crypt v0.0.3-0.20170626215501-b2862e3d0a77/go.mod"
	"github.com/yhat/wsutil v0.0.0-20170731153501-1d66fa95c997"
	"github.com/yhat/wsutil v0.0.0-20170731153501-1d66fa95c997/go.mod"
	"github.com/yuin/goldmark v1.1.27/go.mod"
	"github.com/yuin/gopher-lua v0.0.0-20190206043414-8bfc7677f583/go.mod"
	"github.com/yuin/gopher-lua v0.0.0-20191213034115-f46add6fdb5c/go.mod"
	"github.com/yuin/gopher-lua v0.0.0-20191220021717-ab39c6098bdb"
	"github.com/yuin/gopher-lua v0.0.0-20191220021717-ab39c6098bdb/go.mod"
	"go.etcd.io/bbolt v1.3.2/go.mod"
	"go.etcd.io/bbolt v1.3.3/go.mod"
	"go.etcd.io/etcd v0.0.0-20191023171146-3cf2f69b5738/go.mod"
	"go.opencensus.io v0.20.1/go.mod"
	"go.opencensus.io v0.20.2/go.mod"
	"go.opencensus.io v0.21.0/go.mod"
	"go.opencensus.io v0.22.2"
	"go.opencensus.io v0.22.2/go.mod"
	"go.opentelemetry.io/otel v0.11.0"
	"go.opentelemetry.io/otel v0.11.0/go.mod"
	"go.uber.org/atomic v1.3.2/go.mod"
	"go.uber.org/atomic v1.4.0/go.mod"
	"go.uber.org/atomic v1.5.0/go.mod"
	"go.uber.org/multierr v1.1.0/go.mod"
	"go.uber.org/multierr v1.3.0/go.mod"
	"go.uber.org/tools v0.0.0-20190618225709-2cfd321de3ee/go.mod"
	"go.uber.org/zap v1.10.0/go.mod"
	"go.uber.org/zap v1.13.0/go.mod"
	"golang.org/x/crypto v0.0.0-20180904163835-0709b304e793/go.mod"
	"golang.org/x/crypto v0.0.0-20181029021203-45a5f77698d3/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
	"golang.org/x/crypto v0.0.0-20190701094942-4def268fd1a4/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/exp v0.0.0-20190121172915-509febef88a4/go.mod"
	"golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3/go.mod"
	"golang.org/x/lint v0.0.0-20190227174305-5b3e6a55c961/go.mod"
	"golang.org/x/lint v0.0.0-20190301231843-5614ed5bae6f/go.mod"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3/go.mod"
	"golang.org/x/lint v0.0.0-20190409202823-959b441ac422/go.mod"
	"golang.org/x/lint v0.0.0-20190930215403-16217165b5de/go.mod"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/mod v0.2.0"
	"golang.org/x/mod v0.2.0/go.mod"
	"golang.org/x/net v0.0.0-20180724234803-3673e40ba225/go.mod"
	"golang.org/x/net v0.0.0-20180826012351-8a410e7b638d/go.mod"
	"golang.org/x/net v0.0.0-20180906233101-161cd47e91fd/go.mod"
	"golang.org/x/net v0.0.0-20181023162649-9b4f9f5ad519/go.mod"
	"golang.org/x/net v0.0.0-20181114220301-adae6a3d119a/go.mod"
	"golang.org/x/net v0.0.0-20181201002055-351d144fa1fc/go.mod"
	"golang.org/x/net v0.0.0-20181220203305-927f97764cc3/go.mod"
	"golang.org/x/net v0.0.0-20190108225652-1e06a53dbb7e/go.mod"
	"golang.org/x/net v0.0.0-20190125091013-d26f9f9a57f3/go.mod"
	"golang.org/x/net v0.0.0-20190213061140-3a22650c66bd/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190503192946-f4e77d36d62c/go.mod"
	"golang.org/x/net v0.0.0-20190522155817-f3200d17e092/go.mod"
	"golang.org/x/net v0.0.0-20190603091049-60506f45cf65/go.mod"
	"golang.org/x/net v0.0.0-20190613194153-d28f0bde5980/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20190813141303-74dc4d7220e7/go.mod"
	"golang.org/x/net v0.0.0-20200226121028-0de0cce0169b/go.mod"
	"golang.org/x/net v0.0.0-20200301022130-244492dfa37a/go.mod"
	"golang.org/x/net v0.0.0-20200324143707-d3edc9973b7e/go.mod"
	"golang.org/x/net v0.0.0-20200520004742-59133d7f0dd7/go.mod"
	"golang.org/x/net v0.0.0-20200625001655-4c5254603344/go.mod"
	"golang.org/x/net v0.0.0-20200707034311-ab3426394381"
	"golang.org/x/net v0.0.0-20200707034311-ab3426394381/go.mod"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190226205417-e64efc72b421/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45/go.mod"
	"golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d"
	"golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190227155943-e225da77a7e6/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
	"golang.org/x/sync v0.0.0-20201207232520-09787c993a3a"
	"golang.org/x/sync v0.0.0-20201207232520-09787c993a3a/go.mod"
	"golang.org/x/sys v0.0.0-20180823144017-11551d06cbcc/go.mod"
	"golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod"
	"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod"
	"golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e/go.mod"
	"golang.org/x/sys v0.0.0-20181026203630-95b1ffbd15a5/go.mod"
	"golang.org/x/sys v0.0.0-20181107165924-66b7b1311ac8/go.mod"
	"golang.org/x/sys v0.0.0-20181116152217-5ac8a444bdc5/go.mod"
	"golang.org/x/sys v0.0.0-20181122145206-62eef0e2fa9b/go.mod"
	"golang.org/x/sys v0.0.0-20190204203706-41f3e6584952/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190422165155-953cdadca894/go.mod"
	"golang.org/x/sys v0.0.0-20190502145724-3ef323f4f1fd/go.mod"
	"golang.org/x/sys v0.0.0-20190507160741-ecd444e8653b/go.mod"
	"golang.org/x/sys v0.0.0-20190726091711-fc99dfbffb4e/go.mod"
	"golang.org/x/sys v0.0.0-20190826190057-c7b8b68b1456/go.mod"
	"golang.org/x/sys v0.0.0-20190904154756-749cb33beabd/go.mod"
	"golang.org/x/sys v0.0.0-20191005200804-aed5e4c7ecf9/go.mod"
	"golang.org/x/sys v0.0.0-20191120155948-bd437916bb0e/go.mod"
	"golang.org/x/sys v0.0.0-20191220142924-d4481acd189f/go.mod"
	"golang.org/x/sys v0.0.0-20200106162015-b016eb3dc98e/go.mod"
	"golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
	"golang.org/x/sys v0.0.0-20200519105757-fe76b779f299/go.mod"
	"golang.org/x/sys v0.0.0-20200615200032-f1bc736245b1/go.mod"
	"golang.org/x/sys v0.0.0-20200622214017-ed371f2e16b4/go.mod"
	"golang.org/x/sys v0.0.0-20200625212154-ddb9806d33ae/go.mod"
	"golang.org/x/sys v0.0.0-20201214210602-f9fddec55a1e"
	"golang.org/x/sys v0.0.0-20201214210602-f9fddec55a1e/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.1-0.20180807135948-17ff2d5776d2/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/text v0.3.3"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/time v0.0.0-20180412165947-fbb02b2291d2/go.mod"
	"golang.org/x/time v0.0.0-20181108054448-85acf8d2951c/go.mod"
	"golang.org/x/time v0.0.0-20190308202827-9d24e82272b4/go.mod"
	"golang.org/x/time v0.0.0-20191024005414-555d28b269f0/go.mod"
	"golang.org/x/tools v0.0.0-20180221164845-07fd8470d635/go.mod"
	"golang.org/x/tools v0.0.0-20180828015842-6cd1fcedba52/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20181011042414-1f849cf54d09/go.mod"
	"golang.org/x/tools v0.0.0-20181030221726-6c7e314b6563/go.mod"
	"golang.org/x/tools v0.0.0-20190114222345-bf090417da8b/go.mod"
	"golang.org/x/tools v0.0.0-20190226205152-f727befe758c/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190312170243-e65039ee4138/go.mod"
	"golang.org/x/tools v0.0.0-20190328211700-ab21143f2384/go.mod"
	"golang.org/x/tools v0.0.0-20190524140312-2c0ae7006135/go.mod"
	"golang.org/x/tools v0.0.0-20190621195816-6e04913cbbac/go.mod"
	"golang.org/x/tools v0.0.0-20191029041327-9cc4af7d6b2c/go.mod"
	"golang.org/x/tools v0.0.0-20191029190741-b9c20aec41a5/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20200103221440-774c71fcf114/go.mod"
	"golang.org/x/tools v0.0.0-20200505023115-26f46d2f7ef8"
	"golang.org/x/tools v0.0.0-20200505023115-26f46d2f7ef8/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"google.golang.org/api v0.3.1/go.mod"
	"google.golang.org/api v0.4.0/go.mod"
	"google.golang.org/api v0.20.0"
	"google.golang.org/api v0.20.0/go.mod"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/appengine v1.2.0/go.mod"
	"google.golang.org/appengine v1.4.0/go.mod"
	"google.golang.org/appengine v1.5.0/go.mod"
	"google.golang.org/appengine v1.6.5"
	"google.golang.org/appengine v1.6.5/go.mod"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod"
	"google.golang.org/genproto v0.0.0-20190307195333-5fe7a883aa19/go.mod"
	"google.golang.org/genproto v0.0.0-20190418145605-e7d98fc518a7/go.mod"
	"google.golang.org/genproto v0.0.0-20190425155659-357c62f0e4bb/go.mod"
	"google.golang.org/genproto v0.0.0-20190530194941-fb225487d101/go.mod"
	"google.golang.org/genproto v0.0.0-20190819201941-24fa4b261c55/go.mod"
	"google.golang.org/genproto v0.0.0-20200526211855-cb27e3aa2013"
	"google.golang.org/genproto v0.0.0-20200526211855-cb27e3aa2013/go.mod"
	"google.golang.org/grpc v1.17.0/go.mod"
	"google.golang.org/grpc v1.19.0/go.mod"
	"google.golang.org/grpc v1.20.0/go.mod"
	"google.golang.org/grpc v1.20.1/go.mod"
	"google.golang.org/grpc v1.21.0/go.mod"
	"google.golang.org/grpc v1.22.1/go.mod"
	"google.golang.org/grpc v1.23.0/go.mod"
	"google.golang.org/grpc v1.23.1/go.mod"
	"google.golang.org/grpc v1.26.0/go.mod"
	"google.golang.org/grpc v1.27.0"
	"google.golang.org/grpc v1.27.0/go.mod"
	"google.golang.org/protobuf v0.0.0-20200109180630-ec00e32a8dfd/go.mod"
	"google.golang.org/protobuf v0.0.0-20200221191635-4d8936d0db64/go.mod"
	"google.golang.org/protobuf v0.0.0-20200228230310-ab0ca4ff8a60/go.mod"
	"google.golang.org/protobuf v1.20.1-0.20200309200217-e05f789c0967/go.mod"
	"google.golang.org/protobuf v1.21.0/go.mod"
	"google.golang.org/protobuf v1.22.0/go.mod"
	"google.golang.org/protobuf v1.23.0/go.mod"
	"google.golang.org/protobuf v1.23.1-0.20200526195155-81db48ad09cc/go.mod"
	"google.golang.org/protobuf v1.24.0"
	"google.golang.org/protobuf v1.24.0/go.mod"
	"gopkg.in/alecthomas/kingpin.v2 v2.2.6/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/cheggaaa/pb.v1 v1.0.25/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/fsnotify.v1 v1.4.7/go.mod"
	"gopkg.in/gcfg.v1 v1.2.3/go.mod"
	"gopkg.in/inf.v0 v0.9.1/go.mod"
	"gopkg.in/ini.v1 v1.51.0"
	"gopkg.in/ini.v1 v1.51.0/go.mod"
	"gopkg.in/natefinch/lumberjack.v2 v2.0.0"
	"gopkg.in/natefinch/lumberjack.v2 v2.0.0/go.mod"
	"gopkg.in/resty.v1 v1.12.0/go.mod"
	"gopkg.in/square/go-jose.v2 v2.4.1"
	"gopkg.in/square/go-jose.v2 v2.4.1/go.mod"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod"
	"gopkg.in/warnings.v0 v0.1.2/go.mod"
	"gopkg.in/yaml.v2 v2.0.0-20170812160011-eb3733d160e7/go.mod"
	"gopkg.in/yaml.v2 v2.2.1/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.4/go.mod"
	"gopkg.in/yaml.v2 v2.2.5/go.mod"
	"gopkg.in/yaml.v2 v2.2.8/go.mod"
	"gopkg.in/yaml.v2 v2.3.0"
	"gopkg.in/yaml.v2 v2.3.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"honnef.co/go/tools v0.0.0-20180728063816-88497007e858/go.mod"
	"honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod"
	"honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod"
	"honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod"
	"honnef.co/go/tools v0.0.1-2019.2.3/go.mod"
	"k8s.io/apimachinery v0.19.3"
	"k8s.io/apimachinery v0.19.3/go.mod"
	"k8s.io/gengo v0.0.0-20200413195148-3a45101e95ac/go.mod"
	"k8s.io/gengo v0.0.0-20201113003025-83324d819ded"
	"k8s.io/gengo v0.0.0-20201113003025-83324d819ded/go.mod"
	"k8s.io/klog/v2 v2.0.0/go.mod"
	"k8s.io/klog/v2 v2.2.0/go.mod"
	"k8s.io/klog/v2 v2.4.0"
	"k8s.io/klog/v2 v2.4.0/go.mod"
	"k8s.io/kube-openapi v0.0.0-20200805222855-6aeccd4b50c6/go.mod"
	"sigs.k8s.io/structured-merge-diff/v4 v4.0.1/go.mod"
	"sigs.k8s.io/yaml v1.1.0/go.mod"
	"sigs.k8s.io/yaml v1.2.0/go.mod"
	"sourcegraph.com/sourcegraph/appdash v0.0.0-20190731080439-ebfcffb1b5c0/go.mod"
)

go-module_set_globals

SRC_URI+="
	${EGO_SUM_SRC_URI}
"

src_install() {
	dobin "${WORKDIR}"/${P}/${PN}
	newinitd "${FILESDIR}"/${PN}-${PV}.initd "${PN}"
}
