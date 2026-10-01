# Ancient-LTS: cam_trace.h (cam_utils) includes cam_context.h (cam_core)
# and cam_req_mgr_core.h / cam_req_mgr_interface.h (cam_req_mgr);
# cam_sync_api.h (cam_sync, angle include) is pulled in by cam_core,
# cam_icp, cam_isp, cam_jpeg, cam_lrme. Export all of them to this dir
# and all subdirs.
subdir-ccflags-y += -Idrivers/media/platform/msm/camera/cam_core
subdir-ccflags-y += -Idrivers/media/platform/msm/camera/cam_utils
subdir-ccflags-y += -Idrivers/media/platform/msm/camera/cam_req_mgr
subdir-ccflags-y += -Idrivers/media/platform/msm/camera/cam_sync

obj-$(CONFIG_SPECTRA_CAMERA) += cam_req_mgr/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_hyp_intf/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_utils/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_core/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_sync/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_smmu/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_cpas/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_cdm/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_isp/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_sensor_module/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_icp/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_jpeg/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_fd/
obj-$(CONFIG_SPECTRA_CAMERA) += cam_lrme/
