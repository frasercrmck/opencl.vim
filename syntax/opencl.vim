" Vim syntax file
" Language:	OpenCL (Open Computing Language)
" Developer:	Terence Ou (rivan_@msn.com)
" Maintainer:	Fraser Cormack (frasercrmck@gmail.com)
" Last Change:	28-November-2014

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  source <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
endif

" address space qualifiers
syn keyword clStorageClass   global __global local __local constant __constant private __private
" function qualifiers
syn keyword clStorageClass   kernel __kernel  __attribute__
syn keyword clStorageClass   read_only __read_only write_only __write_only
syn keyword clStorageClass   complex imaginary

" scalar types
syn keyword clType           bool uchar ushort uint ulong half quad

" vector types
syn keyword clType           char2 char3 char4 char8 char16
syn keyword clType           uchar2 uchar3 uchar4 uchar8 uchar16
syn keyword clType           short2 short3 short4 short8 short16
syn keyword clType           ushort2 ushort3 ushort4 ushort8 ushort16
syn keyword clType           int2 int3 int4 int8 int16
syn keyword clType           uint2 uint3 uint4 uint8 uint16
syn keyword clType           long2 long3 long4 long8 long16
syn keyword clType           ulong2 ulong3 ulong4 ulong8 ulong16
syn keyword clType           float2 float3 float4 float8 float16
syn keyword clType           double2 double3 double4 double8 double16
syn keyword clType           half2 half3 half4 half8 half16

" other types
syn keyword clType           ptrdiff_t intptr_t uintptr_t
syn keyword clType           image1d_t image2d_t image3d_t image1d_array_t image2d_array_t image1d_buffer_t
syn keyword clType           sampler_t event_t

" reserved types
syn keyword clType           bool2 bool3 bool4 bool8 bool16
syn keyword clType           quad2 quad3 quad4 quad8 quad16
syn match clType             "\(float\|double\)\(2\|3\|4\|8\|16\)x\(2\|3\|4\|8\|16\)"

" abstract data types
syn keyword clType           _cl_platform_id _cl_device_id _cl_context _cl_command_queue
syn keyword clType           _cl_mem _cl_program _cl_kernel _cl_event _cl_sampler

" image format descriptor structure
syn keyword clType           cl_image_format

syn keyword clCast           vec_type_hint work_group_size_hint aligned packed endian

" as_destType<n>
syn match clCast             "\vas_((u?(char|short|int|long))|float|double)(2|3|4|8|16)?\s*\("me=e-1,he=e-1

" convert_destType<n><_sat><_roundingMode>
syn match clCast             "\vconvert_((u?(char|short|int|long))|float|double)(2|3|4|8|16)?(_sat)?(_(rte|rtz|rtp|rtn))?\s*\("me=e-1,he=e-1

" work item functions
syn match clFunction         "get_work_dim\s*("me=e-1,he=e-1
syn match clFunction         "get_local_\(id\|size\)\s*("me=e-1,he=e-1
syn match clFunction         "get_global_\(id\|size\|offset\)\s*("me=e-1,he=e-1
syn match clFunction         "get_\(num_groups\|group_id\)\s*("me=e-1,he=e-1

" math functions
syn match clFunction         "a\?\(cos\|sin\|tan\)\(h\|pi\)\?\s*("me=e-1,he=e-1
syn match clFunction         "\(sincos\|atan2\|atan2pi\)\s*("me=e-1,he=e-1
syn match clFunction         "\(cbrt\|ceil\|copysign\)\s*("me=e-1,he=e-1
syn match clFunction         "erf\(c\)\?\s*("me=e-1,he=e-1
syn match clFunction         "exp\(2\|10\|m1\)\s*("me=e-1,he=e-1
syn match clFunction         "f\(abs\|dim\|loor\|ma\|max\|min\|mod\)\s*("me=e-1,he=e-1
syn match clFunction         "\(fract\|frexp\|hypot\|ilogb\)\s*("me=e-1,he=e-1
syn match clFunction         "\(ldexp\|lgamma\(_r\)\?\)\s*("me=e-1,he=e-1
syn match clFunction         "log\(2\|10\|1p\|b\)\s*("me=e-1,he=e-1
syn match clFunction         "\(mad\|modf\)\s*("me=e-1,he=e-1
syn match clFunction         "\(max\|min\)mag\s*("me=e-1,he=e-1
syn match clFunction         "\(nan\|nextafter\)\s*("me=e-1,he=e-1
syn match clFunction         "pow\(n\|r\)\?\s*("me=e-1,he=e-1
syn match clFunction         "\(remainder\|remquo\|rint\|rootn\|round\|sqrt\|rsqrt\)\s*("me=e-1,he=e-1
syn match clFunction         "\(tgamma\|trunc\)\s*("me=e-1,he=e-1

