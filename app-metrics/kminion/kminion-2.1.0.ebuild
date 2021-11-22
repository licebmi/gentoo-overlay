# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="Prometheus Exporter for Apache Kafka - KMinion"
HOMEPAGE="https://github.com/cloudhut/kminion"
SRC_URI="https://github.com/cloudhut/kminion/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"

SLOT="0"

IUSE=""

EGO_SUM=(
	"cloud.google.com/go v0.26.0/go.mod"
	"cloud.google.com/go v0.34.0/go.mod"
	"github.com/BurntSushi/toml v0.3.1"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/Knetic/govaluate v3.0.1-0.20171022003610-9aa49832a739+incompatible/go.mod"
	"github.com/Shopify/sarama v1.19.0/go.mod"
	"github.com/Shopify/toxiproxy v2.1.4+incompatible/go.mod"
	"github.com/VividCortex/gohistogram v1.0.0/go.mod"
	"github.com/afex/hystrix-go v0.0.0-20180502004556-fa1af6a1f4f5/go.mod"
	"github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc/go.mod"
	"github.com/alecthomas/template v0.0.0-20190718012654-fb15b899a751/go.mod"
	"github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf/go.mod"
	"github.com/alecthomas/units v0.0.0-20190717042225-c3de453c63f4/go.mod"
	"github.com/alecthomas/units v0.0.0-20190924025748-f65c72e2690d/go.mod"
	"github.com/apache/thrift v0.12.0/go.mod"
	"github.com/apache/thrift v0.13.0/go.mod"
	"github.com/armon/circbuf v0.0.0-20150827004946-bbbad097214e/go.mod"
	"github.com/armon/go-metrics v0.0.0-20180917152333-f0300d1749da/go.mod"
	"github.com/armon/go-radix v0.0.0-20180808171621-7fddfc383310/go.mod"
	"github.com/aryann/difflib v0.0.0-20170710044230-e206f873d14a/go.mod"
	"github.com/aws/aws-lambda-go v1.13.3/go.mod"
	"github.com/aws/aws-sdk-go v1.27.0/go.mod"
	"github.com/aws/aws-sdk-go-v2 v0.18.0/go.mod"
	"github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973/go.mod"
	"github.com/beorn7/perks v1.0.0/go.mod"
	"github.com/beorn7/perks v1.0.1"
	"github.com/beorn7/perks v1.0.1/go.mod"
	"github.com/bgentry/speakeasy v0.1.0/go.mod"
	"github.com/casbin/casbin/v2 v2.1.2/go.mod"
	"github.com/cenkalti/backoff v2.2.1+incompatible/go.mod"
	"github.com/census-instrumentation/opencensus-proto v0.2.1/go.mod"
	"github.com/cespare/xxhash/v2 v2.1.1"
	"github.com/cespare/xxhash/v2 v2.1.1/go.mod"
	"github.com/clbanning/x2j v0.0.0-20191024224557-825249438eec/go.mod"
	"github.com/client9/misspell v0.3.4/go.mod"
	"github.com/cockroachdb/datadriven v0.0.0-20190809214429-80d97fb3cbaa/go.mod"
	"github.com/codahale/hdrhistogram v0.0.0-20161010025455-3a0bb77429bd/go.mod"
	"github.com/coreos/go-semver v0.2.0/go.mod"
	"github.com/coreos/go-systemd v0.0.0-20180511133405-39ca1b05acc7/go.mod"
	"github.com/coreos/pkg v0.0.0-20160727233714-3ac0863d7acf/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d/go.mod"
	"github.com/creack/pty v1.1.7/go.mod"
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dgrijalva/jwt-go v3.2.0+incompatible/go.mod"
	"github.com/dustin/go-humanize v0.0.0-20171111073723-bb3d318650d4/go.mod"
	"github.com/eapache/go-resiliency v1.1.0/go.mod"
	"github.com/eapache/go-xerial-snappy v0.0.0-20180814174437-776d5712da21/go.mod"
	"github.com/eapache/queue v1.1.0/go.mod"
	"github.com/edsrzf/mmap-go v1.0.0/go.mod"
	"github.com/envoyproxy/go-control-plane v0.6.9/go.mod"
	"github.com/envoyproxy/go-control-plane v0.9.1-0.20191026205805-5f8ba28d4473/go.mod"
	"github.com/envoyproxy/protoc-gen-validate v0.1.0/go.mod"
	"github.com/fatih/color v1.7.0/go.mod"
	"github.com/fatih/structs v1.1.0/go.mod"
	"github.com/franela/goblin v0.0.0-20200105215937-c9ffbefa60db/go.mod"
	"github.com/franela/goreq v0.0.0-20171204163338-bcd34c9993f8/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/fsnotify/fsnotify v1.4.9"
	"github.com/fsnotify/fsnotify v1.4.9/go.mod"
	"github.com/ghodss/yaml v1.0.0/go.mod"
	"github.com/go-kit/kit v0.8.0/go.mod"
	"github.com/go-kit/kit v0.9.0/go.mod"
	"github.com/go-kit/kit v0.10.0/go.mod"
	"github.com/go-ldap/ldap v3.0.2+incompatible/go.mod"
	"github.com/go-logfmt/logfmt v0.3.0/go.mod"
	"github.com/go-logfmt/logfmt v0.4.0/go.mod"
	"github.com/go-logfmt/logfmt v0.5.0/go.mod"
	"github.com/go-sql-driver/mysql v1.4.0/go.mod"
	"github.com/go-stack/stack v1.8.0/go.mod"
	"github.com/go-test/deep v1.0.2-0.20181118220953-042da051cf31/go.mod"
	"github.com/gogo/googleapis v1.1.0/go.mod"
	"github.com/gogo/protobuf v1.1.1/go.mod"
	"github.com/gogo/protobuf v1.2.0/go.mod"
	"github.com/gogo/protobuf v1.2.1/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/groupcache v0.0.0-20160516000752-02826c3e7903/go.mod"
	"github.com/golang/groupcache v0.0.0-20190702054246-869f871628b6/go.mod"
	"github.com/golang/mock v1.1.1/go.mod"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.3.2/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1.0.20200221234624-67d41d38c208/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.2/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.4.0.20200313231945-b860323f09d0/go.mod"
	"github.com/golang/protobuf v1.4.0/go.mod"
	"github.com/golang/protobuf v1.4.2/go.mod"
	"github.com/golang/protobuf v1.4.3/go.mod"
	"github.com/golang/protobuf v1.5.0/go.mod"
	"github.com/golang/protobuf v1.5.2"
	"github.com/golang/protobuf v1.5.2/go.mod"
	"github.com/golang/snappy v0.0.0-20180518054509-2e65f85255db/go.mod"
	"github.com/golang/snappy v0.0.1/go.mod"
	"github.com/golang/snappy v0.0.3"
	"github.com/golang/snappy v0.0.3/go.mod"
	"github.com/google/btree v0.0.0-20180813153112-4030bb1f1f0c/go.mod"
	"github.com/google/btree v1.0.0/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-cmp v0.3.0/go.mod"
	"github.com/google/go-cmp v0.3.1/go.mod"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/google/go-cmp v0.5.4/go.mod"
	"github.com/google/go-cmp v0.5.5"
	"github.com/google/go-cmp v0.5.5/go.mod"
	"github.com/google/gofuzz v1.0.0/go.mod"
	"github.com/google/renameio v0.1.0/go.mod"
	"github.com/google/uuid v1.0.0/go.mod"
	"github.com/google/uuid v1.2.0"
	"github.com/google/uuid v1.2.0/go.mod"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1/go.mod"
	"github.com/gorilla/context v1.1.1/go.mod"
	"github.com/gorilla/mux v1.6.2/go.mod"
	"github.com/gorilla/mux v1.7.3/go.mod"
	"github.com/gorilla/securecookie v1.1.1"
	"github.com/gorilla/securecookie v1.1.1/go.mod"
	"github.com/gorilla/sessions v1.2.1"
	"github.com/gorilla/sessions v1.2.1/go.mod"
	"github.com/gorilla/websocket v0.0.0-20170926233335-4201258b820c/go.mod"
	"github.com/grpc-ecosystem/go-grpc-middleware v1.0.1-0.20190118093823-f849b5445de4/go.mod"
	"github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0/go.mod"
	"github.com/grpc-ecosystem/grpc-gateway v1.9.5/go.mod"
	"github.com/hashicorp/consul/api v1.3.0/go.mod"
	"github.com/hashicorp/consul/sdk v0.3.0/go.mod"
	"github.com/hashicorp/errwrap v1.0.0/go.mod"
	"github.com/hashicorp/go-cleanhttp v0.5.0/go.mod"
	"github.com/hashicorp/go-cleanhttp v0.5.1/go.mod"
	"github.com/hashicorp/go-hclog v0.0.0-20180709165350-ff2cf002a8dd/go.mod"
	"github.com/hashicorp/go-hclog v0.8.0/go.mod"
	"github.com/hashicorp/go-immutable-radix v1.0.0/go.mod"
	"github.com/hashicorp/go-msgpack v0.5.3/go.mod"
	"github.com/hashicorp/go-multierror v1.0.0/go.mod"
	"github.com/hashicorp/go-plugin v1.0.1/go.mod"
	"github.com/hashicorp/go-retryablehttp v0.5.4/go.mod"
	"github.com/hashicorp/go-rootcerts v1.0.0/go.mod"
	"github.com/hashicorp/go-rootcerts v1.0.1/go.mod"
	"github.com/hashicorp/go-sockaddr v1.0.0/go.mod"
	"github.com/hashicorp/go-sockaddr v1.0.2/go.mod"
	"github.com/hashicorp/go-syslog v1.0.0/go.mod"
	"github.com/hashicorp/go-uuid v1.0.0/go.mod"
	"github.com/hashicorp/go-uuid v1.0.1/go.mod"
	"github.com/hashicorp/go-uuid v1.0.2"
	"github.com/hashicorp/go-uuid v1.0.2/go.mod"
	"github.com/hashicorp/go-version v1.1.0/go.mod"
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
	"github.com/hashicorp/vault/api v1.0.4/go.mod"
	"github.com/hashicorp/vault/sdk v0.1.13/go.mod"
	"github.com/hashicorp/yamux v0.0.0-20180604194846-3520598351bb/go.mod"
	"github.com/hashicorp/yamux v0.0.0-20181012175058-2f1d1f20f75d/go.mod"
	"github.com/hpcloud/tail v1.0.0/go.mod"
	"github.com/hudl/fargo v1.3.0/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.0/go.mod"
	"github.com/influxdata/influxdb1-client v0.0.0-20191209144304-8bf82d3c094d/go.mod"
	"github.com/jcmturner/aescts/v2 v2.0.0"
	"github.com/jcmturner/aescts/v2 v2.0.0/go.mod"
	"github.com/jcmturner/dnsutils/v2 v2.0.0"
	"github.com/jcmturner/dnsutils/v2 v2.0.0/go.mod"
	"github.com/jcmturner/gofork v1.0.0"
	"github.com/jcmturner/gofork v1.0.0/go.mod"
	"github.com/jcmturner/goidentity/v6 v6.0.1"
	"github.com/jcmturner/goidentity/v6 v6.0.1/go.mod"
	"github.com/jcmturner/gokrb5/v8 v8.4.2"
	"github.com/jcmturner/gokrb5/v8 v8.4.2/go.mod"
	"github.com/jcmturner/rpc/v2 v2.0.3"
	"github.com/jcmturner/rpc/v2 v2.0.3/go.mod"
	"github.com/jmespath/go-jmespath v0.0.0-20180206201540-c2b33e8439af/go.mod"
	"github.com/joho/godotenv v1.3.0"
	"github.com/joho/godotenv v1.3.0/go.mod"
	"github.com/jonboulle/clockwork v0.1.0/go.mod"
	"github.com/jpillora/backoff v1.0.0/go.mod"
	"github.com/json-iterator/go v1.1.6/go.mod"
	"github.com/json-iterator/go v1.1.7/go.mod"
	"github.com/json-iterator/go v1.1.8/go.mod"
	"github.com/json-iterator/go v1.1.10/go.mod"
	"github.com/jtolds/gls v4.20.0+incompatible/go.mod"
	"github.com/julienschmidt/httprouter v1.2.0/go.mod"
	"github.com/julienschmidt/httprouter v1.3.0/go.mod"
	"github.com/kisielk/errcheck v1.1.0/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/klauspost/compress v1.12.1"
	"github.com/klauspost/compress v1.12.1/go.mod"
	"github.com/knadh/koanf v0.16.0"
	"github.com/knadh/koanf v0.16.0/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.3/go.mod"
	"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pretty v0.2.1"
	"github.com/kr/pretty v0.2.1/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/lightstep/lightstep-tracer-common/golang/gogo v0.0.0-20190605223551-bc2310a04743/go.mod"
	"github.com/lightstep/lightstep-tracer-go v0.18.1/go.mod"
	"github.com/lyft/protoc-gen-validate v0.0.13/go.mod"
	"github.com/mattn/go-colorable v0.0.9/go.mod"
	"github.com/mattn/go-isatty v0.0.3/go.mod"
	"github.com/mattn/go-isatty v0.0.4/go.mod"
	"github.com/mattn/go-runewidth v0.0.2/go.mod"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod"
	"github.com/miekg/dns v1.0.14/go.mod"
	"github.com/mitchellh/cli v1.0.0/go.mod"
	"github.com/mitchellh/copystructure v1.0.0/go.mod"
	"github.com/mitchellh/copystructure v1.1.1/go.mod"
	"github.com/mitchellh/copystructure v1.1.2"
	"github.com/mitchellh/copystructure v1.1.2/go.mod"
	"github.com/mitchellh/go-homedir v1.0.0/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/mitchellh/go-testing-interface v0.0.0-20171004221916-a61a99592b77/go.mod"
	"github.com/mitchellh/go-testing-interface v1.0.0/go.mod"
	"github.com/mitchellh/go-wordwrap v1.0.0/go.mod"
	"github.com/mitchellh/gox v0.4.0/go.mod"
	"github.com/mitchellh/iochan v1.0.0/go.mod"
	"github.com/mitchellh/mapstructure v0.0.0-20160808181253-ca63d7c062ee/go.mod"
	"github.com/mitchellh/mapstructure v1.1.2/go.mod"
	"github.com/mitchellh/mapstructure v1.2.2/go.mod"
	"github.com/mitchellh/mapstructure v1.4.1"
	"github.com/mitchellh/mapstructure v1.4.1/go.mod"
	"github.com/mitchellh/reflectwalk v1.0.0/go.mod"
	"github.com/mitchellh/reflectwalk v1.0.1"
	"github.com/mitchellh/reflectwalk v1.0.1/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742/go.mod"
	"github.com/modern-go/reflect2 v1.0.1/go.mod"
	"github.com/mwitkow/go-conntrack v0.0.0-20161129095857-cc309e4a2223/go.mod"
	"github.com/mwitkow/go-conntrack v0.0.0-20190716064945-2f068394615f/go.mod"
	"github.com/nats-io/jwt v0.3.0/go.mod"
	"github.com/nats-io/jwt v0.3.2/go.mod"
	"github.com/nats-io/nats-server/v2 v2.1.2/go.mod"
	"github.com/nats-io/nats.go v1.9.1/go.mod"
	"github.com/nats-io/nkeys v0.1.0/go.mod"
	"github.com/nats-io/nkeys v0.1.3/go.mod"
	"github.com/nats-io/nuid v1.0.1/go.mod"
	"github.com/oklog/oklog v0.3.2/go.mod"
	"github.com/oklog/run v1.0.0/go.mod"
	"github.com/olekukonko/tablewriter v0.0.0-20170122224234-a0225b3f23b5/go.mod"
	"github.com/onsi/ginkgo v1.6.0/go.mod"
	"github.com/onsi/ginkgo v1.7.0/go.mod"
	"github.com/onsi/gomega v1.4.3/go.mod"
	"github.com/op/go-logging v0.0.0-20160315200505-970db520ece7/go.mod"
	"github.com/opentracing-contrib/go-observer v0.0.0-20170622124052-a52f23424492/go.mod"
	"github.com/opentracing/basictracer-go v1.0.0/go.mod"
	"github.com/opentracing/opentracing-go v1.0.2/go.mod"
	"github.com/opentracing/opentracing-go v1.1.0/go.mod"
	"github.com/openzipkin-contrib/zipkin-go-opentracing v0.4.5/go.mod"
	"github.com/openzipkin/zipkin-go v0.1.6/go.mod"
	"github.com/openzipkin/zipkin-go v0.2.1/go.mod"
	"github.com/openzipkin/zipkin-go v0.2.2/go.mod"
	"github.com/orcaman/concurrent-map v0.0.0-20210106121528-16402b402231"
	"github.com/orcaman/concurrent-map v0.0.0-20210106121528-16402b402231/go.mod"
	"github.com/pact-foundation/pact-go v1.0.4/go.mod"
	"github.com/pascaldekloe/goe v0.0.0-20180627143212-57f6aae5913c/go.mod"
	"github.com/pascaldekloe/goe v0.1.0/go.mod"
	"github.com/pborman/uuid v1.2.0/go.mod"
	"github.com/pelletier/go-toml v1.7.0/go.mod"
	"github.com/pelletier/go-toml v1.8.1"
	"github.com/pelletier/go-toml v1.8.1/go.mod"
	"github.com/performancecopilot/speed v3.0.0+incompatible/go.mod"
	"github.com/pierrec/lz4 v1.0.2-0.20190131084431-473cd7ce01a1/go.mod"
	"github.com/pierrec/lz4 v2.0.5+incompatible"
	"github.com/pierrec/lz4 v2.0.5+incompatible/go.mod"
	"github.com/pierrec/lz4/v4 v4.1.6"
	"github.com/pierrec/lz4/v4 v4.1.6/go.mod"
	"github.com/pkg/errors v0.8.0/go.mod"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pkg/profile v1.2.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/posener/complete v1.1.1/go.mod"
	"github.com/prometheus/client_golang v0.9.1/go.mod"
	"github.com/prometheus/client_golang v0.9.3-0.20190127221311-3c4408c8b829/go.mod"
	"github.com/prometheus/client_golang v1.0.0/go.mod"
	"github.com/prometheus/client_golang v1.3.0/go.mod"
	"github.com/prometheus/client_golang v1.7.1/go.mod"
	"github.com/prometheus/client_golang v1.10.0"
	"github.com/prometheus/client_golang v1.10.0/go.mod"
	"github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190115171406-56726106282f/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190812154241-14fe0d1b01d4/go.mod"
	"github.com/prometheus/client_model v0.1.0/go.mod"
	"github.com/prometheus/client_model v0.2.0"
	"github.com/prometheus/client_model v0.2.0/go.mod"
	"github.com/prometheus/common v0.2.0/go.mod"
	"github.com/prometheus/common v0.4.1/go.mod"
	"github.com/prometheus/common v0.7.0/go.mod"
	"github.com/prometheus/common v0.10.0/go.mod"
	"github.com/prometheus/common v0.18.0/go.mod"
	"github.com/prometheus/common v0.20.0"
	"github.com/prometheus/common v0.20.0/go.mod"
	"github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d/go.mod"
	"github.com/prometheus/procfs v0.0.0-20190117184657-bf6a532e95b1/go.mod"
	"github.com/prometheus/procfs v0.0.2/go.mod"
	"github.com/prometheus/procfs v0.0.8/go.mod"
	"github.com/prometheus/procfs v0.1.3/go.mod"
	"github.com/prometheus/procfs v0.6.0"
	"github.com/prometheus/procfs v0.6.0/go.mod"
	"github.com/rcrowley/go-metrics v0.0.0-20181016184325-3113b8401b8a/go.mod"
	"github.com/rhnvrm/simples3 v0.6.1/go.mod"
	"github.com/rogpeppe/fastuuid v0.0.0-20150106093220-6724a57986af/go.mod"
	"github.com/rogpeppe/go-internal v1.3.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.0.1/go.mod"
	"github.com/ryanuber/columnize v0.0.0-20160712163229-9b3edd62028f/go.mod"
	"github.com/ryanuber/columnize v2.1.0+incompatible/go.mod"
	"github.com/ryanuber/go-glob v1.0.0/go.mod"
	"github.com/samuel/go-zookeeper v0.0.0-20190923202752-2cc03de413da/go.mod"
	"github.com/sean-/seed v0.0.0-20170313163322-e2103e2c3529/go.mod"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0/go.mod"
	"github.com/sirupsen/logrus v1.2.0/go.mod"
	"github.com/sirupsen/logrus v1.4.2/go.mod"
	"github.com/sirupsen/logrus v1.6.0/go.mod"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d/go.mod"
	"github.com/smartystreets/goconvey v1.6.4/go.mod"
	"github.com/soheilhy/cmux v0.1.4/go.mod"
	"github.com/sony/gobreaker v0.4.1/go.mod"
	"github.com/spf13/cobra v0.0.3/go.mod"
	"github.com/spf13/pflag v1.0.1/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/streadway/amqp v0.0.0-20190404075320-75d898a42a94/go.mod"
	"github.com/streadway/amqp v0.0.0-20190827072141-edfb9018d271/go.mod"
	"github.com/streadway/handy v0.0.0-20190108123426-d5acb3125c2a/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.1.1/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/stretchr/testify v1.7.0"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/tmc/grpc-websocket-proxy v0.0.0-20170815181823-89b8d40f7ca8/go.mod"
	"github.com/twmb/franz-go v0.6.12"
	"github.com/twmb/franz-go v0.6.12/go.mod"
	"github.com/twmb/go-rbtree v1.0.0"
	"github.com/twmb/go-rbtree v1.0.0/go.mod"
	"github.com/urfave/cli v1.20.0/go.mod"
	"github.com/urfave/cli v1.22.1/go.mod"
	"github.com/xiang90/probing v0.0.0-20190116061207-43a291ad63a2/go.mod"
	"github.com/yuin/goldmark v1.2.1/go.mod"
	"go.etcd.io/bbolt v1.3.3/go.mod"
	"go.etcd.io/etcd v0.0.0-20191023171146-3cf2f69b5738/go.mod"
	"go.opencensus.io v0.20.1/go.mod"
	"go.opencensus.io v0.20.2/go.mod"
	"go.opencensus.io v0.22.2/go.mod"
	"go.uber.org/atomic v1.3.2/go.mod"
	"go.uber.org/atomic v1.5.0/go.mod"
	"go.uber.org/atomic v1.6.0/go.mod"
	"go.uber.org/atomic v1.7.0"
	"go.uber.org/atomic v1.7.0/go.mod"
	"go.uber.org/multierr v1.1.0/go.mod"
	"go.uber.org/multierr v1.3.0/go.mod"
	"go.uber.org/multierr v1.5.0/go.mod"
	"go.uber.org/multierr v1.6.0"
	"go.uber.org/multierr v1.6.0/go.mod"
	"go.uber.org/tools v0.0.0-20190618225709-2cfd321de3ee/go.mod"
	"go.uber.org/zap v1.10.0/go.mod"
	"go.uber.org/zap v1.13.0/go.mod"
	"go.uber.org/zap v1.16.0"
	"go.uber.org/zap v1.16.0/go.mod"
	"golang.org/x/crypto v0.0.0-20180904163835-0709b304e793/go.mod"
	"golang.org/x/crypto v0.0.0-20181029021203-45a5f77698d3/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
	"golang.org/x/crypto v0.0.0-20190701094942-4def268fd1a4/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/crypto v0.0.0-20201112155050-0c6587e931a9/go.mod"
	"golang.org/x/crypto v0.0.0-20210415154028-4f45737414dc"
	"golang.org/x/crypto v0.0.0-20210415154028-4f45737414dc/go.mod"
	"golang.org/x/exp v0.0.0-20190121172915-509febef88a4/go.mod"
	"golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3/go.mod"
	"golang.org/x/lint v0.0.0-20190227174305-5b3e6a55c961/go.mod"
	"golang.org/x/lint v0.0.0-20190301231843-5614ed5bae6f/go.mod"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3/go.mod"
	"golang.org/x/lint v0.0.0-20190930215403-16217165b5de/go.mod"
	"golang.org/x/lint v0.0.0-20201208152925-83fdc39ff7b5"
	"golang.org/x/lint v0.0.0-20201208152925-83fdc39ff7b5/go.mod"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/mod v0.3.0/go.mod"
	"golang.org/x/mod v0.4.1"
	"golang.org/x/mod v0.4.1/go.mod"
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
	"golang.org/x/net v0.0.0-20190603091049-60506f45cf65/go.mod"
	"golang.org/x/net v0.0.0-20190613194153-d28f0bde5980/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20190813141303-74dc4d7220e7/go.mod"
	"golang.org/x/net v0.0.0-20200114155413-6afb5195e5aa/go.mod"
	"golang.org/x/net v0.0.0-20200625001655-4c5254603344/go.mod"
	"golang.org/x/net v0.0.0-20201021035429-f5854403a974/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20210415231046-e915ea6b2b7d"
	"golang.org/x/net v0.0.0-20210415231046-e915ea6b2b7d/go.mod"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190226205417-e64efc72b421/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190227155943-e225da77a7e6/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
	"golang.org/x/sync v0.0.0-20201020160332-67f06af15bc9/go.mod"
	"golang.org/x/sync v0.0.0-20201207232520-09787c993a3a/go.mod"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c/go.mod"
	"golang.org/x/sys v0.0.0-20180823144017-11551d06cbcc/go.mod"
	"golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod"
	"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod"
	"golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e/go.mod"
	"golang.org/x/sys v0.0.0-20181026203630-95b1ffbd15a5/go.mod"
	"golang.org/x/sys v0.0.0-20181107165924-66b7b1311ac8/go.mod"
	"golang.org/x/sys v0.0.0-20181116152217-5ac8a444bdc5/go.mod"
	"golang.org/x/sys v0.0.0-20181122145206-62eef0e2fa9b/go.mod"
	"golang.org/x/sys v0.0.0-20190129075346-302c3dd5f1cc/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190403152447-81d4e9dc473e/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190422165155-953cdadca894/go.mod"
	"golang.org/x/sys v0.0.0-20190502145724-3ef323f4f1fd/go.mod"
	"golang.org/x/sys v0.0.0-20190726091711-fc99dfbffb4e/go.mod"
	"golang.org/x/sys v0.0.0-20190826190057-c7b8b68b1456/go.mod"
	"golang.org/x/sys v0.0.0-20191005200804-aed5e4c7ecf9/go.mod"
	"golang.org/x/sys v0.0.0-20191220142924-d4481acd189f/go.mod"
	"golang.org/x/sys v0.0.0-20200106162015-b016eb3dc98e/go.mod"
	"golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
	"golang.org/x/sys v0.0.0-20200331124033-c3d80250170d/go.mod"
	"golang.org/x/sys v0.0.0-20200615200032-f1bc736245b1/go.mod"
	"golang.org/x/sys v0.0.0-20200625212154-ddb9806d33ae/go.mod"
	"golang.org/x/sys v0.0.0-20200930185726-fdedc70b468f/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210119212857-b64e53b001e4/go.mod"
	"golang.org/x/sys v0.0.0-20210124154548-22da62e12c0c/go.mod"
	"golang.org/x/sys v0.0.0-20210309074719-68d13333faf2/go.mod"
	"golang.org/x/sys v0.0.0-20210330210617-4fbd30eecc44/go.mod"
	"golang.org/x/sys v0.0.0-20210414055047-fe65e336abe0"
	"golang.org/x/sys v0.0.0-20210414055047-fe65e336abe0/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.1-0.20181227161524-e6919f6577db/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/time v0.0.0-20180412165947-fbb02b2291d2/go.mod"
	"golang.org/x/time v0.0.0-20190308202827-9d24e82272b4/go.mod"
	"golang.org/x/time v0.0.0-20191024005414-555d28b269f0/go.mod"
	"golang.org/x/tools v0.0.0-20180221164845-07fd8470d635/go.mod"
	"golang.org/x/tools v0.0.0-20180828015842-6cd1fcedba52/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
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
	"golang.org/x/tools v0.0.0-20200130002326-2f3ba24bd6e7/go.mod"
	"golang.org/x/tools v0.1.0"
	"golang.org/x/tools v0.1.0/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"google.golang.org/api v0.3.1/go.mod"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/appengine v1.2.0/go.mod"
	"google.golang.org/appengine v1.4.0/go.mod"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod"
	"google.golang.org/genproto v0.0.0-20190307195333-5fe7a883aa19/go.mod"
	"google.golang.org/genproto v0.0.0-20190404172233-64821d5d2107/go.mod"
	"google.golang.org/genproto v0.0.0-20190425155659-357c62f0e4bb/go.mod"
	"google.golang.org/genproto v0.0.0-20190530194941-fb225487d101/go.mod"
	"google.golang.org/genproto v0.0.0-20190819201941-24fa4b261c55/go.mod"
	"google.golang.org/grpc v1.14.0/go.mod"
	"google.golang.org/grpc v1.17.0/go.mod"
	"google.golang.org/grpc v1.19.0/go.mod"
	"google.golang.org/grpc v1.20.0/go.mod"
	"google.golang.org/grpc v1.20.1/go.mod"
	"google.golang.org/grpc v1.21.0/go.mod"
	"google.golang.org/grpc v1.22.0/go.mod"
	"google.golang.org/grpc v1.22.1/go.mod"
	"google.golang.org/grpc v1.23.0/go.mod"
	"google.golang.org/grpc v1.23.1/go.mod"
	"google.golang.org/grpc v1.26.0/go.mod"
	"google.golang.org/protobuf v0.0.0-20200109180630-ec00e32a8dfd/go.mod"
	"google.golang.org/protobuf v0.0.0-20200221191635-4d8936d0db64/go.mod"
	"google.golang.org/protobuf v0.0.0-20200228230310-ab0ca4ff8a60/go.mod"
	"google.golang.org/protobuf v1.20.1-0.20200309200217-e05f789c0967/go.mod"
	"google.golang.org/protobuf v1.21.0/go.mod"
	"google.golang.org/protobuf v1.23.0/go.mod"
	"google.golang.org/protobuf v1.26.0-rc.1/go.mod"
	"google.golang.org/protobuf v1.26.0"
	"google.golang.org/protobuf v1.26.0/go.mod"
	"gopkg.in/alecthomas/kingpin.v2 v2.2.6/go.mod"
	"gopkg.in/asn1-ber.v1 v1.0.0-20181015200546-f715ec2f112d/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c/go.mod"
	"gopkg.in/cheggaaa/pb.v1 v1.0.25/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/fsnotify.v1 v1.4.7/go.mod"
	"gopkg.in/gcfg.v1 v1.2.3/go.mod"
	"gopkg.in/resty.v1 v1.12.0/go.mod"
	"gopkg.in/square/go-jose.v2 v2.3.1/go.mod"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod"
	"gopkg.in/warnings.v0 v0.1.2/go.mod"
	"gopkg.in/yaml.v2 v2.0.0-20170812160011-eb3733d160e7/go.mod"
	"gopkg.in/yaml.v2 v2.2.1/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.4/go.mod"
	"gopkg.in/yaml.v2 v2.2.5/go.mod"
	"gopkg.in/yaml.v2 v2.2.8/go.mod"
	"gopkg.in/yaml.v2 v2.3.0/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b"
	"gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b/go.mod"
	"honnef.co/go/tools v0.0.0-20180728063816-88497007e858/go.mod"
	"honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod"
	"honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod"
	"honnef.co/go/tools v0.0.1-2019.2.3/go.mod"
	"honnef.co/go/tools v0.1.1"
	"honnef.co/go/tools v0.1.1/go.mod"
	"sigs.k8s.io/yaml v1.1.0/go.mod"
	"sourcegraph.com/sourcegraph/appdash v0.0.0-20190731080439-ebfcffb1b5c0/go.mod"
)

go-module_set_globals

SRC_URI+="
${EGO_SUM_SRC_URI}
"

src_compile() {
	go build || die "build failed"
}

src_install() {
	dobin ${PN}
	dodoc README.md docs/{metrics.md,reference-config.yaml}

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
}

