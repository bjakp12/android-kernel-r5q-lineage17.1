ccflags-y += -Idrivers/media/platform/msm/camera/cam_utils
ccflags-y += -Idrivers/media/platform/msm/camera/cam_cpas/include
# Ancient-LTS: self -I so cam_sensor_i2c.h -> "cam_cci_dev.h" resolves
# when building cam_cci objects here.
ccflags-y += -Idrivers/media/platform/msm/camera/cam_sensor_module/cam_cci
ccflags-y += -Idrivers/media/platform/msm/camera/cam_sensor_module/cam_sensor_io
ccflags-y += -Idrivers/media/platform/msm/camera/cam_sensor_module/cam_sensor_utils
ccflags-y += -Idrivers/media/platform/msm/camera/cam_req_mgr
ccflags-y += -Idrivers/media/platform/msm/camera/cam_smmu/

obj-$(CONFIG_SPECTRA_CAMERA) += cam_cci_dev.o cam_cci_core.o cam_cci_soc.o