" half- and native-functions
syn match clFunction         "\(half_\|native_\)\(cos\|divide\|exp\|exp2\|exp10\|log\)\s*("me=e-1,he=e-1
syn match clFunction         "\(half_\|native_\)\(log2\|log10\|powr\|recip\|rsqrt\|sin\|sqrt\|tan\)\s*("me=e-1,he=e-1

" integer functions
syn match clFunction         "\(abs\(_diff\)\?\|add_sat\|r\?hadd\|clz\|mad_\(hi\|sat\)\)\s*("me=e-1,he=e-1
syn match clFunction         "\(max\|min\|mul_hi\|rotate\|sub_sat\|upsample\|mad24\|mul24\)\s*("me=e-1,he=e-1

" common functions
syn match clFunction         "\(clamp\|degrees\|max\|min\|mix\|radians\|step\|smoothstep\|sign\)\s*("me=e-1,he=e-1

" geometric functions
syn match clFunction         "\(cross\|dot\)\s*("me=e-1,he=e-1
syn match clFunction         "\(fast_\)\?\(distance\|length\|normalize\)\s*("me=e-1,he=e-1

" miscellaneous vector functions
syn match clFunction         "\(vec_step\|shuffle\|shuffle2\)\s*("me=e-1,he=e-1

" relational functions
syn match clFunction         "is\(finite\|inf\|nan\|normal\|ordered\|unordered\)\s*("me=e-1,he=e-1
syn match clFunction         "is\(\(not\)\?equal\|\(greater\|less\)\(equal\)\?\|lessgreater\)\s*("me=e-1,he=e-1
syn match clFunction         "\(signbit\|any\|all\|bitselect\|select\)\s*("me=e-1,he=e-1

" vector data load and store functions
syn match clFunction         "\(vload_half\|vstore_half\)\s*("me=e-1,he=e-1
syn match clFunction         "vload\(2\|3\|4\|8\|16\)\s*("me=e-1,he=e-1
syn match clFunction         "vload_half\(2\|3\|4\|8\|16\)\s*("me=e-1,he=e-1
syn match clFunction         "vloada_half\(2\|3\|4\|8\|16\)\s*("me=e-1,he=e-1
syn match clFunction         "vloada_half\(2\|3\|4\|8\|16\)_\(rte\|rtz\|rtp\)\s*("me=e-1,he=e-1
syn match clFunction         "vstore\(2\|3\|4\|8\|16\)\s*("me=e-1,he=e-1
syn match clFunction         "vstore\(rte\|rtz\|rtp\|rtn\)\s*("me=e-1,he=e-1
syn match clFunction         "vstore_half\(2\|3\|4\|8\|16\)\s*("me=e-1,he=e-1
syn match clFunction         "vstore_half_\(rte\|rtz\|rtp\|rtn\)\s*("me=e-1,he=e-1
syn match clFunction         "vstore_half\(2\|3\|4\|8\|16\)_\(rte\|rtz\|rtp\|rtn\)\s*("me=e-1,he=e-1
syn match clFunction         "vstorea_half\(2\|3\|4\|8\|16\)\s*("me=e-1,he=e-1
syn match clFunction         "vstorea_half\(2\|3\|4\|8\|16\)_\(rte\|rtz\|rtp\|rtn\)\s*("me=e-1,he=e-1

" image read and write functions
syn match clFunction         "read_image\(f\|i\|ui\|h\)\s*("me=e-1,he=e-1
syn match clFunction         "write_image\(f\|i\|ui\|h\)\s*("me=e-1,he=e-1
syn match clFunction         "get_image_\(width\|height\|depth\|array_size\)\s*("me=e-1,he=e-1
syn match clFunction         "get_image_\(dim\|channel_data_type\|channel_order\)\s*("me=e-1,he=e-1

