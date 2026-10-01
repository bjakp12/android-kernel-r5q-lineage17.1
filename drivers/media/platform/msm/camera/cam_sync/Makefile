ccflags-y += -Idrivers/media/platform/msm/camera/cam_utils
# Ancient-LTS: self -I so cam_sync_util.h -> <cam_sync_api.h> (angle include)
# resolves when building cam_sync objects here.
ccflags-y += -Idrivers/media/platform/msm/camera/cam_sync

obj-$(CONFIG_SPECTRA_CAMERA) += cam_sync.o cam_sync_util.o
