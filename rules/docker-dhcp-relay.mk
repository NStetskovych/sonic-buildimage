# Docker image for DHCP relay

DOCKER_DHCP_RELAY_STEM = docker-dhcp-relay
DOCKER_DHCP_RELAY = $(DOCKER_DHCP_RELAY_STEM).gz
DOCKER_DHCP_RELAY_DBG = $(DOCKER_DHCP_RELAY_STEM)-$(DBG_IMAGE_MARK).gz

$(DOCKER_DHCP_RELAY)_PATH = $(DOCKERS_PATH)/$(DOCKER_DHCP_RELAY_STEM)

$(DOCKER_DHCP_RELAY)_DEPENDS += $(ISC_DHCP_RELAY) $(REDIS_TOOLS)
$(DOCKER_DHCP_RELAY)_DBG_DEPENDS = $($(DOCKER_CONFIG_ENGINE_STRETCH)_DBG_DEPENDS)
$(DOCKER_DHCP_RELAY)_DBG_IMAGE_PACKAGES = $($(DOCKER_CONFIG_ENGINE_STRETCH)_DBG_IMAGE_PACKAGES)

$(DOCKER_DHCP_RELAY)_LOAD_DOCKERS = $(DOCKER_CONFIG_ENGINE_STRETCH)

SONIC_DOCKER_IMAGES += $(DOCKER_DHCP_RELAY)
SONIC_INSTALL_DOCKER_IMAGES += $(DOCKER_DHCP_RELAY)
SONIC_STRETCH_DOCKERS += $(DOCKER_DHCP_RELAY)

SONIC_DOCKER_DBG_IMAGES += $(DOCKER_DHCP_RELAY_DBG)
SONIC_INSTALL_DOCKER_DBG_IMAGES += $(DOCKER_DHCP_RELAY_DBG)
SONIC_STRETCH_DBG_DOCKERS += $(DOCKER_DHCP_RELAY_DBG)

$(DOCKER_DHCP_RELAY)_CONTAINER_NAME = dhcp_relay
$(DOCKER_DHCP_RELAY)_RUN_OPT += --net=host --privileged -t
$(DOCKER_DHCP_RELAY)_RUN_OPT += -v /etc/sonic:/etc/sonic:ro
