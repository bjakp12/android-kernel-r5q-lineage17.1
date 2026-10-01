ccflags-y += -Idrivers/media/platform/msm/camera/cam_req_mgr
ccflags-y += -Idrivers/media/platform/msm/camera/cam_smmu/
ccflags-y += -Idrivers/media/platform/msm/camera/cam_sync
ccflags-y += -Idrivers/media/platform/msm/camera/cam_utils
# Ancient-LTS: cam_trace.h (cam_utils) includes cam_context.h from this dir;
# quoted re-include needs the defining dir on the path (same pattern as
# cam_utils self -I).
ccflags-y += -Idrivers/media/platform/msm/camera/cam_core

obj-$(CONFIG_SPECTRA_CAMERA) += cam_context.o cam_context_utils.o cam_node.o cam_subdev.o
