PROJECT = rabbitmq_peer_discovery_common
PROJECT_DESCRIPTION = Modules shared by various peer discovery backends
PROJECT_MOD = rabbit_peer_discovery_common_app

LOCAL_DEPS = inets
DEPS = rabbit_common rabbit
TEST_DEPS = rabbitmq_ct_helpers rabbitmq_ct_client_helpers ct_helper
dep_ct_helper = git https://github.com/extend/ct_helper.git master

DEP_EARLY_PLUGINS = rabbit_common/mk/rabbitmq-early-plugin.mk
DEP_PLUGINS = rabbit_common/mk/rabbitmq-plugin.mk

include ../../rabbitmq-components.mk
include ../../erlang.mk