" explicit memory fence functions
syn match clFunction         "\(barrier\|\(read_\|write_\)\?mem_fence\)\s*("me=e-1,he=e-1

" async copies from global to local mem to and fro and prefetch
syn match clFunction         "async_work_group_\(strided_\)\?copy\s*("me=e-1,he=e-1
syn match clFunction         "\(wait_group_events\|prefetch\)\s*("me=e-1,he=e-1

" atomic functions
syn match clFunction         "atom\(ic\)\?_\(add\|sub\|xchg\|inc\|dec\|cmpxchg\|min\|max\|and\|or\|xor\)\s*("me=e-1,he=e-1

syn keyword clConstant       MAXFLOAT HUGE_VAL HUGE_VALF INFINITY NAN

syn keyword clConstant       FLT_DIG FLT_MANT_DIG FLT_MAX_10_EXP FLT_MAX_EXP FLT_MIN_10_EXP
syn keyword clConstant       FLT_MIN_EXP FLT_RADIX FLT_MAX FLT_MIN FLT_EPSILON

syn keyword clConstant       DBL_DIG DBL_MANT_DIG DBL_MAX_10_EXP DBL_MAX_EXP DBL_MIN_10_EXP
syn keyword clConstant       DBL_MIN_EXP DBL_MAX DBL_MIN DBL_EPSILON

syn keyword clConstant       CHAR_BIT CHAR_MAX CHAR_MIN INT_MIN INT_MAX LONG_MAX LONG_MIN
syn keyword clConstant       SCHAR_MAX SCHAR_MIN SHRT_MAX SHRT_MIN UCHAR_MAX UCHAR_MIN UINT_MAX ULONG_MAX

syn keyword clConstant       M_E_F M_LOG2E_F M_LOG10E_F M_LN2_F M_LN10_F M_PI_F M_PI2_F M_PI4_F
syn keyword clConstant       M_1_PI_F M_2_PI_F M_2_SQRTPI_F M_SQRT2_F M_SQRT1_2_F

syn keyword clConstant       M_E M_LOG2E M_LOG10E M_LN2 M_LN10 M_PI M_PI2 M_PI4
syn keyword clConstant       M_1_PI M_2_PI M_2_SQRTPI M_SQRT2 M_SQRT1_2

syn keyword clConstant       CL_INTENSITY CL_RA CL_ARGB CL_BGRA CL_RGBA CL_R CL_RG
syn keyword clConstant       CL_RGB CL_RGx CL_RGBx CL_Rx CL_A CL_LUMINANCE

syn keyword clConstant       CL_SNORM_INT8 CL_SNORM_INT16 CL_UNORM_INT8 CL_UNORM_INT16 CL_UNORM_SHORT_565
syn keyword clConstant       CL_UNORM_SHORT_555 CL_UNORM_INT_101010 CL_SIGNED_INT8 CL_SIGNED_INT16 CL_SIGNED_INT32
syn keyword clConstant       CL_UNSIGNED_INT8 CL_UNSIGNED_INT16 CL_UNSIGNED_INT32 CL_HALF_FLOAT CL_FLOAT

syn keyword clConstant       CLK_ADDRESS_REPEAT CLK_ADDRESS_MIRRORED_REPEAT
syn keyword clConstant       CLK_ADDRESS_CLAMP CLK_ADDRESS_CLAMP_TO_EDGE CLK_ADDRESS_NONE

syn keyword clConstant       CLK_FILTER_NEAREST CLK_FILTER_LINEAR
syn keyword clConstant       CLK_NORMALIZED_COORDS_TRUE CLK_NORMALIZED_COORDS_FALSE
syn keyword clConstant       CLK_GLOBAL_MEM_FENCE CLK_LOCAL_MEM_FENCE

hi def link clStorageClass   StorageClass
hi def link clStructure      Structure
hi def link clType           Type
hi def link clVariable       Identifier
hi def link clConstant       Constant
hi def link clCast           Operator
hi def link clFunction       Function
hi def link clStatement      Statement

let b:current_syntax = "opencl"

" vim: ts=8
